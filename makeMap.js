// OpenArdenneMap - Pilot mapnik with node - June 2019

var mapnik = require('../../mapnik/node-mapnik/lib/binding/mapnik');
var fs = require('fs');

mapnik.register_datasource('/usr/local/lib/mapnik/input/postgis.input');
mapnik.register_datasource('/usr/local/lib/mapnik/input/shape.input');

var MAPNIK_FILE = 'osm2pgsql/OpenArdenneMap.xml';
var PAGES = [4, 3, 2, 1, 0, -1, -2];

var X_CENTER = 428900;
var Y_CENTER = 6551200;
var LATITUDE = 50.59; // in degrees

//map_output, scale=20000,
var scale = 20000;
var page_format = 'A4';
var page_size = page_format.substr(-1);
var f = Math.sqrt(2)**PAGES[page_size];
var map_x = f*4600;
var map_y = map_x/Math.sqrt(2);

var delta_x = f*0.295*scale/Math.cos(LATITUDE*2*3.1415/360);
var delta_y = delta_x/Math.sqrt(2);
var xmin = X_CENTER - delta_x/2;
var xmax = X_CENTER + delta_x/2;
var ymin = Y_CENTER - delta_y/2;
var ymax = Y_CENTER + delta_y/2;
console.log(xmin)
console.log(ymin)
console.log(xmax)
console.log(ymax)


var map = new mapnik.Map(map_x, map_y);
map.load(MAPNIK_FILE, function(err,map) {
    if (err) throw err;
    map.zoomToBox(xmin, ymin, xmax, ymax);
    map.renderFile('map.svg', {format: 'svg'}, function(error) {
        console.log(error);
    });
});

// def make_map(map_output, scale=20000, page_format = 'A4', x = X_CENTER, y = Y_CENTER):
//     "Make a map as a function of the scale"
//
//     # Compute the scale
//     page_size = int(page_format[1])
//     f = math.sqrt(2)**PAGES[page_size]
//
//     # increasing map_x and map_y lead to decreasing font and symbol size: not good
//     map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length
//
//     # if 460: zoom = 13
//     map_y = int(map_x/math.sqrt(2))
//     m = Map(map_x, map_y)
//     load_map(m, MAPNIK_FILE)
//
//     # Bounding box (expressed in EPSG:3857, meters)
//     delta_x = f*0.295*scale/math.cos(LATITUDE*2*math.pi/360)
//     delta_y = delta_x/math.sqrt(2)
//     xmin = x - delta_x/2
//     xmax = x + delta_x/2
//     ymin = y - delta_y/2
//     ymax = y + delta_y/2
//
//     print('Extent = ' + str(xmin) + ', ' + str(ymin) + ', ' + str(xmax) + ', ' + str(ymax))
//
//     bbox = (Envelope(xmin, ymin, xmax, ymax))
//     m.zoom_to_box(bbox)
//     print('Scale = ' + str(m.scale()))
//
//     render_to_file(m, map_output)
//
//     render(m, context)
//
// def make_map_bbox(map_output, xmin, ymin, xmax, ymax, scale=6000):
//     "Make (mini)-map as a function of a bbox, for a defined scale"
//
//     # Compute the scale
//     delta_x = xmax-xmin
//     delta_y = ymax-ymin
//     ratio = delta_x/delta_y
//
//     f = delta_x / (0.295*scale/math.cos(LATITUDE*2*math.pi/360))
//     map_x = int(f*4600)  # 4600 is the number of pixels for an A4 length
//     map_y = int(map_x/ratio)
//     m = Map(map_x, map_y)
//     load_map(m, MAPNIK_FILE)
//
//     print('Extent = ' + str(xmin) + ', ' + str(ymin) + ', ' + str(xmax) + ', ' + str(ymax))
//
//     bbox = (Envelope(xmin, ymin, xmax, ymax))
//     m.zoom_to_box(bbox)
//     print('Scale = ' + str(m.scale()))
//
//     render_to_file(m, map_output)
//
// # make_map('zoom_brugelette.pdf', 6000, 'A4', 428900, 6550200)
// # make_map('zoom_cambron.pdf', 6000, 'A4', 431731, 6548724)
// # make_map('zoom_gages.pdf', 6000, 'A4', 433089, 6551963)
// # make_map('zoom_attre.pdf', 6000, 'A4', 427241, 6551797)
// # make_map('zoom_mevergnies.pdf', 6000, 'A4', 428618, 6551557)
// make_map('OAM_brugelette_full_A1.pdf', 12500, 'A1')
// make_map('OAM_brugelette_full_A4.svg', 12500, 'A4')
//
// make_map_bbox('attre.pdf', 426400, 6551610, 428080, 6553290)
// make_map_bbox('brugelette.pdf', 428250, 6549000, 429700, 6551000)
// make_map_bbox('cambron.pdf', 431200, 6548130, 432320, 6549300)
// make_map_bbox('gages.pdf', 432280, 6551200, 433750, 6552600)
// make_map_bbox('mevergnies.pdf', 428370, 6551000, 429240, 6552400)
