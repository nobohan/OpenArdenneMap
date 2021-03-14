# OpenArdenneMap - Pilot mapnik with python - June 2017
import math
from mapnik import Envelope, Map, load_map, render_to_file

def make_map(distance, scale, x_center = 621000, y_center = 6406900, pageFormat = 'A2'):
    # The mapFile is generated using carto from cartoCSS files.
    # /!\ Choose the right importer here: osm2pgsql or imposm!
    mapFile = 'osm2pgsql/OpenArdenneMap' + distance + '.xml'

    # The mapOutput can be have different extension; png, pdf, svg, ...
    mapOutput = 'marbehan_' + distance + '.jpeg'

    # Map size
    page = pageFormat
    pages = (4, 3, 2, 1, 0)
    # Compute the scale
    page_size = int(page[1])
    f1 = pages[page_size]
    f = math.sqrt(2)**f1

    map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length
    map_y = int(map_x/math.sqrt(2))
    m = Map(map_x, map_y)
    load_map(m, mapFile)

    # Bounding box (expressed in EPSG:3857, meters)
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


make_map('Marche', 15000, 618000, 6398000, 'A3')
make_map('15km', 20000, 621000, 6403500)
make_map('25km', 20000, 621000, 6403500)
make_map('31km', 25000)
make_map('43km', 25000)
make_map('53km', 25000, 624500, 6406900)
