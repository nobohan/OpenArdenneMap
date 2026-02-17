WITH clustered AS (
    SELECT
        way, -- Sélection des géométries de bâtiments
        ST_ClusterDBSCAN(way, eps := 10, minpoints := 1) OVER () AS cid  -- Attribution d'un identifiant de cluster selon la proximité spatiale, eps = distance max entre deux batiments pour les considérer comme un même cluster 
		-- et minpoint = un cluster peut etre formé même avec 1 seul élément.
    FROM planet_osm_polygon
    WHERE building IS NOT NULL  -- On conserve uniquement des polygones de bâtiments
      /*AND way && ST_Transform(
          ST_MakeEnvelope(5.63, 49.71, 5.68, 49.75, 4326), -- Limitation du traitement à la zone d'étude (ici à la commune de Habay)
          3857
      )*/
)

-- Fusion et généralisation des bâtiments par cluster
SELECT
    cid,
    ST_Simplify( -- simplification des batiments finaux
        ST_Union( -- fusion des batiments appartenant à un même cluster
            ST_MakeValid(way) -- permet d'avoir des géometries valides
        ),
        1.5 -- en fonction de l'échelle, cette valeur peut changer, à l'échelle d'une ville on a une simplification qui reste précise 
    ) AS geom

FROM clustered

-- Suppression des entités sans cluster
WHERE cid IS NOT NULL

-- Création d'un polygone final par cluster
GROUP BY cid;

