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
* replace some text by abbrev.
* 



# Reading
## Tilemill official doc
https://tilemill-project.github.io/tilemill/docs/guides/labels-advanced/

## Some obscure QA threads
https://gis.stackexchange.com/questions/220890/mapnik-cartocss-make-text-labels-overlap-other-layers-but-not-each-other
