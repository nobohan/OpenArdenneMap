Adaptations pour Brugelette
---------------------------

# Rendu des trottoirs

* ajout sidewalk dans fichier .style
* nouvelle couche dans le projet
* style et dimensions de cette couche

# Mini-cartes

La carte globale est au format A0 à l'échelle 1:12500.

Des mini-cartes (zoom) des villages peuvent se mettre sur les bords. Il y aurait l'équivalent de 2 A4 en portrait pour mettre ces mini-cartes.

Quels villages?

* Brugelette
* Cambron-Casteau
* Gages
* Attre
* Mévergnies

ou Brugelette-Mévergnies ensemble.

# Détails (liste non-exhaustive)

## DONE
* hydro trop large au zoom > 17
* afficher la grille de l'index des rues avec le label
* changer le symbole des églises pour les mini-maps
* hard-codage des orientation des églises
* revoir les dash-array des mini-maps
* filtrer des features de PARADISIO
```
SELECT way, railway AS type, name, z_order
FROM planet_osm_point
WHERE railway IN ('station', 'level_crossing') AND NOT ST_WITHIN(way, (SELECT way
  FROM planet_osm_polygon
  WHERE osm_id = 251508700)
)
ORDER BY z_order NULLS LAST
```

ajout rcn_ref (point noeuds vélo)


# Légende avec Mapnik

## commandes
```
carto legend.mml > legend.xml && python legend.py
```

## How to build the legend
1) Add layers in `legend.mml`: the same numbers of layers should be in legend.mml as in the mml map file.

2) Add corresponding items in `legend.geojson`: this layer stores the geometric information for each legend item.

3) For the denomination (text labels as "Forêt mixte") of the legend items only, add entries in legend_label.mss. The corresponding layer should be in `legend.mml` as well.

# OSM history
```
carto --quiet osm2pgsql/project-history.mml > osm2pgsql/brugelette-history.xml && cp osm2pgsql/brugelette-history.xml ../../../OSM-History/osm-history-rendered-cl/osm-history-renderer/data/xml/brugelette-history.xml
```


# About svg patterns rendered as images

https://github.com/mapnik/mapnik/issues/4007

SVG support from Mapnik 3.0.12. Mapnik 3.0.19 seems the last installed version on ubuntu 18.04!

https://github.com/mapnik/mapnik/pull/4009: novembre 2018: do not rasterize svg pattern


merge commit: https://github.com/mapnik/mapnik/commit/abcd96be0ea72ff00a1e6e0908e3175d5d8914a3
