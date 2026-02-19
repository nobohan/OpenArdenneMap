WITH clustered AS (
    SELECT
        way, -- sélection des géométries de bâtiments
        ST_ClusterDBSCAN(way, eps := 10, minpoints := 1) OVER () AS cid  -- eps = distance max entre deux batiments pour les considérer comme un même cluster 
		-- et minpoint = un cluster peut etre formé même avec 1 seul élément.
    FROM planet_osm_polygon
    WHERE building IS NOT NULL  -- on conserve uniquement des polygones de bâtiments
      /*AND way && ST_Transform(
          ST_MakeEnvelope(5.63, 49.71, 5.68, 49.75, 4326), -- Limitation du traitement à la zone d'étude (ici à la commune de Habay)
          3857
      )*/
)

SELECT
    cid,
    ST_Simplify( -- simplification des batiments finaux
        ST_Union( -- fusion des batiments appartenant à un même cluster
            ST_MakeValid(way) -- permet d'avoir des géometries valides
        ),
        1.5 -- en fonction de l'échelle cette valeur peut changer 
    ) AS geom

FROM clustered

WHERE cid IS NOT NULL -- Suppression des entités sans cluster

GROUP BY cid; -- création d'un polygone par cluster


