WITH /*bbox AS (
    SELECT ST_Transform(
        ST_MakeEnvelope(
            4.84,  
            50.43, 
            4.92,  
            50.49, 
            4326   
        ),
        3857         ) AS zone -- ici on créer une zone d'étude (plus précisement dans la ville de Namur pour étudier les parkings) + ST_Transform pas besoin d'etre effectuée
),*/

parkings_campings AS (
    SELECT  -- sélection des parkings et campings OSM situés dans la zone d'étude
        osm_id,                  
        ST_MakeValid(way) AS geom -- reparation parking au cas ou il y aurait des bugs
    FROM planet_osm_polygon, bbox
    WHERE (
            amenity = 'parking'      -- selection parkings
         OR tourism = 'camp_site'    -- selection campings 
          )
      /*AND ST_Intersects(
            way,
            bbox.zone                -- uniquement ceux qui intersect la zone de Namur
          )*/
),

service_roads AS (
       SELECT 
        ST_MakeValid(way) AS geom -- réparation des routes au cas ou il y aurait des bugs
    FROM planet_osm_line, bbox
    WHERE highway = 'service'    -- routes qui ont le tag "service"
     /* AND ST_Intersects(
            way,
            bbox.zone )*/            -- routes uniquement présente dans la zone de Namur
),

parking_with_roads AS ( --- creation table temporaire + fusion des parkings/campings avec leurs routes de service associées
    SELECT 
        p.osm_id, 

        ST_Union( -- création d'une géom unique qui integre le parking et les routes
            ARRAY[ -- permet d'avoir plusieurs geoms dans le ST_union
                p.geom, 

                COALESCE( -- on récupère des portions de routes qui se trouvent dans un buffer de 5 mètres autour du parking et avec le ST_union on fait une forme qui lie à la fois le parking et à la fois les routes trouvées autours
                    ST_Union(
                        ST_Intersection(
                            r.geom,
                            ST_Buffer(p.geom, 5) -- zone d'influence du parking, on ne prend que la route qui est "utile" au parking et qui se retrouve donc dans un buffer de 5m autour
                        )
                    ),
                    p.geom -- valeur si aucune route n'existe, on reprend le parking lui même
                )
            ] -- tableau des geoms fermées
        ) AS geom -- geom finale par parking
    FROM parkings_campings p

    LEFT JOIN service_roads r -- jointure spatiale avec les routes de service proches, permet de voir si les routes "service" passent à moins de 3m d'un parking
        ON ST_Intersects(
            p.geom,
            ST_Buffer(r.geom, 3) -- si une route "service" passe à moins de 3m du parking, on considère qu'elle en fait partie
        )

        GROUP BY p.osm_id, p.geom -- agregation pour fusionner les parkings et les routes qui leurs sont associés
)

SELECT 
    osm_id AS cid, 
        ST_SimplifyPreserveTopology( -- ici on va nettoyer la géométrie
        ST_Buffer(
            geom,
            2,                  -- le buffer de 2 mètres permet d'arrondir les bords du parkings
            'join=round'     
        ),
        1                       -- permet de simplifier le résultat pour ne pas juste avoir un cercle "parfait" tout en gardant le côté arrondi amené par le buffer
    ) AS geom
FROM parking_with_roads


WHERE geom IS NOT NULL
  AND NOT ST_IsEmpty(geom); -- exclusion des géométries nulles ou vides
