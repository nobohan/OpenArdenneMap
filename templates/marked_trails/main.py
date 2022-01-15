from psycopg2 import connect
import os
import sys
import shutil
sys.path.insert(0, '../..')
from makeMap import make_map

from marked_trails import generate_marked_trails_content, tracks_timestamp_statistics, marked_trails_timestamp_statistics, compute_tracks_length, compute_marked_trails_length
from template import fill_template

import parameters
x_center, y_center = parameters.CENTER


if __name__ == '__main__':
    conn = connect(
        host=parameters.db_host,
        port=parameters.db_port,
        database=parameters.db_name,
        # user=parameters.db_user,
        # password=parameters.db_pwd
    )
    print("--- Center is: {} ---".format(parameters.CENTER))

    generate_marked_trails_content(conn)
    tracks_timestamp_statistics(conn)
    marked_trails_timestamp_statistics(conn)
    compute_tracks_length(conn)
    compute_marked_trails_length(conn)

    conn.close()

    # print("--- print label map ---")
    # oam_mapnik_file = os.path.abspath('../../osm2pgsql/OpenArdenneMap-labels.xml')
    # make_map(
    #     'OAM_20000_{}_{}_labels.svg'.format(parameters.TITLE, parameters.ORIENTATION),
    #      20000,
    #      x_center,
    #      y_center,
    #      parameters.ORIENTATION,
    #      oam_mapnik_file
    # )

    # print("--- print background map ---")
    # oam_mapnik_file = os.path.abspath('../../osm2pgsql/OpenArdenneMap-background.xml')
    # make_map(
    #     'OAM_20000_{}_{}_background.svg'.format(parameters.TITLE, parameters.ORIENTATION),
    #      20000,
    #      x_center,
    #      y_center,
    #      parameters.ORIENTATION,
    #      oam_mapnik_file
    # )

    fill_template()

    if not os.path.exists(f'A3-{parameters.ORIENTATION.lower()}-{parameters.TITLE}.svg'):
       shutil.copy2(f'../A3-{parameters.ORIENTATION.lower()}.svg', f'A3-{parameters.ORIENTATION.lower()}-{parameters.TITLE.upper()}.svg')