SELECT 
    row_number() OVER () AS _uid_,  -- creation d'un ID unique pour chaque ligne finale
    * 
FROM (
    WITH snapped AS (
        SELECT
            highway,  
            ST_Snap(way, ST_Collect(way), 1) AS snapped_way  -- ST_Snap ajuste chaque ligne pour qu'elle s'aligne sur les autres à moins de 1 unité, cela aura pour effet: 
			-- si deux lignes sont très proches (moins de 1 unité), leurs points finaux seront déplacés pour qu’elles se connectent parfaitement, éliminant les gaps ou décalages minimes
        FROM planet_osm_line
        WHERE bridge NOT IN ('0','no','')  -- On ne garde que les ponts actifs
          AND highway IN ('path','cycleway','footway','pedestrian','steps','bridleway','boardwalk')
        GROUP BY highway, way -- regroupe les lignes pour faire fonctionner le collect
    ),  

    clusters AS ( -- regroupement des lignes qui se touchent ou s'intersectent
        SELECT
            unnest(ST_ClusterIntersecting(snapped_way)) AS cluster_geom  -- ST_ClusterIntersecting crée des groupes de lignes connectées, au cas ou des lignes ne serait pas une seule ligne en provenant de osm
            --  et unnest permet de transformer ces clusters en lignes individuelles pour traitement
        FROM snapped
    ),  

    merged AS (-- fusion et nettoyage des lignes de chaque cluster
        SELECT
            row_number() OVER () AS geom_id,  -- ID unique pour chaque ligne fusionnée
            ST_RemoveRepeatedPoints( -- va supprimer les points consécutifs identiques ou très proches (tolérance 0.001)
                ST_LineMerge(ST_Union(cluster_geom)), 0.001 -- ST_LineMerge combine les segments en une seule ligne continue + ST_Union fusionne toutes les lignes d'un cluster
            ) AS geom_clean, 
            ST_Length(ST_LineMerge(ST_Union(cluster_geom))) AS length_way  -- Calcul de la longueur totale de la ligne fusionnée
        FROM clusters
        GROUP BY cluster_geom
    )

-- sélection finale des colonnes utiles
    SELECT
        geom_id,           -- Identifiant unique
        geom_clean AS geom,  -- Géométrie finale nettoyée et fusionnée
        length_way         -- Longueur de la ligne
    FROM merged
) AS _subq_1_
