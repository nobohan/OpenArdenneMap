/* LABELS.MSS CONTENTS:
 * - contour labels
 * - place names
 * - area labels
 * - waterway labels
 */

@text_size_l : 60;
@text_size_m : 40;
@text_size_s : 30;

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* CONTOUR LABELS
/* ================================================================== */

#contour {
  text-name:'[level]';
  text-face-name:@sans;
  text-placement:line;
  text-size: @text_size_s;
  text-wrap-width: 60;
  text-line-spacing: 1;
  text-fill: @contour;
  text-halo-fill: #ffffff;
}



/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

/* ---- Cities ------------------------------------------------------ */

#place::city[type='city'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:2;
  text-size:@text_size_l;
  text-character-spacing: 6;
  text-wrap-width: 400;
  text-transform: uppercase;
}

/* ---- Towns ------------------------------------------------------- */

#place::small[type='town'],
#place::town[type='village'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-halo-fill:@town_halo;
  text-halo-radius: 3;
  text-wrap-width: 50;
  text-transform: uppercase;
  text-line-spacing: 2;
  text-size:@text_size_l;
  text-character-spacing: 8;
  text-line-spacing: 6;
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='suburb'],
#place::small[type='hamlet'],
#place::small[type='neighbourhood'],
#place::small[type='isolated_dwelling'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:@text_size_s;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-character-spacing: 2;
  text-wrap-width: 120;
  text-line-spacing: 2;
  text-dy: -50
}

#place::small[type='locality'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-size:@text_size_m;
  text-wrap-width: 60;
  text-line-spacing: 1;
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  text-name: "[name]";
  text-size: @text_size_s;
  text-wrap-width: 100;
  text-character-spacing: 1;
  text-halo-radius: 1.5;
  text-face-name:@sans;
  text-wrap-width:30;
  text-fill: @black;
  text-halo-fill: #fff;
  // Specific style overrides for different types of areas:
  [type='park'] {
    text-face-name: @sans_lt_italic;
    text-fill: @green;
    text-halo-fill: lighten(@park, 10%);
  }
  [type='golf_course'] {
    text-fill: @black;
    text-halo-fill: lighten(@sports, 10%);
  }
  [type='hospital'] {
    text-fill: @black;
    text-halo-fill: lighten(@hospital, 10%);
  }
  [type='college'],
  [type='school'],
  [type='university'] {
    text-fill: @black;
    text-halo-fill: lighten(@school, 10%);
  }
  [type='water'] {
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 3;
  }
}

#poi[type='university'],
#poi[type='hospital'],
#poi[type='school'],
#poi[type='library'] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10;
  text-wrap-width:30;
  text-fill: @poi_text;
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'],
#waterway_label[type='canal'],
#waterway_label[type='stream'] {
    text-name: '[name]';
    text-face-name: @sans_italic;
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 3;
    text-placement: line;
    text-min-distance: 1200;
    text-size: @text_size_m;
    text-spacing: 300;
}

#waterway_label[type='stream'] {
    text-size: @text_size_s;
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[type='motorway'],
#motorway_label[type='trunk'] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  text-min-distance:100;
}

#mainroad_label[type='primary'],
#mainroad_label[type='secondary'],
#mainroad_label[type='tertiary'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
#motorway_label,
#mainroad_label,
/*#minorroad_label {
  [oneway = 'yes'],
  [oneway='-1'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 200;
     marker-file: url(img/icon/oneway.svg);
     [oneway='-1'] { marker-file: url(img/icon/oneway-reverse.svg); }
     marker-transform: "scale(0.75)";
  }
}*/


/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_stations{
  point-file:url('img/icon/rail-18.png');
}

/* ****************************************************************** */
