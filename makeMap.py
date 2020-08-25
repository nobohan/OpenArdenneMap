# OpenArdenneMap - Pilot mapnik with python - June 2017

import math
from mapnik import Map, Envelope, render_to_file, load_map

PAGE_FORMAT = 'A4'
PAGES = (4, 3, 2, 1, 0)


LATITUDE = 50 # in degrees

# The mapFile is generated using carto from cartoCSS files.
# /!\ Choose the right importer here: osm2pgsql or imposm!
MAPNIK_FILE = 'osm2pgsql/OpenArdenneMap.xml'


def make_map(map_output, scale=42000, x_center=587488, y_center=6406205):
    "Make a map as a function of the scale"

    # Compute the scale
    page_size = int(PAGE_FORMAT[1])
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
    xmin = x_center - delta_x/2
    xmax = x_center + delta_x/2
    ymin = y_center - delta_y/2
    ymax = y_center + delta_y/2
    
    print(delta_x)
    
    
    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print("Scale = " + str(m.scale()))

    render_to_file(m, map_output)

def make_map_bbox(map_output, xmin, ymin, xmax, ymax, scale=3000):
    "Make map as a function of a bbox, for a defined scale"

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

def make_map_paper(map_output, width, height, scale=42000, x_center=587488, y_center=6406205):
    "Make map as a function of a paper dimension (width and height), for a given scale and geographic center"

    map_y = int(height * 4600/0.295) # 4600 px for a A4 length
    map_x = int(width * 4600/0.295)

    m = Map(map_x, map_y)
    load_map(m, MAPNIK_FILE)

    # Bounding box (expressed in EPSG:3857, meters)
    delta_x = width * scale / math.cos(LATITUDE*2*math.pi/360)
    delta_y = height * scale / math.cos(LATITUDE*2*math.pi/360)
    xmin = x_center - delta_x/2
    xmax = x_center + delta_x/2
    ymin = y_center - delta_y/2
    ymax = y_center + delta_y/2

    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print("Scale = " + str(m.scale()))

    render_to_file(m, map_output)

make_map('OAM_semoy_test.pdf')
#make_map_paper('OAM_semoy.tif', 0.8, 2)
make_map_paper('OAM_semoy_70X200.tif', 0.7, 2)
#make_map_paper('OAM_semoy.pdf', 0.8, 2)
