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

Due to its collision algorithm, Mapnik won't necessarily display all the street names that exists. However, often, you want to maximise the number of street names that are displayed. Here are some tricks to do so:

## Decrease the `text-size` of the label

Probably the most efficient way to display more labels. But obviously, you cannot decrease too much the text size, especially in case of printed paper maps.

## Replace some text by some abbreviations

Quite efficient, since it will decrease the length of yours labels. In Mapnik, this can be done directly in the project file by defining some replacement rules. If you work with a PostGIS database, use some SQL statements with the SQL function `replace`. To replace several words, the "replace" statements can be nested as follows:

```sql
replace(replace(replace(replace(replace(replace(name, 'Rue', 'R.'), 'Saint', 'St'), 'Chemin', 'Ch.'), 'Place', 'Pl.'), 'Avenue', 'Av.'), 'Boulevard', 'Bd.') AS short_name
```

where we abbreviate here some commons words encountered in French street names.

## Wrap the labels

Labels can be wrapped using the `text-wrap-width` parameter. The smaller the value (in pixels, not the number of letters), the sooner the text will wrap in 2 or more lines.


## Set "text-allow-overlap: true;"

Setting the `text-allow-overlap` parameter to "true" allows street labels to overlap with other text layers. It is particularly useful when other text layers are present.

## text-character-spacing

Decrease the `text-character-spacing` will also condense your text labels, and so could help to place more labels.


## Set "clear-label-cache": "on" in the project file

Set "clear-label-cache": "on" in the project file on the label layer can help whenever there are several text layers.

## Change "text-upright" value

The default value of `text-upright` ("auto") seems to maximise the placement. Other values can result in nice placement, but often
with a lower number of street labels.

## Change "text-simplify"

You can use this parameter to simplify the geometry that is labeled. It seems it can have a (limited) effect on the label placement: some labels have disappeared and some others appeared when testing this parameter.

## text-repeat-distance

Put some values (in pixels) to increase the distance between two labels when labels are repeated along a same feature.

## text-label-position-tolerance

The default value will in general maximise the positioning, but smaller values can reduce the number of text labels.



# Other ideas

* Combine the effects and make the effects dependent on street lengths
   * faire plusieurs "short_name" avec des règles d'abbreviations de plus en plus strictes
   * augmenter text-character-spacing là où il y a de la place.
* Set the main street in bold / larger font size?

# Inspirations from paper maps

* carte de Bxl Atelier Perspective 2010, 1 cm -> 100 m (1/10000)



# Reading
## Tilemill official doc
https://tilemill-project.github.io/tilemill/docs/guides/labels-advanced/

## Some obscure QA threads
https://gis.stackexchange.com/questions/220890/mapnik-cartocss-make-text-labels-overlap-other-layers-but-not-each-other
