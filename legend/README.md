Legend with Mapnik
-------------------


# HOW-TO

## commandes
carto legend.mml > legend.xml && python legend.py

## How to build the legend
1) Add layers in legend.mml: the same numbers of layers should be in legend.mml as in the mml map file + label layers (the denomination of the legend items).

2) Add corresponding items in legend.geojson: this layer store the geometric information for each legend item.

3) For the denomination of the legend items only, add text in legend_label.mss.
