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
