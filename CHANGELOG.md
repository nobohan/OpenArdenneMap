## v0.5.0 marked-trails

### Description

Add a new map feature: marked trails based on the type=route AND route=hiking relations. Similar to the hiking.waymarkedtrails.org overlay. At the moment, only hiking and foot route relations are supported. 

### Changes
- Add a "trails" layer that shows the hiking marked trails with a thick, offset line; a shield representing the most common marked trails symbols encountered in Ardenne; the distance of the track (if this a short, local trail) and the direction of the way (if the marked symbols are available only in one direction).
- Add a "trails_start" layer showing the starting point of marked trails. Starting point that are closes to each other (<100m) are first merged into one single point. 


## v0.4.0 summer2020

### Description

Some new map features and some enhancement

### Changes
- New map feature: modern windmill used for generating electricity ('power' = 'generator' and 'generator:source' = 'wind'] )
- New map feature: touristic viewpoint ('tourism'='viewpoint') oriented according to the direction tag.
- New line symboliser for highway=path and bridge=yes of a sufficient length, meaning to render grating path ("caillebotis"). 
- Add an optional layer for hillshading
- Add name on tracks and paths

## v0.3.0 scaling

### Description

A huge modification: the style was extended from zoom 10 to 20. See the blog post <http://www.nobohan.be/2020/05/14/openardennemap-scaling/>

### Changes
- The style of all map features (polygones, lines, points, labels) was modified for the zoom levels from 10 to 20. A lot of features were hidden at low zoom levels.
- Scale factors in `cartoCSS/scales.mss` were better defined and now follow regular and logical number sequences.  



## v0.2.0 winter2019-2020

### Description

Some enhancements with the labels, automatic curvature and precise classification of tracks. See the blog post <http://www.nobohan.be/2020/02/05/openardennemap-livraison-hiver-2019-2020/>

### Changes
- inline definition of master contour lines in `base.mss` (see README.md > Contour lines)
- lighter representation of drains and ditches
- create a new layer for cemeteries and put in on top of roads layers
- better computation of building orientation with ST_OrientedEnvelope. Needs postgis 2.5.4+.
- orientation of water areas labels using ST_ApproximateMedialAxis. Needs postgis 2.5.4+.
- Add some abbreviation for "Ruisseau" using Unicode superscript.
- Refinement of track and path symbolisation according to track_type and trail_visibility.


## v0.1.0 2019-12-15

### Description
First version recorded in this changelog. This is a fully working version.

### Changes
- better formatting of the project.mml file,
- update of the README.
