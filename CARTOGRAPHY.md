# CARTOGRAPHY

## Cartography principles

OpenArdenneMap is map style specifically designed for the production of high-resolution printed topographic map from OpenStreetMap data. It is geographically situated, meaning it targets the production of maps around the Ardenne area, although it can be used in other geographical contexts. It is inspired by the map style of topographic maps from the Belgian Geographical Institute from the 80's.

The map style is optimised for printed map through several adaptations: a exaggeration of the resolution for printing map patterns, an increase in the size of labels compared to web map tiles, etc. Though, it can be used for building map tiles to be used in a slippy web map. Another particularity is that it uses only four base colors (red, green, blue and marron), so that it can be easily used for producing files with color separation to be used in offset printing. This small set of colors is also one of the map design principle from a aesthetic point of view.

The map style is tailored for OpenStreetMap data, although elevation data from other sources is also used (contour lines and hillshade). In case these data are not available, the layers using them can be set to off. The map style is originally written in cartoCSS for use with Mapnik, but other map design language could be used in the future.


## Labels

One of the map design principles is that many features are represented by a label rather than by a symbol. It results in a map where there are a lot of labels, which minimises the need for the map key. OpenArdenneMap uses a Belgian typography, Alfphabet, originating from the 40's and that was used for road signage and by the Belgian railroad agency. Alfphabet was rediscovered and formalised as a font in the 90's by the Open Source Publishing typographic group.


## Symbols

Point symbols are simple. In general, they represent the features not necessarily like they appear in the reality but by an abstract symbol commonly used in cartography. Sometimes, this abstract symbol may represent the feature from a horizontal point a view, like it appears from the ground (e.g., windmill, cross, picnic table). On other cases, it represents the feature from a vertical perspective, i.e., viewed from above (e.g., trees, hedges, small trees, sport pitches). When suitable, the vertical perspective (view from above) is preferred. As said before, many features are not identified by a symbol but rather by a label. When available, the name of the feature (e.g., name of a peak) is added below the symbol.

## Roads

Roads and tracks are symbolised using up to 4 different ways (inner color, plain/dash inner, outline and plain/dash line for the outline). Roads are symbolised using a outline + an inner color. Tracks are symbolised using a outline, an inner color (white or dashed white/red) and the outline can be dashed, on both side or just on one side. Paths (i.e., tracks that are not wide enough for a 4-wheel vehicle) are symbolised with a single dashed line. There is a fine classification of tracks according to the importance/usability of the track, that results in 5 classes for rendering tracks (corresponding to the OSM tag `tracktype=*`) and 2 classes for paths (according to the usability of the path, thanks to the `trail_visibility=*` OSM tag. )