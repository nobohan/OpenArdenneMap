DROP VIEW IF EXISTS waterway_label;
CREATE MATERIALIZED VIEW waterway_label AS
SELECT way, waterway AS type, replace(name, 'Ruisseau', 'Rau') AS name
FROM planet_osm_line
WHERE waterway IN ('canal', 'river', 'stream') AND name IS NOT NULL
UNION ALL
SELECT
    ST_LineMerge(ST_ApproximateMedialAxis(ST_SimplifyPreserveTopology(ST_MakePolygon(ST_ExteriorRing(way)), 50))) AS way,
    water AS type,
    replace(replace(name, 'Etang', 'Étg'), 'Étang', 'Étg') AS name
FROM planet_osm_polygon
WHERE water IN ('pond', 'lake', 'basin', 'reservoir') AND name IS NOT NULL AND way_area > 10000;
CREATE INDEX waterway_label_idx ON waterway_label USING GIST (way);


DROP VIEW IF EXISTS landuse_label;
CREATE MATERIALIZED VIEW landuse_label AS
SELECT COALESCE(landuse, leisure, "natural", highway, amenity, tourism) AS type, replace(replace(name, 'Etang', 'Étg'), 'Étang', 'Étg') AS name, way_area AS area, ST_PointOnSurface(way) AS way
FROM planet_osm_polygon
WHERE ST_IsValid(way)
UNION ALL
SELECT 'building' AS type, replace(replace(name, 'Etang', 'Étg'), 'Étang', 'Étg') AS name, way_area AS area, ST_PointOnSurface(way) AS way
FROM planet_osm_polygon
WHERE name IS NOT NULL
    AND building NOT IN ('', 'no', '0', 'false')
    AND ST_IsValid(way)
ORDER BY area DESC;
CREATE INDEX landuse_label_idx ON landuse_label USING GIST (way);


DROP VIEW IF EXISTS pitch;
CREATE MATERIALIZED VIEW pitch AS
SELECT way, sport,
CASE
    WHEN (ST_NPoints((ST_SimplifyPreserveTopology(l.way,100))) >= 5) THEN
        (CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),1), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),3)))
        THEN CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),3))) AS VARCHAR(255))
        ELSE CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),1), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2))) AS VARCHAR(255))
        END)
    END AS orientation,
CASE
    WHEN (ST_NPoints((ST_SimplifyPreserveTopology(l.way,100))) >= 5) THEN
        (CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),1), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),3)))
        THEN CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),1), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),2)) AS INTEGER)
        ELSE CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),1), ST_PointN(ST_ExteriorRing((ST_SimplifyPreserveTopology(l.way,100))),3)) AS INTEGER)
        END)
    END AS length
FROM planet_osm_polygon AS l
WHERE leisure = 'pitch' and sport IN ('soccer', 'tennis');
CREATE INDEX pitch_idx ON pitch USING GIST (way);


DROP VIEW IF EXISTS point_features;
CREATE MATERIALIZED VIEW point_features AS
SELECT
    way, power, man_made, amenity, historic, leisure, tourism, public_transport, "tower:type", "generator:source", bus, ford, "natural", ele, name,
    replace(name, 'Château', 'Chau') as short_name,
    CASE
        WHEN ele IS NOT NULL THEN CONCAT(name, ' \n (', ele, ' m)')
        ELSE name
    END as peak_name,
    CASE
        WHEN direction = 'N-E' THEN 45
        WHEN direction = 'E' THEN 90
        WHEN direction = 'S-E' THEN 135
        WHEN direction = 'S' THEN 180
        WHEN direction = 'S-W' THEN 225
        WHEN direction = 'W' THEN 270
        WHEN direction = 'N-W' THEN 315
        WHEN direction ~ '-' THEN 0
        WHEN direction ~ '\\.' THEN 0
        WHEN direction ~ ';' THEN 0
        ELSE ROUND(REGEXP_REPLACE(coalesce(direction::character varying, '0'), '[^0-9]*' ,'0')::float)::int
    END AS orientation
FROM planet_osm_point
UNION
SELECT
    ST_Centroid(way) AS way,
    power, man_made, amenity, historic, leisure, tourism, public_transport, "tower:type", "generator:source", NULL AS bus, NULL AS ford, "natural", NULL as ele, name,
    replace(name, 'Château', 'Chau') as short_name,
    NULL as peak_name,
    0 AS orientation
FROM planet_osm_polygon
WHERE historic IS NOT NULL;
CREATE INDEX point_features_idx ON point_features USING GIST (way);


DROP VIEW IF EXISTS trails;
CREATE MATERIALIZED VIEW trails AS
SELECT
way, name, network, signed_direction,
CASE
    WHEN distance LIKE '%km' THEN distance
    ELSE distance || ' km'
END distance_km,
SPLIT_PART("osmc:symbol",':', 1) AS color,
CASE
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'blue' THEN '#00629b'
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'red' THEN '#d22730'
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'green' THEN '#009739'
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'orange' THEN '#ff6600'
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'yellow' THEN '#fedd00'
    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'purple' THEN
        CASE
            WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1) <> '' THEN
                CASE
                    WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1) = 'blue' THEN '#00629b'
                    WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1)= 'red' THEN '#d22730'
                    WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1) = 'green' THEN '#009739'
                    WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1)= 'orange' THEN '#ff6600'
                    WHEN SPLIT_PART(SPLIT_PART("osmc:symbol",':', 3), '_', 1) = 'yellow' THEN '#fedd00'
                    ELSE
                        '#ad629b'
                END
            ELSE
                '#ad629b'
        END
    ELSE '#ad629b'
END html_color,
CASE
    WHEN LENGTH(SPLIT_PART("osmc:symbol",':', 4)) < 4 THEN
        SPLIT_PART("osmc:symbol",':', 4)
    ELSE
        ''
END marked_text,
CASE
    WHEN SPLIT_PART("osmc:symbol",':', 3) IN ('red_lower') THEN
        'black'
    ELSE
        'white'
END text_color,
CASE
    WHEN SPLIT_PART("osmc:symbol",':', 3) <> '' THEN
        CASE
            WHEN SPLIT_PART("osmc:symbol",':', 3) = 'white_stripe' THEN
                '../img/marked-trails/' || SPLIT_PART("osmc:symbol",':', 1) || '_invstripe.svg'
            WHEN SPLIT_PART("osmc:symbol",':', 3) = 'white_corner' THEN
                CASE
                    WHEN SPLIT_PART("osmc:symbol",':', 1) = 'purple' THEN
                        '../img/marked-trails/' || SPLIT_PART("osmc:symbol",':', 2) || '_pointer.svg'
                    ELSE
                        '../img/marked-trails/' || SPLIT_PART("osmc:symbol",':', 1) || '_pointer.svg'
                END
            ELSE
                '../img/marked-trails/' || SPLIT_PART("osmc:symbol",':', 3) || '.svg'
        END
    ELSE
        '../img/marked-trails/' || SPLIT_PART("osmc:symbol",':', 1) || '_rectangle.svg'
END shield_uri
FROM planet_osm_line
WHERE route ~ 'hiking' OR route ~ 'foot';
CREATE INDEX trails_idx ON trails USING GIST (way);


DROP VIEW IF EXISTS rotated_buildings;
CREATE MATERIALIZED VIEW rotated_buildings AS
SELECT way, building, name, area,
    CAST(degrees(
        CASE
            WHEN ST_Distance(ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 1), ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 2)) > ST_Distance(ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 2), ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 3))
                THEN ST_Azimuth(ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 1), ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 2))
            ELSE ST_Azimuth(ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 2), ST_PointN(ST_ExteriorRing(ST_OrientedEnvelope(l.way)), 3))
        END
    ) AS VARCHAR(255)) AS orientation
FROM planet_osm_polygon AS l
WHERE "building" IN ('church','chapel');
CREATE INDEX rotated_buildings_idx ON rotated_buildings USING GIST (way);


DROP VIEW IF EXISTS roads;
CREATE MATERIALIZED VIEW roads AS
SELECT way, COALESCE(highway, railway) AS type, 0 AS tunnel, 0 AS bridge, tracktype, trail_visibility, access, name, 'fill' AS render,
CASE
    WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
    WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
    WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
    WHEN highway IN ('service', 'track') THEN 'service'
    WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
    WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
    ELSE 'other' END AS stylegroup
FROM planet_osm_line
WHERE (highway IS NOT NULL OR railway IS NOT NULL)
    AND (tunnel IS NULL OR tunnel = 'no')
    AND (bridge IS NULL OR bridge = 'no')
ORDER BY z_order;
CREATE INDEX roads_idx ON roads USING GIST (way);


DROP VIEW IF EXISTS bridges;
CREATE MATERIALIZED VIEW bridges AS
SELECT way, COALESCE(highway, railway) AS type, 1 AS bridge, access, render, layer, tracktype, trail_visibility, name, 0 as tunnel,
    CASE
        WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
        WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
        WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
        WHEN highway IN ('service', 'track') THEN 'service'
        WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
        WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
        ELSE 'other' END AS stylegroup
    FROM (
        SELECT *, '1_outline' AS render FROM planet_osm_line
        WHERE bridge NOT IN ('', '0', 'no')
        UNION ALL
        SELECT *, '2_line' AS render FROM planet_osm_line
        WHERE bridge NOT IN ('', '0', 'no')
        UNION ALL
        SELECT *, '3_inline' AS render FROM planet_osm_line
        WHERE bridge NOT IN ('', '0', 'no')
    ) AS bridges
ORDER BY layer ASC, render ASC;
CREATE INDEX bridges_idx ON bridges USING GIST (way);


DROP VIEW IF EXISTS tunnels;
CREATE MATERIALIZED VIEW tunnels AS
SELECT way, COALESCE(highway, railway) AS type, 0 AS bridge, access, render, layer, tracktype, trail_visibility, name, 1 as tunnel,
CASE
    WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
    WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
    WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
    WHEN highway IN ('service', 'track') THEN 'service'
    WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
    WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
    ELSE 'other' END AS stylegroup
FROM (
    SELECT *, '1_outline' AS render FROM planet_osm_line
    WHERE tunnel NOT IN ('', '0', 'no')
    UNION ALL
    SELECT *, '2_line' AS render FROM planet_osm_line
    WHERE tunnel NOT IN ('', '0', 'no')
    UNION ALL
    SELECT *, '3_inline' AS render FROM planet_osm_line
    WHERE tunnel NOT IN ('', '0', 'no')
) AS tunnels
ORDER BY layer ASC, render ASC;
CREATE INDEX tunnels_idx ON tunnels USING GIST (way);


DROP VIEW IF EXISTS landuse;
CREATE MATERIALIZED VIEW landuse AS
SELECT way, leaf_type, leaf_cycle, trees, produce, way_area AS area, COALESCE(landuse, leisure, "natural", highway, amenity, tourism) AS type
FROM planet_osm_polygon
ORDER BY way_area DESC;
CREATE INDEX landuse_idx ON landuse USING GIST (way);


DROP VIEW IF EXISTS boundaries;
CREATE MATERIALIZED VIEW boundaries AS
SELECT way, admin_level
FROM planet_osm_line
WHERE boundary IN ('administrative');
CREATE INDEX boundaries_idx ON boundaries USING GIST (way);


DROP VIEW IF EXISTS waterways;
CREATE MATERIALIZED VIEW waterways AS
SELECT way, waterway AS type
FROM planet_osm_line
WHERE waterway IN ('river', 'canal', 'stream', 'ditch', 'drain');
CREATE INDEX waterways_idx ON waterways USING GIST (way);


DROP VIEW IF EXISTS waters;
CREATE MATERIALIZED VIEW waters AS
SELECT way, way_area AS area
FROM planet_osm_polygon
WHERE "natural" IN ('water', 'pond') OR landuse IN ('reservoir') OR waterway IN ('basin', 'canal', 'mill_pond', 'pond', 'riverbank', 'stream');
CREATE INDEX waters_idx ON waters USING GIST (way);


DROP VIEW IF EXISTS landuse_overlays;
CREATE MATERIALIZED VIEW landuse_overlays AS
SELECT way, way_area AS area, COALESCE(leisure, "natural") AS type
FROM planet_osm_polygon
WHERE leisure = 'nature_reserve' OR "natural" = 'wetland'
ORDER BY way_area DESC;
CREATE INDEX landuse_overlays_idx ON landuse_overlays USING GIST (way);


DROP VIEW IF EXISTS bridge_symbols;
CREATE MATERIALIZED VIEW bridge_symbols AS
SELECT
    way,
    highway,
    ST_Length(planet_osm_line.way) AS length,
    CAST(90+degrees(ST_Azimuth(ST_StartPoint(planet_osm_line.way), ST_EndPoint(planet_osm_line.way))) AS VARCHAR(255)) AS orientation
FROM planet_osm_line WHERE bridge NOT IN ('', '0', 'no')
AND highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway', 'boardwalk');
CREATE INDEX bridge_symbols_idx ON bridge_symbols USING GIST (way);


DROP VIEW IF EXISTS cemeteries;
CREATE MATERIALIZED VIEW cemeteries AS
SELECT way, way_area AS area, COALESCE(landuse, amenity) AS type
FROM planet_osm_polygon
WHERE landuse = 'cemetery' OR amenity= 'grave_yard'
ORDER BY way_area DESC;
CREATE INDEX cemeteries_idx ON cemeteries USING GIST (way);


DROP VIEW IF EXISTS buildings;
CREATE MATERIALIZED VIEW buildings AS
SELECT way, "building" AS type
FROM planet_osm_polygon
WHERE building NOT IN ('', '0','false', 'no', 'church','chapel')
ORDER BY ST_YMin(ST_Envelope(way)) DESC;
CREATE INDEX buildings_idx ON buildings USING GIST (way);


DROP VIEW IF EXISTS linear_features;
CREATE MATERIALIZED VIEW linear_features AS
SELECT way, COALESCE(man_made, barrier, power, "natural") AS type
FROM planet_osm_line;
CREATE INDEX linear_features_idx ON linear_features USING GIST (way);


DROP VIEW IF EXISTS places;
CREATE MATERIALIZED VIEW places AS
SELECT way, place AS type, name, z_order, population
FROM planet_osm_point
WHERE place in ('country', 'state', 'city', 'town', 'village', 'hamlet', 'suburb', 'neighbourhood', 'locality', 'isolated_dwelling')
ORDER BY population DESC NULLS LAST;
CREATE INDEX places_idx ON places USING GIST (way);


DROP VIEW IF EXISTS train_elements;
CREATE MATERIALIZED VIEW train_elements AS
SELECT way, railway AS type, name, z_order
FROM planet_osm_point
WHERE railway IN ('station', 'level_crossing')
ORDER BY z_order NULLS LAST;
CREATE INDEX train_elements_idx ON train_elements USING GIST (way);