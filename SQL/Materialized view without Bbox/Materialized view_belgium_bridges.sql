DROP MATERIALIZED VIEW IF EXISTS view_belgium_bridges_snapped_3857;

CREATE MATERIALIZED VIEW view_belgium_bridges_snapped_3857 AS
    WITH snapped AS (
        SELECT
            highway,  
            ST_Snap(ST_Transform(way, 3857), ST_Collect(ST_Transform(way, 3857)), 1) AS snapped_way  
        FROM planet_osm_line
        WHERE bridge NOT IN ('0','no','')  
          AND highway IN ('path','cycleway','footway','pedestrian','steps','bridleway','boardwalk')
        GROUP BY highway, way
    ),  

    clusters AS (
        SELECT
            unnest(ST_ClusterIntersecting(snapped_way)) AS cluster_geom  
        FROM snapped
    ),  

    merged AS (
        SELECT
            row_number() OVER () AS geom_id,  
            ST_RemoveRepeatedPoints(
                ST_LineMerge(ST_Union(cluster_geom)), 0.001 
            ) AS geom_clean, 
            ST_Length(ST_LineMerge(ST_Union(cluster_geom))) AS length_way  
        FROM clusters
        GROUP BY cluster_geom
    )

    SELECT
        geom_id,           
        geom_clean::geometry(Geometry, 3857) AS geom, 
        length_way         
    FROM merged;

-- Index spatial 
CREATE INDEX idx_be_bridges_snapped_geom ON view_belgium_bridges_snapped_3857 USING GIST (geom);