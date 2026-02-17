DROP MATERIALIZED VIEW IF EXISTS view_belgium_buildings_clustered;

CREATE MATERIALIZED VIEW view_belgium_buildings_clustered AS
WITH base_data AS (
    SELECT 
        ST_Transform(way, 3857) AS way
    FROM planet_osm_polygon
    WHERE building IS NOT NULL
      AND building NOT IN ('church', 'chapel', 'cathedral', 'religious') 
),
clustered AS (
    SELECT
        way, 
        ST_ClusterDBSCAN(way, eps := 10, minpoints := 1) OVER () AS cid  
    FROM base_data
)
SELECT
    cid AS id, 
    ST_Simplify(
        ST_Union(
            ST_MakeValid(way)
        ),
        1.5
    )::geometry(Geometry, 3857) AS geom
FROM clustered
WHERE cid IS NOT NULL
GROUP BY cid;

-- Index spatial pour que ça trace sur la carte
CREATE INDEX idx_be_buildings_clustered_geom ON view_belgium_buildings_clustered USING GIST (geom);