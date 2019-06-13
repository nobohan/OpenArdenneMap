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

## TODO

* very short name ? (street labels)
  * certains noms n'apparaissent tjs pas
  * certains noms sont trop abbrégés (Rue -> R.)

* cacher zone militaires


## Encodage
