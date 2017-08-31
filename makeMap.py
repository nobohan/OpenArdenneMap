# OpenArdenneMap - Pilot mapnik with python - June 2017

from mapnik import *

# The mapFile is generated using carto from cartoCSS files.
mapFile = 'cartoCSS/OpenArdenneMap.xml'

# The mapOutput can be have different extension; png, pdf, svg, ...
mapOutput = 'OpenArdenneMap.png'

# Map size
# NB: An A4 in 200 dpi is 1654 x 2339 px, or 21 cm x 29.5 cm
# the ratio of format is sqrt(2)

page = 'A2' # An A2 is 4 A4

# increasing map_x and map_y lead to decreasing font and symbol size: not good
map_x = 4*2339
map_y = 4*1654
m = Map(map_x,map_y)
load_map(m, mapFile)

# Bbox (expressed in EPSG:3857, meters)
xmin = 609650
xmax = 624350
ymin = 6396000
ymax = 6406394
bboxCartePigeonPaysage = (Envelope(xmin, ymin, xmax, ymax))

delta_x = xmax - xmin    # 14.7 km
delta_y = ymax - ymin  # 10.394 km
# check that delta_y./delta_x = sqrt(2) = 1.4142135623730951

bbox = bboxCartePigeonPaysage
m.zoom_to_box(bbox)

print "Scale = " , m.scale()

# Compute the scale
if (page == "A2"):
  f = 2
if (page == "A4"):
  f = 1

computedScale = f*0.295/delta_x # correspond to 1/25000
print "Computed scale = 1/" , round(1/computedScale)
print "delta_y is ", delta_y, " m"

# Export to mapOutput
render_to_file(m, mapOutput)
