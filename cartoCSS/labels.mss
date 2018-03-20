/* LABELS.MSS CONTENTS:
 * - contour labels
 * - place names
 * - area labels
 * - waterway labels
 */

@text_size_l : 60;
@text_size_m : 40;
@text_size_s : 30;
@text_size_xs : 20;

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
  text-character-spacing: 10;
  text-line-spacing: 6;
  text-allow-overlap: true; /* always render the label */
  text-dy: 200;

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
  [type='university'] {
    text-fill: @black;
    text-halo-fill: lighten(@hospital, 10%);
  }
  [type='water'] {
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 3;
  }
  [type='school'] {
    text-name: "'Éc.'";
    text-size: @text_size_s;
    text-dy: -35;
    text-dx: -20;
  }
  [type='farmyard'] {
    text-name: "'Ferme'";
    text-size: @text_size_xs;
    text-dy: -20;
    text-dx: -15;
  }
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
/* TRAIN STATIONS
/* ================================================================== */

#train_elements {
  [type='station'] {
    text-name:'Gare';
    text-face-name:@sans;
    text-placement:point;
    text-fill:@other_text;
    text-size:@text_size_m;
    text-halo-fill:@other_halo;
    text-halo-radius:2;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-dy: -50;
    text-dx: -30;
  }
}

/* ****************************************************************** */
