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
Edit the imposm-mapping.py file. Some features are added in OpenArdenneMap, such as tracktype and leaf_cycle/leaf_type. See below.

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

### Adding some fields to an existing table
Add the field names + type of the field (boolean, numeric, string) to an existing table.

```
    fields = (
            ('surface', String()),
            ('tracktype', String())
            )
```

Compared to the default OSMBright style, some features were added in the imposm-mapping.py file:
* The tracktype=* and surface=* keys for highway=track
* The leaf_type=* & leaf_cycle=* keys for landuse=forest

### Add a new table
You can create a new table with a specific tag and fields selection. See for instance how to create a table named 'linearfeatures' with the tags 'man_made=embankment' and 'embankment=yes'. Note that the commas at the end of the values of the keys are needed, even before a closing bracket!

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
### Update the db using imposm
Here are the commands for using imposm with this imposm-mapping:
* `imposm --proj=EPSG:3857 --read belgium-latest.osm.bz2 --limit-to map_extent.shp -m OpenArdenneMap/imposm-mapping.py`
* `imposm -U osm -d osm -m OpenArdenneMap/imposm-mapping.py --write --optimize --deploy-production-tables --limit-to map_extent.shp`
* `imposm -d osm --remove-backup-tables`
* `./make.py` in osm-bright-master

## 3) Addition of a third outline for roads
In Mapnik, like in many cartographic software, you can render complex road symbology using superimposed layer with different width, e.g., a simple road rendered as a white band bordered by black lines is actually made by a first layer where roads are rendered using a large black band + a second layer (on top of it) where roads are rendered with a thinner white band.

For displaying complex road symbols, one may need a third layer. For instance, in OpenArdenneMap, large tracks (track_type = 1) are rendered with a dash white-red line bordered by a black line.
This third layer have cartoCSS properties under `#roads::top`.


## 4) Customisation of the map style
Of course, the style of the map was modified, with some inspiration taken from OpenTopoMap and other topographic maps. Main modifications are:
* increase font size
* custom colors

# Contour lines

## Contour lines generation
Contour lines were generated from a digital elevation model (raster) using the GRASS tool `r.contour.level` in QGIS. Increment between contour levels was set to 5 m. Minimum number of points for a contour line was set to 10. This tool offers more options that the default QGIS tool from gdal (`gdal_contour`). Elevation levels should be defined in the field "level" (default).

## Contour lines representation
Contour lines should be post-processed in order to have smooth geometries. The GRASS tool `v.generalize.smooth` was used, with the "snakes" algorithm (default parameters).

Contour lines were saved as shp and loaded as the second layer (from bottom) in project.mml.

Contour labels are defined in `labels.mss`.

## 5) printing
Some useful commands for printing the map in a pdf format:

* Determining the size of a pdf:
`pdfjam --outfile A2.pdf --paper a2paper in.pdf`

* Make several A4 of a A2 pdf:
`pdfposter -ma4 -pa2 A2.pdf out_A4.pdf`
