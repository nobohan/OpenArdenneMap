# OpenArdenneMap - Pilot mapnik with python - June 2017

import math
from mapnik import Map, Envelope, render_to_file, load_map

PAGES = (4, 3, 2, 1, 0, -1, -2)

X_CENTER = 428900
Y_CENTER = 6551200
LATITUDE = 50.59 # in degrees

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

    print('Extent = ' + str(xmin) + ', ' + str(ymin) + ', ' + str(xmax) + ', ' + str(ymax))

    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print('Scale = ' + str(m.scale()))

    render_to_file(m, map_output)


def make_map_bbox(map_output, xmin, ymin, xmax, ymax, scale=3000):
    "Make (mini)-map as a function of a bbox, for a defined scale"

    # Compute the scale
    delta_x = xmax-xmin
    delta_y = ymax-ymin
    ratio = delta_x/float(delta_y)

    f = delta_x / (0.295*scale/math.cos(LATITUDE*2*math.pi/360))
    map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length

    map_y = int(map_x/ratio)
    m = Map(map_x, map_y)
    load_map(m, MAPNIK_FILE)

    print('Extent = ' + str(xmin) + ', ' + str(ymin) + ', ' + str(xmax) + ', ' + str(ymax))

    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print('Scale = ' + str(m.scale()))

    render_to_file(m, map_output)

# make_map('OAM_brugelette_full_A1.pdf', 12500, 'A1')
# make_map('OAM_brugelette_full_A4.pdf', 12500, 'A4')

make_map_bbox('attre.pdf', 425400, 6550610, 429080, 6554290)
make_map_bbox('brugelette.pdf', 427250, 6548000, 430700, 6552000)
make_map_bbox('cambron.pdf', 430200, 6547130, 433320, 6550300)
make_map_bbox('gages.pdf', 431280, 6550200, 434750, 6553600)
make_map_bbox('mevergnies.pdf', 427370, 6550000, 430240, 6553400)
make_map_bbox('brugelette-mevergnies.pdf', 427250, 6548000, 430700, 6553400)
