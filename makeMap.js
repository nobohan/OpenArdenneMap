// OpenArdenneMap - Pilot mapnik with node - June 2019

var mapnik = require('../../mapnik/node-mapnik/lib/binding/mapnik'); // hard-coding of my built node-mapnik bindings
var fs = require('fs');

mapnik.register_datasource('/usr/local/lib/mapnik/input/postgis.input'); // hard-coding of mapnik input files
mapnik.register_datasource('/usr/local/lib/mapnik/input/shape.input');

var MAPNIK_FILE = 'osm2pgsql/OpenArdenneMap.xml';
var PAGES = [4, 3, 2, 1, 0, -1, -2];

var X_CENTER = 428900; // in EPSG:3857
var Y_CENTER = 6551200; // in EPSG:3857
var LATITUDE = 50.59; // in degrees

var make_map = function(map_output, scale = 20000, page_format = 'A4', x = X_CENTER, y = Y_CENTER) {
    /**
    * make a map for a given scale and center
    */
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

    var map = new mapnik.Map(map_x, map_y);
    map.load(MAPNIK_FILE, function(err,map) {
        if (err) throw err;
        map.zoomToBox(xmin, ymin, xmax, ymax);
        map.renderFile(map_output, {format: map_output.split('.')[1]}, function(err) {
            if (err) throw err;
        });
    });

}

var make_map_bbox = function(map_output, xmin, ymin, xmax, ymax, scale = 6000) {
    /**
    * make a map for a given scale and bbox
    */

    var delta_x = xmax-xmin;
    var delta_y = ymax-ymin;
    var ratio = delta_x/delta_y;

    var f = delta_x / (0.295*scale/Math.cos(LATITUDE*2*3.1415/360))
    var map_x = f*4600  // 4600 is the number of pixels for an A4 length
    var map_y = map_x/ratio

    var map = new mapnik.Map(map_x, map_y);
    map.load(MAPNIK_FILE, function(err,map) {
        if (err) throw err;
        map.zoomToBox(xmin, ymin, xmax, ymax);
        map.renderFile(map_output, {format: map_output.split('.')[1]}, function(err) {
            if (err) throw err;
        });
    });

}

make_map('OAM_brugelette_full_A1.pdf', 12500, 'A1')
make_map('OAM_brugelette_full_A4.pdf', 12500, 'A4')

make_map_bbox('attre.pdf', 426400, 6551610, 428080, 6553290)
make_map_bbox('brugelette.pdf', 428250, 6549000, 429700, 6551000)
make_map_bbox('cambron.pdf', 431200, 6548130, 432320, 6549300)
make_map_bbox('gages.pdf', 432280, 6551200, 433750, 6552600)
make_map_bbox('mevergnies.pdf', 428370, 6551000, 429240, 6552400)
