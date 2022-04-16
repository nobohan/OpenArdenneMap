OpenArdenneMap templates
========================


OpenArdenneMap templates are svg files for composing a printed map.

## How-to

### General instructions and installation

We assume you have a running OSM postgre database as well as carto, Mapnik and their usual friends installed (see the README at the root of this repo).

There is a small script, `main.py`, that outputs a svg file with the marked trail list and a map using `makeMap.py`.

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

Change the location (center in EPSG:3857 coordinates) in `parameters.py` and then run `python3 main.py` with the virtual env activated:

```bash
templates/marked_trails$ source bin/activate
(marked_trails) templates/marked_trails$ python3 main.py
```
This script will produce the raw map file and already compose the templated map file.

3) Fine-tune the map in Inkscape and export it as pdf or png


Note: although the labels are in a single object in the final map, it is really hard to manipulate this object in Inkscape due to the size of the svg file. A workaround is to comment the adding of the labels layer and to add it manually. To do so, use the "import" function of inkscape, put the imported label in a layer (for convenience, eg it allows to freeze all others objects/layer while working on the labels), scale it to 18% and ungroup the layer using the "Extensions > Arrange > Deep ungroup" function.

## Components

### Map grid

The map grid is made using the map composer of QGIS.

### Marked trails list

The marked trail list is made by querying the OSM database and writing a list of marked trails in a svg file.

See ./marked_trails/. There is a small script running in a virtual env.

## Why this scale factor of 18%

The svg files that are produced with the OAM map style have a huge resolution to have a very fine print resolution (for map patterns, that are sadly rasterised in the current version of Mapnik).

To fit these svg files in the template, scale the map by **18 %**.


## Différenciation labels <> background

```bash
carto osm2pgsql/project-labels.mml > osm2pgsql/OpenArdenneMap-labels.xml
carto osm2pgsql/project-background.mml > osm2pgsql/OpenArdenneMap-background.xml
```


# Improvements

- put a list of map in the website
- revoir template pour du pliage
## Write the complete procedure and automatise

- choose map center in templates.qgs: CANNOT AUTOMATISE
- copy coordinates in parameters.py + name
- activate the venv
- run marked_trails.py
~~copy and rename the svg template file (can do it in marked_trails.py):~~ OK
- in the svg file, update the date: ok
- in the svg file, write down the km and updateness
- in the svg file, write down the name of the map : ok
- in the svg file, import the marked trails list in the right Layer and optionnaly adapt it: ok
- in the svg file, import the map in the right Layer, scale it, move it: ok
- export the svg as png : ok (edit and run the export-svg-as-png.bash)
- transform the png in pdf (edit and run the img2pdf.bash)
- make the thumbnail (edit and run the make-thumbnaik.bash)
- copy the thumbnail into hiking.osm repo
- transfer the pdf on nextcloud
- make and copy the share link
- set no expiry date on the share link
- put the share link in the frame gpkg layer
- remove holes in the gpkh layer: put in convert-gpkg-geojson sh: todo
- export the layer as valid geojson (run convert-gpkg-geojson sh)
- push on the hiking repo
- check after a while if everything's right on the website


AFTER AUTOMATISATION:


- choose map center in templates.qgs: CANNOT AUTOMATISE
- copy coordinates in parameters.py + name
- activate the venv
- run "python3 main.py"
- optionnally, add labels manually rather than automatically and deep ungroup them:
  - create a layer labels
  - add label svg
  - scale them 18%
  - ungroup: using deep ungroup (take a few minutes)
- export the svg as png : ok (edit and run the export-svg-as-png.bash)
- transform the png in pdf (edit and run the img2pdf.bash)
- make the thumbnail (edit and run the make-thumbnaik.bash)
- copy the thumbnail into hiking.osm repo
- transfer the pdf on nextcloud
- make and copy the share link
- set no expiry date on the share link
- put the share link in the frame gpkg layer
- remove holes in the gpkh layer: put in convert-gpkg-geojson sh: todo
- export the layer as valid geojson (run convert-gpkg-geojson sh)
- push on the hiking repo
- check after a while if everything's right on the website


