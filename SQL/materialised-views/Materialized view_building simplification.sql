DROP MATERIALIZED VIEW IF EXISTS view_clustered_buildings;

CREATE MATERIALIZED VIEW view_clustered_buildings AS
WITH base_data AS (
    SELECT *
    FROM planet_osm_polygon
    WHERE building IS NOT NULL
      AND building NOT IN ('church', 'chapel', 'cathedral', 'religious') 
),
clustered AS (
    SELECT
        *, 
        ST_ClusterDBSCAN(way, eps := 10, minpoints := 1) OVER () AS cid  
    FROM base_data
)
SELECT
    *,
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
CREATE INDEX idx_be_buildings_clustered_geom ON view_clustered_buildings USING GIST (geom);