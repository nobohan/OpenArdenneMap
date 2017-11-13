/* LABELS.MSS CONTENTS:
 * - contour labels
 * - place names
 * - area labels
 * - waterway labels
 */

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* CONTOUR LABELS
/* ================================================================== */

#contour {
  text-name:'[level]';
  text-face-name:@sans;
  text-placement:line;
  text-size: 20;
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
  text-size:16;
  text-character-spacing: 6;
  text-wrap-width: 400;
  text-transform: uppercase;
}

/* ---- Towns ------------------------------------------------------- */

#place::town[type='town'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  text-transform: uppercase;
  text-character-spacing: 1;
  text-line-spacing: 2;
  text-size:16;
  text-character-spacing: 5;
  text-line-spacing: 6;
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'],
#place::small[type='suburb'],
#place::small[type='hamlet'],
#place::small[type='neighbourhood'] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:20;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-size:40;
  text-character-spacing: 2;
  text-wrap-width: 120;
  text-line-spacing: 2;
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
  text-size:10;
  text-wrap-width: 60;
  text-line-spacing: 1;
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  text-name: "[name]";
  text-size: 13;
  text-wrap-width: 60;
  text-character-spacing: 1;
  text-halo-radius: 2;
  text-halo-radius: 1.5;
  text-face-name:@sans;
  text-wrap-width:30;
  text-fill: #888;
  text-halo-fill: #fff;
  // Specific style overrides for different types of areas:
  [type='park'] {
    text-face-name: @sans_lt_italic;
    text-fill: @park * 0.6;
    text-halo-fill: lighten(@park, 10%);
  }
  [type='golf_course'] {
    text-fill: @sports * 0.6;
    text-halo-fill: lighten(@sports, 10%);
  }
  [type='cemetery'] {
    text-fill: @cemetery * 0.6;
    text-halo-fill: lighten(@cemetery, 10%);
  }
  [type='hospital'] {
    text-fill: @hospital * 0.6;
    text-halo-fill: lighten(@hospital, 10%);
  }
  [type='college'],
  [type='school'],
  [type='university'] {
    text-fill: @school * 0.6;
    text-halo-fill: lighten(@school, 10%);
  }
  [type='water'] {
    text-fill: @water * 0.6;
    text-halo-fill: lighten(@water, 10%);
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
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'],
  [type='canal'] {
    text-size: 20;
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-file: url(img/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/shield-motorway-1.png); }
    [reflen=2] { shield-file: url(img/shield-motorway-2.png); }
    [reflen=3] { shield-file: url(img/shield-motorway-3.png); }
    [reflen=4] { shield-file: url(img/shield-motorway-4.png); }
    [reflen=5] { shield-file: url(img/shield-motorway-5.png); }
    [reflen=6] { shield-file: url(img/shield-motorway-6.png); }
    [reflen=7] { shield-file: url(img/shield-motorway-7.png); }
    [reflen=8] { shield-file: url(img/shield-motorway-8.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/shield-trunk-1.png); }
    [reflen=2] { shield-file: url(img/shield-trunk-2.png); }
    [reflen=3] { shield-file: url(img/shield-trunk-3.png); }
    [reflen=4] { shield-file: url(img/shield-trunk-4.png); }
    [reflen=5] { shield-file: url(img/shield-trunk-5.png); }
    [reflen=6] { shield-file: url(img/shield-trunk-6.png); }
    [reflen=7] { shield-file: url(img/shield-trunk-7.png); }
    [reflen=8] { shield-file: url(img/shield-trunk-8.png); }
  }
  shield-min-distance: 180;
}

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
