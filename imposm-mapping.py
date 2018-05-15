# Copyright 2011 Omniscale (http://omniscale.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from imposm.mapping import (
    Options, Class,
    Points, LineStrings, Polygons,
    String, Bool, Integer, OneOfInt,
    set_default_name_type, LocalizedName,
    WayZOrder, ZOrder, Direction,
    GeneralizedTable, UnionView,
    PseudoArea, meter_to_mapunit, sqr_meter_to_mapunit,
)

# # internal configuration options
# # uncomment to make changes to the default values
import imposm.config
#
# # import relations with missing rings
imposm.config.import_partial_relations = True
#
# # select relation builder: union or contains
imposm.config.relation_builder = 'contains'
#
# # log relation that take longer than x seconds
# imposm.config.imposm_multipolygon_report = 60
#
# # skip relations with more rings (0 skip nothing)
# imposm.config.imposm_multipolygon_max_ring = 0


# # You can prefer a language other than the data's local language
# set_default_name_type(LocalizedName(['name:en', 'int_name', 'name']))

db_conf = Options(
    # db='osm',
    host='localhost',
    port=5432,
    user='osm',
    password='osm',
    sslmode='allow',
    prefix='osm_new_',
    proj='epsg:900913',
)


class Highway(LineStrings):
    fields = (
        ('tunnel', Bool()),
        ('bridge', Bool()),
        ('oneway', Direction()),
        ('ref', String()),
        ('layer', Integer()),
        ('z_order', WayZOrder()),
        ('access', String())
    )
    field_filter = (
        ('area', Bool()),
    )


places = Points(
    name = 'places',
    mapping = {
        'place': (
            'country',
            'state',
            'region',
            'county',
            'city',
            'town',
            'village',
            'hamlet',
            'suburb',
            'neighbourhood',
            'locality',
            'isolated_dwelling',
        ),
    },
    fields = (
        ('z_order', ZOrder([
            'country',
            'state',
            'region',
            'county',
            'city',
            'town',
            'village',
            'hamlet',
            'suburb',
            'neighbourhood',
            'locality',
        ])),
        ('population', Integer()),
    ),
)


admin = LineStrings(
    name = 'admin',
    mapping = {
        'boundary': (
            'administrative',
        ),
    },
    fields = (
        ('admin_level', Integer()),
    ),
)


motorways = Highway(
    name = 'motorways',
    mapping = {
        'highway': (
            'motorway',
            'motorway_link',
            'trunk',
            'trunk_link',
        ),
    }
)


mainroads = Highway(
    name = 'mainroads',
    mapping = {
        'highway': (
            'primary',
            'primary_link',
            'secondary',
            'secondary_link',
            'tertiary',
            'tertiary_link',
    )}
)


buildings = Polygons(
    name = 'buildings',
    fields = (
        ('area', PseudoArea()),
    ),
    mapping = {
        'building': (
            '__any__',
        ),
        'railway': (
            'station',
        ),
        'aeroway': (
            'terminal',
        ),
    }
)

minorroads = Highway(
    name = 'minorroads',
    mapping = {
        'highway': (
            'road',
            'path',
            'track',
            'service',
            'footway',
            'bridleway',
            'cycleway',
            'steps',
            'pedestrian',
            'living_street',
            'unclassified',
            'residential',
        ),
        'man_made': (
            'cutline',
    )},
    fields = (
            ('surface', String()),
            ('tracktype', String()),
            ('tunnel', Bool()),
            ('bridge', Bool()),
            ('oneway', Direction()),
            ('layer', Integer()),
            ('z_order', WayZOrder()),
            ('access', String())
            )
)

transport_points = Points(
    name = 'transport_points',
    fields = (
        ('ref', String()),
    ),
    mapping = {
        'highway': (
            'motorway_junction',
            'turning_circle',
            'bus_stop',
        ),
        'railway': (
            'station',
            'halt',
            'tram_stop',
            'crossing',
            'level_crossing',
            'subway_entrance',
        ),
        'aeroway': (
            'aerodrome',
            'terminal',
            'helipad',
            'gate',
    )}
)

railways = LineStrings(
    name = 'railways',
    fields = (
        ('tunnel', Bool()),
        ('bridge', Bool()),
        # ('ref', String()),
        ('layer', Integer()),
        ('z_order', WayZOrder()),
        ('access', String()),
    ),
    mapping = {
        'railway': (
            'rail',
            'tram',
            'light_rail',
            'subway',
            'narrow_gauge',
            'preserved',
            'funicular',
            'monorail',
            'disused',
    )}
)

waterways = LineStrings(
    name = 'waterways',
    mapping = {
        'barrier': (
            'ditch',
        ),
        'waterway': (
            'stream',
            'river',
            'canal',
            'drain',
            'ditch',
        ),
    },
    field_filter = (
        ('tunnel', Bool()),
    ),
)

waterareas = Polygons(
    name = 'waterareas',
    fields = (
        ('area', PseudoArea()),
    ),
    mapping = {
        'waterway': ('riverbank',),
        'natural': ('water',),
        'landuse': ('basin', 'reservoir'),
    },
)

aeroways = LineStrings(
    name = 'aeroways',
    mapping = {
        'aeroway': (
            'runway',
            'taxiway',
    )}
)

landusages = Polygons(
    name = 'landusages',
    fields = (
        ('area', PseudoArea()),
        ('leaf_type', String()),
        ('leaf_cycle', String()),
        ('z_order', ZOrder([
            'pedestrian',
            'footway',
            'aerodrome',
            'helipad',
            'apron',
            'playground',
            'park',
            'forest',
            'cemetery',
            'orchard',
            'farmyard',
            'farm',
            'farmland',
            'wood',
            'meadow',
            'grass',
            'wetland',
            'village_green',
            'recreation_ground',
            'garden',
            'sports_centre',
            'pitch',
            'common',
            'allotments',
            'golf_course',
            'university',
            'school',
            'college',
            'library',
            'fuel',
            'parking',
            'nature_reserve',
            'cinema',
            'theatre',
            'place_of_worship',
            'hospital',
            'scrub',
            'zoo',
            'quarry',
            'residential',
            'retail',
            'commercial',
            'industrial',
            'railway',
            'island',
            'land',
        ])),
    ),
    mapping = {
        'landuse': (
            'park',
            'forest',
            'residential',
            'retail',
            'commercial',
            'industrial',
            'railway',
            'cemetery',
            'grass',
            'farmyard',
            'farm',
            'farmland',
            'wood',
            'meadow',
            'village_green',
            'recreation_ground',
            'allotments',
            'quarry',
            'orchard',
        ),
        'leisure': (
            'park',
            'garden',
            'playground',
            'golf_course',
            'sports_centre',
            'pitch',
            'stadium',
            'common',
            'nature_reserve',
        ),
        'natural': (
            'wood',
            'land',
            'scrub',
            'wetland',
        ),
        'highway': (
            'pedestrian',
            'footway',
        ),
        'amenity': (
            'university',
            'school',
            'college',
            'library',
            'fuel',
            'parking',
            'cinema',
            'theatre',
            'place_of_worship',
            'hospital',
        ),
        'place': (
            'island',
        ),
        'tourism': (
            'zoo',
            'camp_site',
        ),
        'aeroway': (
            'aerodrome',
            'helipad',
            'apron',
        ),

    }
)

extraLandusages = Polygons(
    name = 'extralandusages',
    fields = (
        ('area', PseudoArea()),
    ),
    mapping = {
        'produce': (
            'christmas_trees',
        ),
    },
)

pointFeatures = Points(
    name = 'pointfeatures',
    mapping = {
        'power' : (
            'tower',
        ),
        'amenity' : (
            'fountain',
        ),
        'historic' : (
             'wayside_cross',
             'castle',
             'archaeological_site',
             'ruins',
        ),
        'man_made': (
            'reservoir_covered',
            'mast',
            'tower',
        ),
        'public_transport': (
            'stop_position',
        )},
    fields = (
        ('tower:type', String()),
        ('bus', String()),
        ('class', Class()),
    )
)

linearfeatures = LineStrings(
   name = 'linearfeatures',
   mapping = {
           'man_made': (
              'embankment',
           ),
           'barrier': (
               'hedge',
               'retaining_wall',
               'wall',
               'embankment',
             ),
            'embankment': (
               'yes',
            ),
            'natural': (
               'cliff',
            ),
            'power': (
               'line',
            )
       },
   fields = (
     ('leaf_type', String()),
     ('leaf_cycle', String()),
     ('voltage', Integer()),
     ('class', Class()),
   )
)

roads = UnionView(
    name = 'roads',
    fields = (
        ('bridge', 0),
        ('ref', None),
        ('tunnel', 0),
        ('oneway', 0),
        ('layer', 0),
        ('z_order', 0),
        ('access', None),
        ('surface', None),
        ('tracktype', None)
    ),
    mappings = [motorways, mainroads, minorroads, railways],
)
