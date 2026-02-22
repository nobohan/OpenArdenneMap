--- ROAD

WITH base AS (

    -- Sélection des autoroutes avec une référence
    SELECT
        ST_Transform(way, 3857) AS geom,  -- Passage en projection métrique
        ref                              -- Identifiant de l’axe routier
    FROM planet_osm_line
    WHERE highway = 'motorway'           -- Autoroutes uniquement
      AND highway NOT LIKE '%_link'      -- Exclusion des bretelles
      AND ref IS NOT NULL                -- Référence obligatoire
),

polygons AS (

    -- Construction d’un polygone par référence routière
    SELECT
        ref,
        ST_Subdivide( -- découpage des polygones trop grands ou complexes permettant de facilité les calculs
            ST_UnaryUnion( -- tout les polygones collectionnés sont combinés en une seule géom (polygone) = création d'une forme continue
                ST_Collect( -- regroupe les buffers en une seule collection = traite tout les segments de la route comme un ensemble
                    ST_Buffer( -- création d'un buffer autour de chaque ligne (ici de 25m)
                        ST_Simplify(geom, 2), -- Réduction de la complexité de la geom sans trop changer la forme originale
                        25                    
                    )
                )
            ),
            5000 -- taille maximale des polygones subdivisés pour limiter la complexité
        ) AS poly

    FROM base
    GROUP BY ref -- toute les geoms sont regroupés par ref routieres
)

-- Extraction de l’axe central des polygones
SELECT
    row_number() OVER () AS id,   -- Identifiant unique pour QGIS
    ref,
    ST_Transform( -- conversion de la projection en projection d'affichage 4326
        ST_LineMerge( -- fusion des segments d’axe médian en une seule ligne continue
            CG_ApproximateMedialAxis(poly) -- création d'une ligne centrale au milieu des polygones
        ),
        4326
    ) AS geom
FROM polygons

-- Exclusion des géométries vides
WHERE NOT ST_IsEmpty(poly);


-----------------------------------------

--- RAILWAYS

WITH base AS (
    SELECT
        ST_Transform(way, 3857) AS geom,  -- transformation en projection métrique (Web Mercator) pour les calculs de distance
        name                               -- selection du nom de la ligne ferroviaire
    FROM planet_osm_line
    WHERE railway = 'rail'               -- on ne garde que les rails
      AND service IS NULL                -- exclusion des rails de service ou industriels + des tunnels + des ponts
      AND (tunnel IS NULL OR tunnel = 'no')    
      AND (bridge IS NULL OR bridge = 'no')  
),  

polygons AS (
    SELECT
        name,  -- regroupe par nom de ligne
        ST_Subdivide(  -- decoupe les polygones trop gros ou complexes en morceaux plus petits pour faciliter les calculs
            ST_UnaryUnion(  -- tout les polygones collectionnés sont combinés en une seule géom (polygone)
                ST_Collect(  -- regroupe tous les buffers d’une même ligne en une collection
                    ST_Buffer(  -- création d’un buffer autour de la ligne (ici 6m)
                        ST_Simplify(geom, 1.5),  -- réduction de la complexité de la geom sans trop changer la forme originale
                        6                          
                    )
                )
            ),
            3000  -- taille maximale des polygones subdivisés pour limiter la complexité
        ) AS poly
    FROM base
    GROUP BY name
)

SELECT
    row_number() OVER () AS id,  -- selection de l'id unique pour chaque ligne
    name,                        -- selection du nom de la ligne ferroviaire
    ST_Transform(                -- conversion en projection 4326 (latitude/longitude) pour la visualisation
        ST_LineMerge(            -- fusion des segments d’axe médian en une seule ligne continue
            CG_ApproximateMedialAxis(poly)  -- creation d'une ligne central au milieu des polygones
        ),
        4326
    ) AS geom
FROM polygons
WHERE NOT ST_IsEmpty(poly)  -- On exclut les polygones vides (au cas où la fusion ou le buffer échoue)

