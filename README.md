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
`carto cartoCSS/project.mml > OpenArdenneMap.xml`

## To generate the map:
`python makeMap.py`

# Changes compared to OSMBright

## 1) Simplification of OSMBright
Currently, my goal is not to generate map tiles at different zoom levels, but rather to generate large map file for printing paper maps, at a fairly high resolution/large scale. As a result, the OSMBright styles was highly simplified:
* no zoom levels are considered
* no generalized layers are used

## 2) Addition of new features
TODO

## 3) Customisation of the map style
Of course, the style of the map was modified, with some inspiration taken from OpenTopoMap and other topographic maps.
