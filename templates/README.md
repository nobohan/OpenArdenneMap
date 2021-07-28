OpenArdenneMap templates
========================


OpenArdenneMap templates are svg files for composing a printed map.

## How-to

### General instructions and installation

We assume you have a running OSM postgre database as well as carto, Mapnik and their usual friends installed (see the README at the root of this repo).

There is a small script, `marked_trails.py`, that outputs a svg file with the marked trail list and a map using `makeMap.py`.

It runs into a virtual environnment

```bash
$ cd marked_trails
$ pip3 install -r requirements.txt
$ source bin/activate
```

/!\ You need to import OSM data using `osm2pgsql` with the flag `--extra-attributes` to have required fields such as the osm_timestamp that is used to know the average date of the tracks!

### Steps

1) Select your place

What you need are the coordinates of the center of the map, in EPSG:3857, and a map orientation, `PORTRAIT` or `LANDSCAPE`. The most handy is to use the QGIS project `qgis/templates.qgz`: edit the frame layer, copy-paste a frame and move it to the desired location. Then, you can copy the center coordinates from the attribute table into the file `parameters.py`

2) Produce the svg files for the map and the marked trail list

Change the location (center in EPSG:3857 coordinates) in `parameters.py` and then run `python3 marked_trails.py` with the virtual env activated:

```bash
templates/marked_trails$ source bin/activate
(marked_trails) templates/marked_trails$ python3 marked_trails.py
```


3) Compose your map in Inkscape

Copy a template (`A3-portrait.svg` or `A3-landscape.svg`). Import the map and the marked trails list using the 'import' function. Scale the map by 18%. Use the Inkscape layers tab to import the map and the marked trails in the right z-order!


## Components

### Map grid

The map grid is made using the map composer of QGIS.

### Marked trails list

The marked trail list is made by querying the OSM database and writing a list of marked trails in a svg file.

See ./marked_trails/. There is a small script running in a virtual env.

## Why this scale factor of 18%

The svg files that are produced with the OAM map style have a huge resolution to have a very fine print resolution (for map patterns, that are sadly rasterised in the current version of Mapnik).

To fit these svg files in the template, scale the map by **18 %**.


