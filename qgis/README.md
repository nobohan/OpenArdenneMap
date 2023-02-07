QGIS
====


## Usage

Open the oam.qgs project file and use the map composer for producing some maps. You would need a PostGIS database with OSM data imported with `osm2pgsql` with the custom OpenArdenneMap `style` file, as for Mapnik.

## About QGIS for OpenArdenneMap

OpenArdenneMap was originally developed as a cartographic style with the `imposm` importer and a `cartoCSS` style derived from OSMBright. Later the `osm2pgsql`importer was used instead of the `imposm`. From 2023, the OpenArdenneMap is also available in QGIS, using the same `osm2pgsql`importer.

The tools used for making maps have (unfortunately) some influence on the cartographic style itself. The aim of this QGIS support is to reproduce the same feeling than the maps produced with the Mapnik/cartoCSS style, even though the 2 solutions are not 100% equivalent.

Although it still requires a postGIS database, the QGIS style is much simpler to use for composing maps at various scales than the Mapnik/cartoCSS one. It was also much simpler to set up.

Here are some key findings when moving this style from Mapnik/cartoCSS to QGIS.


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

However, for some performances issues, it seems easier to filter from a PostGIS layer from the DB rather than defining a new SQL layer with the DB manager. Whenever possible, layers are full PostGIS tables that are just filtered for the required elements.

### Much more simple rules for scaling in QGIS

QGIS supports the use of geographic units for defining the sizes of symbols (meters at scale, map units), whereas Mapnik/cartoCSS, as far as I know, only deals with pixels units. It means that, in QGIS, you can define a size which will be depending on the map scale. This is really useful for very high map scale (i.e., > 1:10000), where some elements such as road widths can take their "real" size on the map. For the same effect in Mapnik, we have to define different widths for every zoom level.

### Use of QGIS variables

A key advantage of using Mapnik and cartoCSS is that we can define variables that are used throughout the project, typically for some dimensioning variables and colors. Hopefully, we can also define variables in a QGIS project (Go to Project > Properties > Variables) and use them in the style definitions.

### How to prevent overlapping symbols/labels

This is a core functionality of Mapnik, and a so common but also so hard issue in cartography: how do you prevent symbols that overlaps each other, either from the same layer or from different layers? The same applies to labels. Unfortunately, preventing overlapping symbols was not found in QGIS.



TODO:

- overlapping symbols for small bridges, picnic tables, etc.
- mapnik and qgis: cast direction as integer.