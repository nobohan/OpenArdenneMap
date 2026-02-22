DROP MATERIALIZED VIEW IF EXISTS view_motorways_medial_axis_3857;

CREATE MATERIALIZED VIEW view_motorways_medial_axis_3857 AS
WITH base AS (
    SELECT
        way AS geom, 
        name                               
    FROM planet_osm_line
    WHERE highway = 'motorway'         
        AND highway NOT LIKE '%_link'      
        AND ref IS NOT NULL                
),
  

polygons AS (
    SELECT
        ref,
        ST_Subdivide(
            ST_UnaryUnion(
                ST_Collect(
                    ST_Buffer(
                        ST_Simplify(geom, 2),
                        25                                         
                    )
                )
            ),
            5000
        ) AS poly
    FROM base
    GROUP BY ref
)

SELECT
    row_number() OVER () AS id,
    ref,
    ST_LineMerge(
        CG_ApproximateMedialAxis(poly)
    )::geometry(Geometry, 3857) AS geom
FROM polygons
WHERE NOT ST_IsEmpty(poly);

-- Index spatial 
CREATE INDEX idx_motorways_medial_3857_geom ON view_motorways_medial_axis_3857 USING GIST (geom);