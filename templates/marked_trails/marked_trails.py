import svgwrite
import base64
import os
from wand.image import Image
from datetime import datetime, timedelta
import numpy as np
import shutil

import parameters

PAGE_WIDTH = 9250 #in meters in EPSG 3857 for a A3
PAGE_HEIGHT = 13060 #in meters in EPSG 3857 for a A3
SMALL_MARGIN = 622 #in meters in EPSG 3857 for a A3
LARGE_MARGIN = 778 #in meters in EPSG 3857 for a A3
CONTENT_MARGIN = 2955 #in meters in EPSG 3857 for a A3

x_center, y_center = parameters.CENTER

if parameters.ORIENTATION == 'LANDSCAPE':
    x_min = x_center - PAGE_HEIGHT / 2 + CONTENT_MARGIN
    y_min = y_center - PAGE_WIDTH / 2 + SMALL_MARGIN
    x_max = x_center + PAGE_HEIGHT / 2 - SMALL_MARGIN
    y_max = y_center + PAGE_WIDTH / 2 - LARGE_MARGIN
else: # Default to 'PORTRAIT'
    x_min = x_center - PAGE_WIDTH / 2 + SMALL_MARGIN
    y_min = y_center - PAGE_HEIGHT / 2 + CONTENT_MARGIN
    x_max = x_center + PAGE_WIDTH / 2 - SMALL_MARGIN
    y_max = y_center + PAGE_HEIGHT / 2 - SMALL_MARGIN


Y2K = datetime(year=2000, month=1, day=1)


marked_trails_subquery = """
    SELECT
        name, network, signed_direction, ascent, descent, distance,
        ST_Length(ST_Transform(way, 31370))/1000 AS computed_distance,
        ST_AsLatLonText(ST_Transform(ST_StartPoint(way),4326),'D°M''S"C'),
        SPLIT_PART(\"osmc:symbol\",':', 1) AS color,
        CASE
            WHEN LENGTH(SPLIT_PART(\"osmc:symbol\",':', 4)) < 4 THEN
                SPLIT_PART(\"osmc:symbol\",':', 4)
            ELSE
                ''
        END marked_text,
        CASE
            WHEN SPLIT_PART("osmc:symbol",':', 3) IN ('red_lower') THEN
                'black'
            ELSE
                'white'
        END text_color,
        CASE
            WHEN SPLIT_PART(\"osmc:symbol\",':', 3) <> '' THEN
                CASE
                    WHEN SPLIT_PART(\"osmc:symbol\",':', 3) = 'white_stripe' THEN
                       SPLIT_PART(\"osmc:symbol\",':', 1) || '_invstripe.svg'
                    WHEN SPLIT_PART(\"osmc:symbol\",':', 3) = 'white_corner' THEN
                        CASE
                            WHEN SPLIT_PART(\"osmc:symbol\",':', 1) = 'purple' THEN
                               SPLIT_PART(\"osmc:symbol\",':', 2) || '_pointer.svg'
                            ELSE
                               SPLIT_PART(\"osmc:symbol\",':', 1) || '_pointer.svg'
                        END
                    ELSE
                        SPLIT_PART(\"osmc:symbol\",':', 3) || '.svg'
                END
            ELSE
               SPLIT_PART(\"osmc:symbol\",':', 1) || '_rectangle.svg'
        END shield_uri
    FROM planet_osm_line
    WHERE
        (route ~ 'hiking' OR route ~ 'foot')
        AND network IN ('lwn', 'rwn')
"""

marked_trails_contains_query = """
{0}
AND ST_Contains(ST_SetSRID(ST_MakeBox2D(ST_Point({1}, {2}), ST_Point({3}, {4})), 3857 ), way);
""".format(marked_trails_subquery, x_min, y_min, x_max, y_max)

marked_trails_intersects_query = """
{0}
AND ST_Intersects(ST_SetSRID(ST_MakeBox2D(ST_Point({1}, {2}), ST_Point({3}, {4})), 3857 ), way);
""".format(marked_trails_subquery, x_min, y_min, x_max, y_max)


track_timestamp_query = """
    SELECT osm_timestamp
    FROM planet_osm_line
    WHERE
        highway IN ('track', 'path', 'footway', 'cycleway', 'bridleway')
        AND ST_Contains(ST_SetSRID(ST_MakeBox2D(ST_Point({0}, {1}), ST_Point({2}, {3})), 3857 ), way)
    ;
""".format(x_min, y_min, x_max, y_max)

marked_trails_timestamp_query = """
    SELECT osm_timestamp
    FROM planet_osm_line
    WHERE
        route IN ('hiking', 'foot')
        AND network IN ('lwn')
        AND ST_Contains(ST_SetSRID(ST_MakeBox2D(ST_Point({0}, {1}), ST_Point({2}, {3})), 3857 ), way)
    ;
""".format(x_min, y_min, x_max, y_max)

track_length_query = """
    SELECT ST_Length(ST_Transform(way, 31370))
    FROM planet_osm_line
    WHERE
        highway IN ('track', 'path', 'footway', 'cycleway', 'bridleway')
        AND ST_Contains(ST_SetSRID(ST_MakeBox2D(ST_Point({0}, {1}), ST_Point({2}, {3})), 3857 ), way)
    ;
""".format(x_min, y_min, x_max, y_max)

marked_trails_distance_query = """
    SELECT distance
    FROM planet_osm_line
    WHERE
        route IN ('hiking', 'foot')
        AND network IN ('lwn')
        AND ST_Intersects(ST_SetSRID(ST_MakeBox2D(ST_Point({0}, {1}), ST_Point({2}, {3})), 3857 ), way)
""".format(x_min, y_min, x_max, y_max)


def generate_marked_trails_content(conn):
    """ Generate the marked trails list """

    print(x_min, y_min, x_max, y_max)

    LEFT_MARGIN = 10
    LINE_HEIGHT = 12
    SMALL_LINE_HEIGHT_FACTOR = 0.4
    PARAGRAPH_MARGIN = 12
    SYMBOL_MARGIN = 18
    Y_SCALE = LINE_HEIGHT * 2 + PARAGRAPH_MARGIN

    dwg = svgwrite.Drawing('marked-trails-{}.svg'.format(parameters.TITLE), size=('8cm', '12cm'), profile='full', debug=True)
    dwg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    dwg.embed_stylesheet("""
    .alfphabet6 {
        font-family: "Alfphabet";
        font-size: 8;
        font-weight: bold;
    }
    .alfphabet8 {
        font-family: "Alfphabet";
        font-size: 8;
    }
    .alfphabet10 {
        font-family: "Alfphabet";
        font-size: 10;
    }
    """)

    def insert_svg_image(dwg, filename, x, y, width, height):
        """ Insert a SVG image into the drawing at position x and y """
        img = Image(filename=filename)
        image_data = img.make_blob(format="png")
        encoded = base64.b64encode(image_data).decode()
        svgdata = 'data:image/png;base64,{}'.format(encoded)
        image = dwg.add(dwg.image(href=(svgdata), insert=(x,y), height=height, width=width))

    def add_marked_trail_images(i, symbol_path):
        """ Add a single marked trail mt images to the svg at the position index i """
        insert_svg_image(dwg, symbol_path, LEFT_MARGIN, i*Y_SCALE + 3, "15px", "10px")


    def add_marked_trail_to_svg(mt, i):
        """ Add a single marked trail mt to the svg at the position index i """

        paragraph6 = dwg.add(dwg.g(class_="alfphabet6", ))
        paragraph8 = dwg.add(dwg.g(class_="alfphabet8", ))
        paragraph10 = dwg.add(dwg.g(class_="alfphabet10", ))
        if mt[9] is not None:
            marker_text_color = mt[10] if mt[10] is not None else 'black'
            paragraph6.add(dwg.text(str(mt[9]), insert=(LEFT_MARGIN + 6, i*Y_SCALE + LINE_HEIGHT - 1.5), fill=marker_text_color))

        paragraph10.add(dwg.text(mt[0], insert=(LEFT_MARGIN + SYMBOL_MARGIN, i*Y_SCALE + LINE_HEIGHT), fill='black'))

        ascent = '{} m'.format(mt[3]) if mt[3] is not None else ''
        descent = '{} m'.format(mt[4]) if mt[4] is not None else ''
        ascent_descent = ascent if ascent == descent else '{},{}'.format(ascent, descent)
        distance = '{} km'.format(mt[5]) if mt[5] is not None else '{0:.1f} km'.format(mt[6])
        start_point = mt[7]

        if distance:
            if ascent_descent:
                text = '{}, {}, {}'.format(distance, ascent_descent, start_point)
            else:
                text = '{}, {}'.format(distance, start_point)
        else:
            text = start_point

        paragraph8.add(dwg.text(text, insert=(LEFT_MARGIN, i*Y_SCALE + LINE_HEIGHT * 2), fill='black'))

        #dwg.add(dwg.line((0, i*Y_SCALE), (10, i*Y_SCALE), stroke=svgwrite.rgb(10, 10, 16, '%')))


    cursor = conn.cursor()
    cursor.execute(marked_trails_intersects_query)
    marked_trails_intersects = cursor.fetchall()

    cursor = conn.cursor()
    cursor.execute(marked_trails_contains_query)
    marked_trails_contains = cursor.fetchall()

    print("--- Make marked trails list as svg ---")

    # Add svg images first
    i = SMALL_LINE_HEIGHT_FACTOR
    for mt in marked_trails_contains:
        symbol_path = '../../img/marked-trails/{}'.format(mt[11])
        if os.path.isfile(symbol_path) and mt[0] is not None:
            add_marked_trail_images(i, symbol_path)
            i = i + 1

    i = i + SMALL_LINE_HEIGHT_FACTOR
    for mt in marked_trails_intersects:
        if mt not in marked_trails_contains:
            symbol_path = '../../img/marked-trails/{}'.format(mt[11])
            if os.path.isfile(symbol_path) and mt[0] is not None:
                add_marked_trail_images(i, symbol_path)
                i = i + 1

    # Add svg text
    i = 0

    paragraph10_0 = dwg.add(dwg.g(class_="alfphabet10", ))
    MT_CONTAINS_TITLE = 'ITINÉRAIRES COMPLETS SUR LA CARTE:'
    paragraph10_0.add(dwg.text(MT_CONTAINS_TITLE, insert=(LEFT_MARGIN, i*Y_SCALE + LINE_HEIGHT), fill='black'))
    i = i + SMALL_LINE_HEIGHT_FACTOR

    for mt in marked_trails_contains:
        print(mt)
        symbol_path = '../../img/marked-trails/{}'.format(mt[11])
        if os.path.isfile(symbol_path) and mt[0] is not None:
            add_marked_trail_to_svg(mt, i)
            i = i + 1

    paragraph10_1 = dwg.add(dwg.g(class_="alfphabet10", ))
    OTHERS_MT_TITLE = 'AUTRES ITINÉRAIRES SUR LA CARTE:'
    paragraph10_1.add(dwg.text(OTHERS_MT_TITLE, insert=(LEFT_MARGIN, i*Y_SCALE + LINE_HEIGHT), fill='black'))
    i = i + SMALL_LINE_HEIGHT_FACTOR

    for mt in marked_trails_intersects:
        if mt not in marked_trails_contains:
            symbol_path = '../../img/marked-trails/{}'.format(mt[11])
            if os.path.isfile(symbol_path) and mt[0] is not None:
                print(mt)
                add_marked_trail_to_svg(mt, i)
                i = i + 1

    dwg.save(pretty=True)


def timestamp_to_age_in_days_since_y2k(timestamp):
    d = datetime.strptime(timestamp.split('T')[0],'%Y-%m-%d')
    age_in_days = d - Y2K

    return age_in_days.days

def days_since_y2k_to_date(days):
    return Y2K + timedelta(days=days)

def print_timestamp_statistics(feature_timestamp):
    feature_timestamp_as_days = [timestamp_to_age_in_days_since_y2k(t[0]) for t in feature_timestamp]

    if len(feature_timestamp_as_days) > 0:
        avg_age_in_days = sum(feature_timestamp_as_days) / len(feature_timestamp_as_days)
        min_age_in_days = min(feature_timestamp_as_days)
        max_age_in_days = max(feature_timestamp_as_days)
        median_age_in_days = np.median(feature_timestamp_as_days)

        avg_date = days_since_y2k_to_date(avg_age_in_days)
        min_date = days_since_y2k_to_date(min_age_in_days)
        max_date = days_since_y2k_to_date(max_age_in_days)
        median_date = days_since_y2k_to_date(median_age_in_days) #TODO factorise computation for printing and saving svg. Make stat in one dict

        print("average date: {}, {}".format(avg_date.strftime('%d-%m-%Y'), avg_date.strftime('%B-%Y')))
        print("median date: {}".format(median_date.strftime('%d-%m-%Y')))
        print("oldest date: {}".format(min_date.strftime('%d-%m-%Y')))
        print("newest date: {}".format(max_date.strftime('%d-%m-%Y')))


def make_svg_timestamp(feature_timestamp, kind):

    feature_timestamp_as_days = [timestamp_to_age_in_days_since_y2k(t[0]) for t in feature_timestamp]

    if len(feature_timestamp_as_days) > 0:
        median_age_in_days = np.median(feature_timestamp_as_days)
        median_date = days_since_y2k_to_date(median_age_in_days)

    label_kind = 'CHEMINS' if kind == 'track' else 'ITINÉRAIRES BALISÉS'
    timestamp_str = f"DATE MOYENNNE DE MODIFICATION DES {label_kind}: {median_date.strftime('%B %Y')}" #TODO translate date in locale

    timestamp_svg = svgwrite.Drawing(f'timestamp_{kind}.svg', size=('6cm', '2cm'), profile='full')
    timestamp_svg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    timestamp_svg.embed_stylesheet("""
    .alfphabetTitle {
        font-family: "Alfphabet";
        font-size: 12;
    }
    """)
    paragraph = timestamp_svg.add(timestamp_svg.g(class_="alfphabetTitle", ))
    paragraph.add(timestamp_svg.text(timestamp_str, insert=(1, 1), fill='black'))
    timestamp_svg.save()

def tracks_timestamp_statistics(conn):
    """ Compute timestamp statistics of the tracks within the map """
    cursor = conn.cursor()
    cursor.execute(track_timestamp_query)
    track_timestamp = cursor.fetchall()
    print("--- Timestamp statistics for tracks within the map ---")
    print_timestamp_statistics(track_timestamp)
    make_svg_timestamp(track_timestamp, 'track')

def marked_trails_timestamp_statistics(conn):
    """ Compute timestamp statistics of the marked trails within the map """
    cursor = conn.cursor()
    cursor.execute(marked_trails_timestamp_query)
    marked_trails_timestamp = cursor.fetchall()
    print("--- Timestamp statistics for marked trails within the map ---")
    print_timestamp_statistics(marked_trails_timestamp)
    make_svg_timestamp(marked_trails_timestamp, 'marked')

def make_svg_distance(distance, kind):
    formated_distance = "{:.1f}".format(distance)
    distance_str = f"{formated_distance} KM DE CHEMINS & SENTIERS" if kind == 'track' else f"{formated_distance} KM D'ITINÉRAIRES BALISÉS"

    distance_svg = svgwrite.Drawing(f'distance_{kind}.svg', size=('6cm', '2cm'), profile='full')
    distance_svg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    distance_svg.embed_stylesheet("""
    .alfphabetTitle {
        font-family: "Alfphabet";
        font-size: 12;
    }
    """)
    paragraph = distance_svg.add(distance_svg.g(class_="alfphabetTitle", ))
    paragraph.add(distance_svg.text(distance_str, insert=(1, 1), fill='black'))
    distance_svg.save()


def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False

def compute_tracks_length(conn):
    cursor = conn.cursor()
    cursor.execute(track_length_query)
    track_length = cursor.fetchall()
    sum_track_length = sum(tl[0] for tl in track_length)
    make_svg_distance(sum_track_length / 1000, 'track')
    print("--- Tracks length ---")
    print("Total track length: {} km".format(sum_track_length / 1000) )

def compute_marked_trails_length(conn):
    cursor = conn.cursor()
    cursor.execute(marked_trails_contains_query)
    marked_trails = cursor.fetchall()
    sum_distance = 0

    for mt in marked_trails:
        if mt[5] is not None and isfloat(mt[5]): # official distance
            sum_distance = sum_distance + float(mt[5])
        else:
            if mt[6] is not None: # computed distance
                sum_distance = sum_distance + float(mt[6])
    make_svg_distance(sum_distance, 'marked')
    print("--- Marked trails length ---")
    print("Total marked trails length (using ST_contains): {} km".format(sum_distance))

