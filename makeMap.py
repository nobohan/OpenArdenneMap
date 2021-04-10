# OpenArdenneMap - Pilot mapnik with python - June 2017

import math
import os
from mapnik import Map, Envelope, render_to_file, load_map

PAGE_FORMAT = 'A3'
PAGES = (4, 3, 2, 1, 0)


LATITUDE = 50 # in degrees

def make_map(map_output, scale=20000, x_center=622000, y_center=6406000, orientation = 'LANDSCAPE', mapnik_file = 'osm2pgsql/OpenArdenneMap.xml'):
    "Make a map as a function of the scale"

    # Compute the scale
    page_size = int(PAGE_FORMAT[1])
    f = math.sqrt(2)**PAGES[page_size]

    if orientation == 'PORTRAIT':
        map_y = int(f*4600)  # 4600 is the number of pixels for an A4 length
        map_x = int(map_y/math.sqrt(2))
        delta_y = f*0.295*scale/math.cos(LATITUDE*2*math.pi/360)
        delta_x = delta_y/math.sqrt(2)
    else:
        map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length
        map_y = int(map_x/math.sqrt(2))
        delta_x = f*0.295*scale/math.cos(LATITUDE*2*math.pi/360)
        delta_y = delta_x/math.sqrt(2)


    m = Map(map_x, map_y)

    load_map(m, mapnik_file)

    # Bounding box (expressed in EPSG:3857, meters)

    xmin = x_center - delta_x/2
    xmax = x_center + delta_x/2
    ymin = y_center - delta_y/2
    ymax = y_center + delta_y/2

    bbox = (Envelope(xmin, ymin, xmax, ymax))
    m.zoom_to_box(bbox)
    print(delta_x)
    print(delta_y)
    print("BBOX = " + str(xmin) + ',' + str(ymin) + ',' +  str(xmax) + ',' +  str(ymax))
    print("Scale = " + str(m.scale()))

    render_to_file(m, map_output)

#make_map('OAM_20000.pdf', 20000, 617124,6400092)
