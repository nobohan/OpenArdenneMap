QGIS
====



## Road dimensions

- Primary:

  - 0 - 1:10000:



## Much more simple rules for scaling

QGIS has some geographic unit for defining the sizes of symbols (meters at scale, map units, ), whereas Mapnik/cartoCSS, as far as I know, only deals with pixels units.


## Use of QGIS variables

A key advantage of using Mapnik and cartoCSS is that we can define variables that are used throughout the project, typically for some dimensioning variables and colors. Hopefully, we can also define variables in a QGIS project (Go to Project > Properties > Variables) and use them in the style definitions.

