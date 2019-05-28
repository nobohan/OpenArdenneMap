Street labelling with Mapnik


# How it is done in the default "Mapnik-style on osm.org


See the layer `#roads-text-name`. It uses the following properties:

```
text-name: "[name]";
text-size: 8;
text-fill: black;
text-spacing: 300;
text-clip: false;
text-placement: line;
text-halo-radius: @standard-halo-radius;
text-halo-fill: @residential-fill;
text-face-name: @book-fonts;
text-repeat-distance: @minor-highway-text-repeat-distance;
```

Note that there is also a shield for the road reference.


# How it is done in OpenArdenneMap (from OSMBright)

* there is a layer "street_label", which is a point layer
* it uses the following properties:
```
text-name:'[name]';
text-face-name: @sans;
text-placement: line;
text-wrap-width: 400;
text-character-spacing: 2;
text-line-spacing: 1;
text-fill: @road_text;
text-halo-fill: #ffffff;
text-halo-radius: 2;
text-allow-overlap: true;
text-size: @text_size_xs;
```

where:
* text-placement: line; is important for street labeling.
* text-allow-overlap: true; allows street labels to overlap with other text layers.


# How to force labelling

* decrease the font-size (ça c'est malin)
* replace some text by some abbrev.
* clear-label-cache": "on" au niveau de la couche: pas vu d'effet
* text-upright: the default value ("auto") seems to maximise the placement. Other values can result in nice placement, but often
with a lower number of street labels.
* text-simplify: You can use this parameter to simplify the geometry that is labeled. It seems it can have a (limited) effect on the label placement: some labels have disappeared and some others appeared when testing this parameter.
* text-repeat-distance: Put some values (in pixels) to increase the distance between two labels when labels are repeated along a same feature.

a tester:
* text-label-position-tolerance
* wrapper les labels, mais seulement si la distance est faible!


## Replace some text by abbrev.

* replace the text by a set of abbrev.



# Reading
## Tilemill official doc
https://tilemill-project.github.io/tilemill/docs/guides/labels-advanced/

## Some obscure QA threads
https://gis.stackexchange.com/questions/220890/mapnik-cartocss-make-text-labels-overlap-other-layers-but-not-each-other
