# OpenArdenneMap - Pilot mapnik with python - June 2017

from mapnik import *
import math

# The mapFile is generated using carto from cartoCSS files.
mapFile = 'cartoCSS/OpenArdenneMap.xml'

# The mapOutput can be have different extension; png, pdf, svg, ...
mapOutput = 'OpenArdenneMap.pdf'

# Map size
# NB: An A4 in 200 dpi is 1654 x 2339 px, or 21 cm x 29.5 cm
# the ratio of format is sqrt(2)

page = 'A2'  # An A2 is 4 A4
pages = (4, 3, 2, 1, 0)
# Compute the scale
page_size = int(page[1])
f1 = pages[page_size]
f = math.sqrt(2)**f1

# increasing map_x and map_y lead to decreasing font and symbol size: not good
map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length
map_y = int(map_x/math.sqrt(2))
m = Map(map_x, map_y)
load_map(m, mapFile)

# Bounding box (expressed in EPSG:3857, meters)
x_center = 617000
y_center = 6402197

scale = 20000
delta_x = f*0.295*scale/math.cos(50*2*math.pi/360)
delta_y = delta_x/math.sqrt(2)
xmin = x_center - delta_x/2
xmax = x_center + delta_x/2
ymin = y_center - delta_y/2
ymax = y_center + delta_y/2

bbox = (Envelope(xmin, ymin, xmax, ymax))


m.zoom_to_box(bbox)

print("Scale = " + str(m.scale()))

# Export to mapOutput
render_to_file(m, mapOutput)
