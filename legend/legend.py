# OpenArdenneMap - Pilot mapnik with python - April 2018

from mapnik import *

# 1) Generate the geojson

# 2) Use carto for making the xml

# The mapFile is generated using carto from cartoCSS files.
mapFile = 'legend.xml'

# The mapOutput can be have different extension; png, pdf, svg, ...
mapOutput = 'legend.svg'

map_x = 3000
map_y = 1300
m = Map(map_x,map_y)
load_map(m, mapFile)

# Bounding box (expressed in dummy units)
# x_center = 0
# y_center = 0
# delta_x = 200
# delta_y = 200
# xmin = x_center - delta_x/2
# xmax = x_center + delta_x/2
# ymin = y_center - delta_y/2
# ymax = y_center + delta_y/2
xmin = 0
ymin = 0
xmax = map_x
ymax = map_y

bbox = (Envelope(xmin, ymin, xmax, ymax))

m.zoom_to_box(bbox)

# Export to mapOutput
render_to_file(m, mapOutput)
