WITH 
/*-- 1. on définit la zone en 3857 (le SRID de tes données planet_osm_line)
zone AS (
  SELECT ST_Transform(ST_MakeEnvelope(5.25, 49.74, 5.32, 49.79, 4326), 3857) AS geom
),*/ -- pas obligatoire le ST_Transform et MakeEnvelope mais si travail sur une petite zone alors utile (ici zone de Herbeumont)

-- 2. On recupere les obstacles pour les routes ATTENTION on ne prend en compte que les éléments "ligne" (ici chemins de fers et rivières)
obstacles AS (
  SELECT way as geom 
  FROM planet_osm_line 
  WHERE (waterway IS NOT NULL OR railway = 'rail') -- garde uniquement rail et rivières de la table et dans la zone définie auparavant
    AND ST_Intersects(way, (SELECT geom FROM zone))
),
-- 3. Objectif transformer les lignes en une serie de points + chaque point sera pris individuellement pour voir s'il est ou non proche d'un obstacle

points_eclates AS (
  SELECT 
    r.osm_id,
    (ST_DumpPoints(r.way)).path as pt_path, -- pt_path va donner la position du point dans la ligne et st_dump va decouper la ligne en points
    (ST_DumpPoints(r.way)).geom as pt_geom -- geom du point individuel (les coordonées du pts)
  FROM planet_osm_line r
  WHERE r.highway IS NOT NULL 
    AND (r.bridge IS NULL OR r.bridge = 'no') -- exclusion des ponts (vu qu'ils passent au dessus normalement pas de conflit)
    AND ST_Intersects(r.way, (SELECT geom FROM zone))
),
-- 4. recherche de l'obstacle (rivière ou rails) et déplacement 
calcul_deplacement AS (
  SELECT 
    p.osm_id,
    p.pt_path, -- position du point dans la ligne
    CASE 
           WHEN ST_DWithin(p.pt_geom, obs.geom, 15) THEN -- ici on vérifie si le point se situe à 15m d'un obstacle, si oui alors il y a conflit
        ST_Translate( --si il y a conflit alors : déplacement du point
            p.pt_geom, -- ici on prend le point à déplacer
            sin(ST_Azimuth(ST_ClosestPoint(obs.geom, p.pt_geom), p.pt_geom)) * 12, -- On pousse de 12m le point le plus proche de l'obstacle en X
            cos(ST_Azimuth(ST_ClosestPoint(obs.geom, p.pt_geom), p.pt_geom)) * 12 -- on pousse de 12m le point le plus proche de l'obstacle en Y
        )
      ELSE p.pt_geom -- sinon on conserve le point originel
    END as geom_p
  FROM points_eclates p
  LEFT JOIN LATERAL ( -- Lateral join permet pour chaque point de chercher et trouver l'obstacle le plus proche (recherche personalisée pour chaque point, alors que le join normal va en general relier les points avec tout les obstacles possibles
    SELECT geom FROM obstacles 
    ORDER BY p.pt_geom <-> geom  -- <-> = operateur de distance postgis, il va calculer la distance entre les deux geoms
    LIMIT 1 -- garde que l'obstacle le plus proche
  ) obs ON true -- jointure toujours vraie
),
-- 5. Reconstruction des lignes
lignes_reconstruites AS (
  SELECT 
    osm_id,
    ST_MakeLine(geom_p ORDER BY pt_path)::geometry(LineString, 3857) as geom -- reconnecte les points en une ligne dans l'ordre original de la route en forcant un type de geom = ligne
  FROM calcul_deplacement
  GROUP BY osm_id -- groupement pour refaire la route
)
-- 6. Résultat final pour QGIS
SELECT 
  CAST(ROW_NUMBER() OVER() AS INT) as qgis_id,
  osm_id,
  geom
FROM lignes_reconstruites;
