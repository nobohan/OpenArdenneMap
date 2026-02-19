DROP MATERIALIZED VIEW IF EXISTS view_railway_medial_axis_3857;

CREATE MATERIALIZED VIEW view_railway_medial_axis_3857 AS
WITH base AS (
    SELECT
        ST_Transform(way, 3857) AS geom, 
        name                               
    FROM planet_osm_line
    WHERE railway = 'rail'               
      AND service IS NULL                
      AND (tunnel IS NULL OR tunnel = 'no')    
      AND (bridge IS NULL OR bridge = 'no')  
),  

polygons AS (
    SELECT
        name,
        ST_Subdivide(
            ST_UnaryUnion(
                ST_Collect(
                    ST_Buffer(
                        ST_Simplify(geom, 1.5),
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
    ST_LineMerge(
        CG_ApproximateMedialAxis(poly)
    )::geometry(Geometry, 3857) AS geom
FROM polygons
WHERE NOT ST_IsEmpty(poly);

-- Index spatial 
CREATE INDEX idx_railway_medial_3857_geom ON view_railway_medial_axis_3857 USING GIST (geom);