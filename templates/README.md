OpenArdenneMap templates
========================


OpenArdenneMap templates are svg files for composing a printed map.

## Map grid

The map grid is made using the map composer of QGIS.

## Marked trails list

The marked trail list is made by querying the OSM database and writing a list of marked trails in a svg file.

See ./marked_trails/. There is a small script runnning in a virtual env.

```bash
pip3 install -r requirements.txt
source /bin/activate
python3 marked_trails.py
```

You can change the location (bbox) in `parameters.py`.

## Scale factor

The svg files that are produced with the OAM map style have a huge resolution to have a very fine print resolution (for map patterns, that are sadly rasterised in the current version of Mapnik)

To fit these svg files in the template, scale the map by 18.3 %.


