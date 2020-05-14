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
