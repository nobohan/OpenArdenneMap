-- For rotating sport ptiches

SELECT geometry, type, sport,
CASE WHEN (ST_NPoints(ST_SimplifyPreserveTopology(l.geometry,100)) = 5) THEN
(CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),2), ST_PointN(ST_ExteriorRing(l.geometry),3)))
  THEN CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3))) AS VARCHAR(255))
  ELSE CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2))) AS VARCHAR(255))
END)
END AS orientation,
CASE WHEN (ST_NPoints(ST_SimplifyPreserveTopology(l.geometry,100)) = 5) THEN
(CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),2), ST_PointN(ST_ExteriorRing(l.geometry),3)))
  THEN CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) AS VARCHAR(255))
  ELSE CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3)) AS VARCHAR(255))
END)
END AS length
FROM osm_extralandusages AS l WHERE type = 'pitch' and sport IN ('soccer', 'tennis')


SELECT geometry, type, sport, \n CASE WHEN (ST_NPoints(ST_SimplifyPreserveTopology(l.geometry,100)) = 5) THEN \n (CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),3))) \n   THEN CAST(90+degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),2))) AS VARCHAR(255))\n  ELSE CAST(90+degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),3))) AS VARCHAR(255)) \n END) END AS orientation, CASE WHEN (ST_NPoints(ST_SimplifyPreserveTopology(l.geometry,100)) = 5) THEN \n (CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),3)))\n  THEN CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1), ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),2)) AS INTEGER)\n  ELSE CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),1),\n ST_PointN(ST_ExteriorRing(ST_SimplifyPreserveTopology(l.geometry,100)),3)) AS INTEGER)\n END)\n END AS length \n FROM osm_extralandusages AS l WHERE type = 'pitch' and sport IN ('soccer', 'tennis') ) AS data",


DROP TABLE IF EXISTS church;
CREATE TABLE church AS
SELECT geometry, type,
ST_Centroid(l.geometry) AS centroid,
ST_Centroid(ST_SimplifyPreserveTopology(l.geometry,10000)) AS simp_centroid,
ST_Centroid(ST_ConcaveHull(l.geometry),0.8) AS concav_centroid,
ST_Centroid(ST_ConvexHull(l.geometry)) AS convex_centroid,
ST_Centroid(ST_MinimumBoundingCircle(l.geometry)) AS circle_centroid,
ST_SimplifyPreserveTopology(l.geometry,10000) AS simplified_geom
FROM osm_buildings AS l WHERE type = 'church'

SELECT geometry, type,
CAST(degrees(ST_Azimuth(ST_Centroid(l.geometry),ST_Centroid(ST_SimplifyPreserveTopology(l.geometry,100)))) AS VARCHAR(255)) AS orientation
FROM osm_buildings AS l WHERE type = 'church'
