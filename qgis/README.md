QGIS
====



## Layers: use postgis table filtered or SQL layers with the DB manager

For some performances issues, it seems easier to filter from a PostGIS layer from the DB rather than defining a new SQL layer with the DB manager. So whenever possible, layers are PostGIS layer that are just filtered for the required elements.

## Much more simple rules for scaling

QGIS has some geographic unit for defining the sizes of symbols (meters at scale, map units, ), whereas Mapnik/cartoCSS, as far as I know, only deals with pixels units.


## Use of QGIS variables

A key advantage of using Mapnik and cartoCSS is that we can define variables that are used throughout the project, typically for some dimensioning variables and colors. Hopefully, we can also define variables in a QGIS project (Go to Project > Properties > Variables) and use them in the style definitions.

## How to prevent overlapping symbols

This is a core functionality of Mapnik, and a so common but also so hard issue in cartography: how do you prevent symbols that overlaps each other, either from the same layer or from different layers?



TODO:

- overlapping symbols for small bridges