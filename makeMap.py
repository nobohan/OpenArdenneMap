# OpenArdenneMap - Pilot mapnik with python - June 2017

import math
from mapnik import Map, Envelope, render_to_file, load_map

PAGES = (4, 3, 2, 1, 0, -1, -2)

X_CENTER = 428900
Y_CENTER = 6551200
LATITUDE = 50 # in degrees

# The mapFile is generated using carto from cartoCSS files.
# /!\ Choose the right importer here: osm2pgsql or imposm!
MAPNIK_FILE = 'osm2pgsql/OpenArdenneMap.xml'


def make_map(map_output, scale=20000, page_format = 'A4', x = X_CENTER, y = Y_CENTER):
    "Make a map as a function of the scale"

    # Compute the scale
    page_size = int(page_format[1])
    f = math.sqrt(2)**PAGES[page_size]

    # increasing map_x and map_y lead to decreasing font and symbol size: not good
    map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length

    # if 460: zoom = 13
    map_y = int(map_x/math.sqrt(2))
    m = Map(map_x, map_y)
    load_map(m, MAPNIK_FILE)

    # Bounding box (expressed in EPSG:3857, meters)
    delta_x = f*0.295*scale/math.cos(LATITUDE*2*math.pi/360)
    delta_y = delta_x/math.sqrt(2)
    xmin = x - delta_x/2
    xmax = x + delta_x/2
    ymin = y - delta_y/2
    ymax = y + delta_y/2

    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print("Scale = " + str(m.scale()))

    render_to_file(m, map_output)

make_map('OAM_brugelette_zoom_A4.pdf', 4000, 'A4', 428900, 6550200)
#make_map('OAM_brugelette_full_A1.pdf', 12500, 'A1')
make_map('OAM_brugelette_full_A4.pdf', 12500, 'A4')
make_map('OAM_brugelette_full_A5.png', 12500, 'A5')
