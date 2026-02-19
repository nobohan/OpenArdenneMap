--- ROAD

WITH base AS (

    -- Sélection des autoroutes avec une référence
    SELECT
    ref                              
    FROM planet_osm_line
    WHERE highway = 'motorway'           
      AND highway NOT LIKE '%_link'      -- pas de bretelles prises en compte
      AND ref IS NOT NULL                
),

polygons AS (
    SELECT
        ref,
        ST_Subdivide( -- découpage des polygones trop grands ou complexes permettant de facilité les calculs (taille max  5000)
            ST_UnaryUnion( -- tout les polygones collectionnés sont combinés en une seule géom (polygone) = création d'une forme continue
                ST_Collect( -- regroupe les buffers en une seule collection = traite tout les segments de la route comme un ensemble
                    ST_Buffer( -- création d'un buffer autour de chaque ligne (ici de 25m)
                        ST_Simplify(geom, 2), -- réduction de la complexité de la geom sans trop changer la forme originale
                        25                    
                    )
                )
            ),
            5000 
        ) AS poly

    FROM base
    GROUP BY ref -- toute les geoms sont regroupés par ref routieres
)

-- Extraction de l’axe central des polygones
SELECT
    row_number() OVER () AS id,   
    ref,
        ST_LineMerge( -- fusion des segments d’axe médian en une seule ligne continue
            CG_ApproximateMedialAxis(poly) -- création d'une ligne centrale au milieu des polygones
        )
FROM polygons

-- Exclusion des géométries vides
WHERE NOT ST_IsEmpty(poly);


-----------------------------------------

--- RAILWAYS

WITH base AS (
    SELECT
    name                               
    FROM planet_osm_line
    WHERE railway = 'rail'               
      AND service IS NULL                -- exclusion des rails de service ou industriels + des tunnels + des ponts
      AND (tunnel IS NULL OR tunnel = 'no')    
      AND (bridge IS NULL OR bridge = 'no')  
),  

polygons AS (
    SELECT
        name,  -- regroupe par nom de ligne
        ST_Subdivide(  -- decoupe les polygones trop gros ou complexes en morceaux plus petits pour faciliter les calculs (ici 3000)
            ST_UnaryUnion(  -- tout les polygones collectionnés sont combinés en une seule géom (polygone)
                ST_Collect(  -- regroupe tous les buffers d’une même ligne en une collection
                    ST_Buffer(  -- création d’un buffer autour de la ligne (ici 6m)
                        ST_Simplify(geom, 1.5),  -- réduction de la complexité de la geom sans trop changer la forme originale
                        6                          
                    )
                )
            ),
            3000 
        ) AS poly
    FROM base
    GROUP BY name
)

SELECT
    row_number() OVER () AS id,  
    name,                        
        ST_LineMerge(            -- fusion des segments d’axe médian en une seule ligne continue
            CG_ApproximateMedialAxis(poly)  -- creation d'une ligne central au milieu des polygones
        )
FROM polygons
WHERE NOT ST_IsEmpty(poly)  -- On exclut les polygones vides (au cas où la fusion ou le buffer échoue)

