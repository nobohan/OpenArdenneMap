# OpenArdenneMap - Pilot mapnik with python - June 2017
import math
from mapnik import Envelope, Map, load_map, render_to_file


LATITUDE = 50 # in degrees

def make_map(distance, scale, x_center = 621000, y_center = 6406900, pageFormat = 'A2', orientation = 'LANDSCAPE'):
    # The mapFile is generated using carto from cartoCSS files.
    # /!\ Choose the right importer here: osm2pgsql or imposm!
    mapFile = 'osm2pgsql/OpenArdenneMap' + distance + '.xml'

    # The mapOutput can be have different extension; png, pdf, svg, ...
    mapOutput = 'marbehan_' + distance + '.pdf'

    # Map size
    page = pageFormat
    pages = (4, 3, 2, 1, 0)
    # Compute the scale
    page_size = int(page[1])
    f1 = pages[page_size]
    f = math.sqrt(2)**f1


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
    print(delta_x)
    print(delta_y)
    print("BBOX = " + str(xmin) + ',' + str(ymin) + ',' +  str(xmax) + ',' +  str(ymax))
    print("Scale = " + str(m.scale()))

    # Export to mapOutput
    render_to_file(m, mapOutput)


make_map('Marche', 15000, 615000, 6402200, 'A4', 'PORTRAIT')
make_map('18km', 15000, 621000, 6403500)
make_map('28km', 20000, 621000, 6403500)
make_map('34km', 20000, 621000, 6403500)
make_map('48km', 25000)
make_map('57km', 25000, 624500, 6406900)
