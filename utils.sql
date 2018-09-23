-- For rotating sport ptiches

SELECT geometry, type, sport,
CASE WHEN (ST_NPoints(l.geometry) >= 5) THEN
(CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3)))
  THEN CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2))) AS VARCHAR(255))
  ELSE CAST(degrees(ST_Azimuth(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2))) AS VARCHAR(255))
END)
END AS orientation,
CASE WHEN (ST_NPoints(l.geometry) >= 5) THEN
(CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3)))
  THEN CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) AS VARCHAR(255))
  ELSE CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3)) AS VARCHAR(255))
END)
END AS length
FROM osm_extralandusages AS l WHERE type = 'pitch' and sport = 'soccer'


CASE WHEN (ST_NPoints(l.geometry) >= 5) THEN \n (CASE WHEN (ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) > ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),3)))\n  THEN CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1), ST_PointN(ST_ExteriorRing(l.geometry),2)) AS VARCHAR(255))\n  ELSE CAST(ST_MaxDistance(ST_PointN(ST_ExteriorRing(l.geometry),1),\n ST_PointN(ST_ExteriorRing(l.geometry),3)) AS VARCHAR(255))\n END)\n END AS length
