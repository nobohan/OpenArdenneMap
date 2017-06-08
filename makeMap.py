# OpenArdenneMap - Pilot mapnik with python - June 2017

from mapnik import *

# The mapFile is generated using carto from cartoCSS files.
mapFile = 'cartoCSS/OpenArdenneMap.xml'

# The mapOutput can be have different extension; png, pdf, svg, ...
mapOutput = 'OpenArdenneMap.png'

# Map size
# NB: An A4 in 200 dpi is 1654 x 2339 px
resolution = 4
m = Map(resolution*2339,resolution*1654)
load_map(m, mapFile)

# Bbox (expressed in EPSG:3857)
bboxCartePigeonPortrait = (Envelope(612000, 6394000, 624730, 6412000))
bboxCartePigeonPaysage = (Envelope(608000, 6396000, 626000, 6408730))

delta_x = 624730 - 612000    # 12.73 km
delta_y = 6394000 - 6412000  # 18 km

bbox = bboxCartePigeonPaysage
m.zoom_to_box(bbox)

print "Scale = " , m.scale()

# Export to mapOutput
render_to_file(m, mapOutput)
