OpenArdenneMap
--------------

*Une carte pour l'Ardenne*

![map](openardennemap.png)


Un exemple peut être téléchargé [ici](http://www.nobohan.be/docs/OpenArdenneMap_Rulles_1_20000e.pdf).

&nbsp;

::: ENGLISH BELOW :::

# A propos
OpenArdenneMap est un style de carte personnalisé basé sur OpenStreetMap. Il se fonde sur le style OSMBright et s'inspire, entre autres, de OpenTopoMap. Plus d'infos dans cet article [ici](https://blog.champs-libres.coop/carto/2018/12/18/openardennemap.html)

# Installation
## Par image docker
Il y a maintenant une image docker et un fichier docker-compose pour installer la pile logicielle permettant de démarrer le projet. Voir dans le dossier `./docker/`

## En installant la pile logicielle

### Pile logicielle
Il est conseillé d'utiliser un environnement virtuel Python. Les librairies/logiciels suivants sont installés:
* mapnik
* python-mapnik
* osm2pgsql ou imposm
* carto
* postgreSQL + PostGIS 2.5.4+

Notez que certaines nouvelles fonctions de postgis sont utilisées (ST_OrientedEnvelope), donc il vaut mieux installer un postgis de version >2.5.4 pour profiter de toutes les fonctionnalités du style de la carte.

Puis:
* cloner ou télécharger les fichiers OpenArdenneMap
* télécharger les données OSM en fichier .osm (avec JOSM) ou bien en .pbf (par ex. sur download.geofabrik.de)

### Mise en place de la base de données postgresql
Lancer le script `create-db.sh`. Il faut l'éditer auparavant selon le chemin de votre environnement virtuel.

# Usage
OpenArdenneMap fonctionne avec les importateurs `imposm` et `osm2pgsql`. Les styles et le fichier de projet propres à chaque importateur se trouvent dans leurs dossiers respectifs. À noter que, grâce à sa meilleure façon de gérer les multipolygones, les développement les plus récents se font avec `osm2pgsql`, le fichier de projet avec `imposm` n'est plus mis à jour.

## Pour changer les données OSM (import dans une db)

Avec osm2pgsql, éditer le fichier `osm2pgsql/OpenArdenneMap.style`.

Avec imposm, éditer le fichier `imposm/imposm-mapping.py`.

## Échelle

Originellement, le style a été développé pour des impressions papier à haute résolution (300 dpi) à une échelle correspondant au niveau de zoom 16. Actuellement, le style est compatible pour les niveaux de zoom de 10 à 20. En dehors de ces niveaux, utiliser ce style peut donner lieu à des fortes superpositions d'éléments.

## Pour changer le style de la carte
Éditer les fichiers `mss` en utilisant le language cartoCSS et utiliser `carto` pour générer le fichier mapnik `OpenArdenneMap.xml`:
`carto osm2pgsql/project.mml > osm2pgsql/OpenArdenneMap.xml`

Pour générer la carte, faire (avec Python 3):
`python makeMap.py`

Le tout:
```
carto osm2pgsql/project.mml > osm2pgsql/OpenArdenneMap.xml && python makeMap.py
```

ou bien (avec imposm):
```
carto imposm/project.mml > imposm/OpenArdenneMap.xml && python makeMap.py
```

## Mettre à jour la base de données avec osm2pgsql

Voici la commande pour mettre à jour avec osm2pgsql. La table de sélection des tags OSM est dans le fichier `OpenArdenneMap.style`. Ce fichier est légèrement adapté du fichier style d'osm2pgsql par défaut.

```
osm2pgsql -c -G -d osmpg_db -S osm2pgsql/OpenArdenneMap.style osm-files/extract.osm
```


## Mettre à jour la base de données avec imposm
Voici les commandes pour utiliser imposm avec la table de correspondance renseignée dans imposm-mapping.py. Utiliser un shapefile e.g.,  `map_extent.shp` pour resteindre l'import à une zone:
* `imposm --proj=EPSG:3857 --read belgium-latest.osm.bz2 --limit-to map_extent.shp -m imposm-mapping.py`
* `imposm -U osm -d osm -m imposm-mapping.py --write --optimize --deploy-production-tables --limit-to map_extent.shp`
* `imposm -d osm --remove-backup-tables`


Au lieu de processer un gros fichier tel que  belgium-latest.osm.bz2, vous pouvez télécharger directment votre zone d'intérêt avec JOSM. Sauver les données sous un fichier .osm (e.g., `extract.osm`) et l'utiliser avec imposm. C'est beaucoup plus rapide!
* `imposm --proj=EPSG:3857 --read osm-files/extract.osm -m imposm-mapping.py`
* `imposm -U osm -d osm -m imposm-mapping.py --write --optimize --deploy-production-tables`
* `imposm -d osm --remove-backup-tables`


Le tout:

```
imposm --proj=EPSG:3857 --read osm-files/extract.osm -m imposm/imposm-mapping.py --overwrite-cache && imposm -U osm -d osm -m imposm/imposm-mapping.py --write --optimize --deploy-production-tables && imposm -d osm --remove-backup-tables
```


# Changements apportés à OSMBright

OSMBright est un style par défaut pour les données d'OSM. Mais il est principalement adapté aux milieux urbains. Ce style a été profondémment modifié. Voici quelques exemples de modifications.

## 1) Simplification
Pour le moment, ce dépôt n'est pas destiné à générer des tuiles à différents niveaux de zooms, mais plutôt de générer de grandes cartes papier à imprimer, à une haute résolution / grande échelle. Le style d'OSMBright a donc été fortement simplifié:
* Pas de niveaux de zoom
* Pas de couches généralisées pour les petites échelles.

## 2) Ajouts de nouveaux éléments

### 2.1) En ajoutant des champs à une table existante
1) Ajouter le nom du champ + le type de champ (boolean, numeric, string) à une table existante.

```
    fields = (
            ...
            ('surface', String()),
            ('tracktype', String())
            )
```

2) Ensuite, ajouter le nom du champ dans `project.mml` dans la couche où ce champ est utilisé.

```
"table": "( SELECT geometry, type, tunnel, bridge, surface, tracktype, access, ...
```

3) Enfin, définir un style particulier pour la propriété "tracktype" dans le bon fichier mss.

```
[tracktype='grade1'] { line-width: @rdz16_min / 2; }
```


### 2.2) En ajoutant une nouvelle table
1) Vous pouvez créer une nouvelle table avec des étiquettes OSM et une sélection de champs dans `imposm-mapping.py`. Voir par exemple la table nommée "linearfeatures" avec les étiquettes "man_made=embankment" et "embankment=yes". Noter la virgule à la fin des valeurs des clés, même avant de fermer la parenthèse!


```
linearfeatures = LineStrings(
   name = 'linearfeatures',
   mapping = {
           'man_made': (
              'embankment',
           ),
            'embankment': (
               'yes'
            ),
       },
)
```

2) Ensuite, ajouter une couche dans `project.mml`:

```
{
  "Datasource": {
    "dbname": "osm",
    "extent": "-20037508.34,-20037508.34,20037508.34,20037508.34",
    "geometry_field": "geometry",
    "id": "linear_features",
    "key_field": "",
    "srs": null,
    "table": "( SELECT geometry, type\n  FROM osm_linearfeatures\n)  AS data",
    "type": "postgis"
  },
  "class": "",
  "geometry": "linestring",
  "id": "linear_features",
  "name": "linear_features",
  "srs": "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over",
  "srs-name": "900913",
  "status": "on"
},
```


3) Enfin, définir un style dans l'un des fichiers mss.

`#linear_features: { ... }`

## 3) Ajout d'une troisième couche à certaines routes

Avec Mapnik, comme dans beaucoup de logiciels cartographiques, on obtient des symbologies complexes pour les routes en superposant plusieurs couches avec différentes épaisseurs. Par exemple, une route rendue avec une bande blanche bordée par 2 lignes noires est obtenue en superposant une deuxième couche avec une fine ligne blanche au-dessus d'une première couche constituée d'une large bande noire.

Pour afficher des symboles encore plus complexes, on peut avoir besoin d'une troisième couche. Dans OpenArdenneMap, les chemins principaux (tracktype=1) sont rendus avec une ligne alternant le rouge et le blanc bordé par 2 lignes noires. Cette couche a des propriétés cartoCSS sous `#roads::top`.


## 4) Personnalisation du style cartographique

Bien sûr, outre les additions, le style de la carte a été fortement modifié. Les principales modifications sont:

* Augmentation des tailles de police
* Choix de couleurs
* Création de symboles
* Création de patterns
* Rotation automatique de certains éléments (cfr https://blog.champs-libres.coop/carto/2018/12/18/openardennemap.html)


# Courbes de niveaux

NOTE: Les fichiers de courbes de niveaux ne sont pas présents sur ce dépôt pour une question de taille! Néanmoins, voici ci-dessous la recette pour leur génération. Voir aussi cet [article de blog](https://www.champs-libres.coop/blog/post/2019-11-21-beautiful-contour-belgium/) avec un lien pour télécharger des courbes de niveaux pour la Belgique.

## Préparation du MNT
Avant la génération des courbes de niveaux, le modèle numérique de terrain (MNT) a été filtré et les cours d'eau connu y ont été enfoncés. La chaine de traitement suivante a été faite avec le logiciel libre Whitebox GAT (https://www.uoguelph.ca/~hydrogeo/Whitebox/):
1) Filtre "denoise";
2) Gravage des cours d'eau avec l'outil "Burn Streams" avec une profondeur d'enfoncement de 10 m et un decay de 0.7;
3) Filtre de moyenne à 5 m;
4) Solutionner des dépressions résiduelles du MNT avec l'outil "Breach depressions" (longueur max. de 50 m)


## Génération des courbes de niveaux
Les courbes de niveaux ont été générées depuis le MNT filtré en utilisant l'outil GRASS `r.contour.step` dans QGIS. L'incrément entre les courbes a été fixé à 5 m. Le nombre minimum de points pour avoir une courbe a été fixé à 20. Cet outil offre plus d'options que l'outil GDAL `gdal_contour`.

La couche a ensuite été post-processée pour obtenir des géométries plus courbes. L'outil `v.generalize.smooth` a été utilisé, avec l'algorithme "snakes" (paramètres par défaut).

Certaines courbes sont désignées comme lignes maitresses, afin d'augmenter la lisibilité des courbes de niveaux. Ici, toutes les courbes avec une altitude égale à un multiple de 20 m a été définie comme maitresse. Cela est calculé directement dans le fichier de style `base.mss` en fonction du champ 'ELEV':

```
[[ELEV] % 20 = 0]
```

## Représentation des courbes de niveaux

Les courbes de niveaux ont été enregistrées au format shp et sont chargées en tant que deuxième couche (en partant du bas) dans `project.mml`.

Les labels des courbes de niveaux sont définis dans `labels.mss`.

## 5) Impression
Quelques commandes utiles pour l'impression en pdf:

* Déterminer la taille d'un pdf:
`pdfjam --outfile A2.pdf --landscape --paper a2paper in.pdf`

* Faire plusieurs A4 d'un A2:
`pdfposter -ma4 -pa2 A2.pdf out_A4.pdf`


&nbsp;

&nbsp;

&nbsp;

::: ENGLISH :::

# About
OpenArdenneMap is a customized map using OpenStreetMap data. It is based on OSMBright and inspired by OpenTopoMap. More infos in this article (in French) [here](https://blog.champs-libres.coop/carto/2018/12/18/openardennemap.html)


# Installation
## By docker
There is a docker image in the folder `docker`.

## By installing this stack
### Stack
* This was developed inside a python virtual environment
* Install Mapnik & python-mapnik
* Install impsom OR osm2pgsql
* Install carto
  * (For these last three points, have a look at OSMBright)
* postgreSQL + postgis 2.5.4+

* Clone or download the OpenArdenneMap files
* download the OSM data as a .osm file (using JOSM) or as a .pbf file (e.g. on download.geofabrik.de)

Note that some brand new PostGIS functions are used (ST_OrientedEnvelope), so it is better to install a postgis >2.5.4 to benefit to all of the functionnalities of the map style.

### Set up the postgresql database
Run the script `create-db.sh`. Edit it before according to the path of your virtual environment.

# Usage
OpenArdenneMap works with `imposm` or `osm2pgsql`. Map styles and project file for each importer are within their own folder (osm2pgsql or imposm). Note that, due to is better handling of complex multipolygons, recent map developments are done with `osm2pgsql` and the project file with `imposm` is not longer updated.

## To change the way the OSM data are imported

For imposm, edit the `imposm/imposm-mapping.py` file.

For osm2pgsql, edit the `osm2pgsql/OpenArdenneMap.style` file.

## To change the style of the map
Edit the mss files using cartoCSS language and use `carto` to generate the `OpenArdenneMap.xml` mapnik file. Then:
`carto osm2pgsql/project.mml > osm2pgsql/OpenArdenneMap.xml`

To generate the map:
`python makeMap.py`

All together for osm2pgsql:
```
carto osm2pgsql/project.mml > osm2pgsql/OpenArdenneMap.xml && python makeMap.py
```

All together for imposm:
```
carto imposm/project.mml > imposm/OpenArdenneMap.xml && python makeMap.py
```


## Update the db with osm2pgsql

Here is the command for updating with osm2pgsql. OSM tags selections is written in the `OpenArdenneMap.style` file. This file is slightly modified from the default osm2pgsql style file.

```
osm2pgsql -c -G -d osmpg_db -S osm2pgsql/OpenArdenneMap.style osm-files/extract.osm
```


## Update the db using imposm
Here are the commands for using imposm with this imposm-mapping. Use a shp called e.g. `map_extent.shp` to select a particular area:
* `imposm --proj=EPSG:3857 --read belgium-latest.osm.bz2 --limit-to map_extent.shp -m imposm-mapping.py`
* `imposm -U osm -d osm -m imposm-mapping.py --write --optimize --deploy-production-tables --limit-to map_extent.shp`
* `imposm -d osm --remove-backup-tables`
* `./make.py` in osm-bright-master

Instead of processing the whole belgium-latest.osm.bz2 file, you can download directly the OSM data using JOSM, save as a .osm (e.g., `extract.osm`) file and use it with imposm. It is much faster.
* `imposm --proj=EPSG:3857 --read extract.osm -m imposm-mapping.py`
* `imposm -U osm -d osm -m imposm-mapping.py --write --optimize --deploy-production-tables`
* `imposm -d osm --remove-backup-tables`


All together:

```
imposm --proj=EPSG:3857 --read osm-files/extract.osm -m imposm-mapping.py --overwrite-cache && imposm -U osm -d osm -m imposm-mapping.py --write --optimize --deploy-production-tables && imposm -d osm --remove-backup-tables
```


# Changes compared to OSMBright

## 1) Simplification of OSMBright
Currently, my goal is not to generate map tiles at different zoom levels, but rather to generate large map file for printing paper maps, at a fairly high resolution/large scale. As a result, the OSMBright styles was highly simplified:
* no zoom levels are considered
* no generalized layers are used, no roads_low or roads_med

## 2) Addition of new features

### 2.1) By adding some fields to an existing table
1) Add the field names + type of the field (boolean, numeric, string) to an existing table.

```
    fields = (
            ...
            ('surface', String()),
            ('tracktype', String())
            )
```

Compared to the default OSMBright style, some features were added in the imposm-mapping.py file:
* The tracktype=* and surface=* keys for highway=track
* The leaf_type=* & leaf_cycle=* keys for landuse=forest

2) Then, the field name should be added in `project.mml` in the layer where this field should be used.
Example:

```
"table": "( SELECT geometry, type, tunnel, bridge, tracktype, access, ...
```

3) Lastly, for defining a specific style for, e.g., the tracktype, do it in the right mss style file.

```
[tracktype='grade1'] { line-width: @rdz16_min / 2; }
```


### 2.2) By adding a new table
1) You can create a new table with a specific tag and fields selection in `imposm-mapping.py`. See for instance how to create a table named 'linearfeatures' with the tags 'man_made=embankment' and 'embankment=yes'. Note that the commas at the end of the values of the keys are needed, even before a closing bracket!

```
linearfeatures = LineStrings(
   name = 'linearfeatures',
   mapping = {
           'man_made': (
              'embankment',
           ),
            'embankment': (
               'yes'
            ),
       },
)
```

2) Then add a specific layer in `project.mml`:

Example for the layer linear_features:
```
{
  "Datasource": {
    "dbname": "osm",
    "extent": "-20037508.34,-20037508.34,20037508.34,20037508.34",
    "geometry_field": "geometry",
    "id": "linear_features",
    "key_field": "",
    "srs": null,
    "table": "( SELECT geometry, type\n  FROM osm_linearfeatures\n)  AS data",
    "type": "postgis"
  },
  "class": "",
  "geometry": "linestring",
  "id": "linear_features",
  "name": "linear_features",
  "srs": "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over",
  "srs-name": "900913",
  "status": "on"
},
```


3) Finally, define a style for this layer in one the mss files:

`#linear_features: { ... }`



## 3) Addition of a third outline for roads
In Mapnik, like in many cartographic software, you can render complex road symbology using superimposed layer with different width, e.g., a simple road rendered as a white band bordered by black lines is actually made by a first layer where roads are rendered using a large black band + a second layer (on top of it) where roads are rendered with a thinner white band.

For displaying complex road symbols, one may need a third layer. For instance, in OpenArdenneMap, large tracks (track_type = 1) are rendered with a dash white-red line bordered by a black line.
This third layer have cartoCSS properties under `#roads::top`.


## 4) Customisation of the map style
Of course, the style of the map was modified, with some inspiration taken from OpenTopoMap and other topographic maps. Main modifications are:
* increase font size
* custom colors
* Symbol creation
* Pattern creation
* Automatic orientation of some features (cfr https://blog.champs-libres.coop/carto/2018/12/18/openardennemap.html)


# Contour lines

NOTE: Contour lines files are not pushed to this repository because of their size. Here is the recipe for their generation. Have also see [this article](https://www.champs-libres.coop/blog/post/2019-11-21-beautiful-contour-belgium/) with a link for downloading beauticul contour lines for Belgium.

## DEM pre-processing
Before the contour lines generation, the digital elevation model (DEM) was filtered and known water streams were burned into the DEM. The following treatment chain was followed using the free and open source software Whitebox GAT (https://www.uoguelph.ca/~hydrogeo/Whitebox/):
1) Filter "denoise";
2) Burn the water ways into the DEM by using the "Burn Streams" tool with a burning depth of 10 m and a decay of 0.7;
3) Mean filter with 5 m of window size;
4) Repair DEM depressions with the "Breach depressions" tool. (max. length of 50 m)

## Contour lines generation
Contour lines were then generated from the filtered DEM using the GRASS tool `r.contour.step` in QGIS. Increment between contour levels was set to 5 m. Minimum number of points for a contour line was set to 20. This tool offers more options that the default QGIS tool from gdal (`gdal_contour`).

Contour lines should be post-processed in order to have smooth geometries. The GRASS tool `v.generalize.smooth` was used, with the "snakes" algorithm (with default parameters).

In order to increase the readability of the contour lines, some lines are defined as "master". Here, I put every lines with a altitude (the "ELEV" field) equal to a multiple of 20 as a "master" line. This is directly computed in the `base.mss` file as follows:
```
[[ELEV] % 20 = 0]
```

## Contour lines representation

Contour lines were saved as shp and loaded as the second layer (from bottom) in project.mml. Contour labels are defined in `labels.mss`.

## 5) printing
Some useful commands for printing the map in a pdf format:

* Determining the size of a pdf:
`pdfjam --outfile A2.pdf --landscape --paper a2paper nosize.pdf`

or

`cpdf -scale-to-fit a0landscape nosize.pdf -o A2.pdf`

* Make several A4 of a A2 pdf:
`pdfposter -ma4 -pa2 A2.pdf out_A4.pdf`

or
`mutool poster -x 2 -y 2 A2.pdf A4.pdf`


# TODOs
* new features:
  * point of view
  * réservoir (man_made = water_works, water_well, pumping_station ...)
  * station d'epuration
  * éolienne Eol.
  * Poste
  * police
  * départ de promenade, guide post
  * oeuvre d'art
  * piscine
  * caillebotis
  * fagnes spéciales...
  * chemins nommés (ex Chemin des Princes)
  * forest labels


* rotated culvert symbols
* sentier balisés... (en option)
* sub/superscript writing
* tile-server

# post SQL queries
```
psql -d osm -c 'ALTER TABLE osm_pointfeatures RENAME COLUMN "tower:type" TO tower_type;'
```
