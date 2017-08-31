OpenArdenneMap

# About
OpenArdenneMap is a customized map based on OpenStreetMap. It is based on OSMBright and inspired by OpenTopoMap.

# How to use it

* This was developed inside a python virtual environment
* Install Mapnik
* Install impsom
* Install carto
  * (For these last three points, have a look at OSMBright)
* Clone or download the OpenArdenneMap files

## To change the way the OSM data are imported:
Edit the imposm-mapping.py file. Some features are added in OpenArdenneMap, such as tracktype and leaf_cycle/leaf_type.

## To change the style of the map:
Edit the mss files using cartoCSS language and use `carto` to generate the `OpenArdenneMap.xml` mapnik file. Then:
`carto cartoCSS/project.mml > cartoCSS/OpenArdenneMap.xml`

## To generate the map:
`python makeMap.py`

## All together
`carto cartoCSS/project.mml > cartoCSS/OpenArdenneMap.xml && python makeMap.py`

# Changes compared to OSMBright

## 1) Simplification of OSMBright
Currently, my goal is not to generate map tiles at different zoom levels, but rather to generate large map file for printing paper maps, at a fairly high resolution/large scale. As a result, the OSMBright styles was highly simplified:
* no zoom levels are considered
* no generalized layers are used, no roads_low or roads_med

## 2) Addition of new features
Compared to the default OSMBright style, some features were added in the imposm-mapping.py file:
* The tracktype=* key for highway=track
* The leaf_type=* & leaf_cycle=* keys for landuse=forest

Here are the command for using imposm with this imposm-mapping:
* imposm --proj=EPSG:3857 --read belgium-latest.osm.bz2 --limit-to map_extent.shp -m OpenArdenneMap/imposm-mapping.py
* imposm -U osm -d osm -m OpenArdenneMap/imposm-mapping.py --write --optimize --deploy-production-tables --limit-to map_extent.shp
* imposm -d osm --remove-backup-tables
* ./make.py in osm-bright-master

## 3) Addition of a third outline for roads
In Mapnik, like in many cartographic software, you can render complex road symbology using superimposed layer with different width, e.g., a simple road rendered as a white band bordered by black lines is actually made by a first layer where roads are rendered using a large black band + a second layer (on top of it) where roads are rendered with a thinner white band.

For displaying complex road symbols, one may need a third layer. For instance, in OpenArdenneMap, large tracks (track_type = 1) are rendered with a dash white-red line bordered by a black line.
This third layer have cartoCSS properties under `#roads::top`. 


## 4) Customisation of the map style
Of course, the style of the map was modified, with some inspiration taken from OpenTopoMap and other topographic maps. Main modifications are:
* increase font size
* custom colors
