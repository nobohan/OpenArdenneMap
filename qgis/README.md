QGIS
====


## Usage

Open the oam.qgs project file and use the map composer for producing some maps. You would need a PostGIS database with OSM data imported with `osm2pgsql` with the custom OpenArdenneMap `style` file, as for Mapnik.

For convenience, all the OpenArdenneMap layers are grouped into a group in the layer tree. Depending on your computer CPU, the QGIS project is very slow to operate (zoom in, move in the map): to go faster, you can navigate into the map using a external XYZ layer (like the osm-be that is loaded by default) with the OpenArdenneMap group unchecked.

## FAQs

### The hillshade and the contour files are not loaded in the QGIS project

The QGIS project file holds some reference to external files that are not available in this repository: a hillshade file (hillshade.tif) and a shpaefile (contour.shp). These data must be projected under EPSG:3857. The reason why this data is not in a repository is that they are very large.

For Belgium, you can download hillshade and contour lines from these addresses: http://opendata.champs-libres.be/hillshade_belgium.zip and http://opendata.champs-libres.be/beautiful-contour-belgium.zip. (See this blog post in French for some context: https://www.champs-libres.coop/blog/post/2020-06-24-beautiful-hillshade-belgium/)

For other parts of the world, see for instance [this reference](https://github.com/der-stefan/OpenTopoMap/blob/master/mapnik/HOWTO_DEM.md) for creating hillshade and contour lines.

### Why do I need to setup a PostGIS database? Can we use shapefiles?

Because OpenArdenneMap renders specific map features.  that are not in the standard shapefiles from OSM.

You may know that there exists some "standard" extracts of OSM data in the shapefile format provided by Geofabrik, a German company (see <https://download.geofabrik.de/>). For most of GIS users, it is much more easier to work with these shapefiles rather than building a database. Unfortunately, these shapefiles miss some map features that are used in the OpenArdenneMap style. Furthermore, the use of a geographic database allows for on-the-fly data processing of geographic data. That's why OpenArdenneMap uses a PostGIS database, rather than geographic files.

If you are looking for QGIS styles working with shapefiles, there are plenty of them available under open licenses. Have a look a these ones for instance:

- https://gitlab.com/champs-libres/public/champs-libres-qgis-osm-style
- https://github.com/mkoenigb/OSM-Geofabrik_Universal-QML-Style
- https://github.com/HeikkiVesanto/QGIS_OSM_Styles
- https://github.com/FionaPrudhomme/Stylesheet-QGIS-OpenTopoMap
- https://github.com/charlesmillet/qgis_osm_styles
- https://github.com/charleyglynn/OSM-Shapefile-QGIS-stylesheets


## About QGIS for OpenArdenneMap

OpenArdenneMap was originally developed as a cartographic style with the `imposm` importer and a `cartoCSS` style derived from OSMBright. Later the `osm2pgsql`importer was used instead of the `imposm`. From 2023, the OpenArdenneMap is also available in QGIS, using the same `osm2pgsql` importer for building the map layers.

The tools used for making maps have some influence on the cartographic style itself. The aim of this QGIS support is to reproduce the same feeling than the maps produced with the Mapnik/cartoCSS style, even though the 2 solutions are not 100% equivalent.

Although it still requires a postGIS database, the QGIS style is much simpler to use for composing maps at various scales than the Mapnik/cartoCSS one. It was also much simpler to set up.

Here are some key findings when moving this style from Mapnik/cartoCSS to QGIS.

### Much more simple rules for scaling in QGIS

QGIS supports the use of geographic units for defining the sizes of symbols (meters at scale, map units), whereas Mapnik/cartoCSS, as far as I know, only deals with pixels units. It means that, in QGIS, you can define a size which will be depending on the map scale. This is really useful for very high map scale (i.e., > 1:10000), where some elements such as road widths can take their "real" size on the map. For the same effect in Mapnik, we have to define different widths for every zoom level.

### Use of QGIS variables

A key advantage of using Mapnik and cartoCSS is that we can define variables that are used throughout the project, typically for some dimensioning variables and colors. Hopefully, we can also define variables in a QGIS project (Go to Project > Properties > Variables) and use them in the style definitions.

### Use filtered full Postgis table filtered vs SQL layers

The same layers used in Mapnik were used as QGIS layers. Often, these layers are not just some filters applied to a "planet_osm_points|lines|polygons" table but they do some data transformation. For instance, the layer for water labels is as follows:

```
SELECT way, waterway AS type, replace(name, 'Ruisseau', 'Rau') AS name
FROM planet_osm_line
WHERE waterway IN ('canal', 'river', 'stream') AND name IS NOT NULL
UNION ALL
SELECT
    ST_LineMerge(ST_ApproximateMedialAxis(ST_SimplifyPreserveTopology(ST_MakePolygon(ST_ExteriorRing(way)), 50))) AS way,
    water AS type,
    replace(replace(name, 'Etang', 'Étg'), 'Étang', 'Étg') AS name
FROM planet_osm_polygon
WHERE water IN ('pond', 'lake', 'basin', 'reservoir') AND name IS NOT NULL AND way_area > 10000
```

which combines linear ways from `planet_osm_line` with lines created from `planet_osm_polygon` using a bunch of PostGIS functions (ST_ApproximateMedialAxis, etc.).

These PostGIS queries were just defined as layers in the QGIS DB manager and then added to the map.

However, for some performances issues, it seems easier to filter directly from a PostGIS layer from the DB rather than defining a new SQL layer with the DB manager. Whenever possible, layers are full PostGIS tables that are just filtered for the required elements.


### How to prevent overlapping symbols/labels

This is a core functionality of Mapnik, and a so common but also so hard issue in cartography: how do you prevent symbols that overlaps each other, either from the same layer or from different layers? The same applies to labels. Unfortunately, until now preventing overlapping symbols was not found in QGIS.



TODO:

- overlapping symbols for small bridges, picnic tables, etc.
- mapnik and qgis: cast direction as integer.