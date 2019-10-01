/* LABELS.MSS CONTENTS:
 * - contour labels
 * - place names
 * - area labels
 * - waterway labels
 */
@supra_text_size_alfphabet: 5;
@text_size_l : 60 + @supra_text_size_alfphabet;
@text_size_m : 40 + @supra_text_size_alfphabet;
@text_size_s : 30 + @supra_text_size_alfphabet;
@text_size_xs : 20 + @supra_text_size_alfphabet;

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* CONTOUR LABELS
/* ================================================================== */

#contour {
    [main="yes"] {
        text-name:'[level]';
        text-face-name:@sans;
        text-placement:line;
        text-size: @text_size_xs;
        text-wrap-width: 60;
        text-line-spacing: 1;
        text-fill: @darkgray;
        text-halo-fill: #ffffff;
        text-halo-radius:2;
    }
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
  text-halo-radius: 4;
  text-size:@text_size_l+6;
  text-character-spacing: 20;
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
  text-halo-radius: 4;
  text-wrap-width: 50;
  text-line-spacing: 2;
  text-size:@text_size_l;
  text-character-spacing: 20;
  text-line-spacing: 6;
  text-allow-overlap: true;
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
  text-size:@text_size_m;
  text-halo-fill:@other_halo;
  text-halo-radius: 4;
  text-character-spacing: 5;
  text-wrap-width: 120;
  text-line-spacing: 2;
  text-dy: -50
}

#place::small[type='locality'] {
  /*text-name:'[name]';*/
  text-name: '';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-halo-fill:@locality_halo;
  text-halo-radius: 4;
  text-wrap-width: 30;
  text-size:@text_size_l;
  text-wrap-width: 60;
  text-line-spacing: 1;
  text-allow-overlap: false;
  text-repeat-distance: 20000;
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  text-name: '[name]';
  text-face-name:@sans;
  text-size: @text_size_s;
  text-character-spacing: 1;
  text-halo-radius: 3;
  text-wrap-width:30;
  text-fill: @black;
  text-halo-fill: #fff;
  // Specific style overrides for different types of areas:
  [type='park'] {
    text-face-name: @sans_lt_italic;
    text-fill: @green;
    text-halo-fill: lighten(@park, 10%);
  }
  [type='tourism'], [type='industrial'] {
    text-name: '[name]';
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
    text-name: '[name]';
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 3;
  }
  [type='school'] {
    text-name: '[name]';
    text-size: @text_size_s;
    text-dy: -20;
    /*text-dx: -20;*/
  }
  [type='farmyard'] {
    text-name: '[name]';
    text-size: @text_size_s;
    text-dy: -20;
    /*text-dx: -15;*/
    text-allow-overlap: false;
    text-repeat-distance: 60;
  }
  [type='forest'] {
    text-face-name: @sans_lt_italic;
    /*text-size: @text_size_l; /*[area]/100000*/
    text-size: 100/([area]*[area]);
    text-fill: lighten(@black, 10%);
    text-transform: uppercase;
    text-character-spacing: 80;
    text-line-spacing: 150;
    text-wrap-width: 200;
    text-allow-overlap: true;
    text-name: '[name]';
  }
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'],
#waterway_label[type='canal'],
#waterway_label[type='stream'] {
    text-name: '[name]';
    text-face-name: @sans;
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 60%);
    text-halo-radius: 3;
    text-placement: line;
    text-repeat-distance: 1200;
    text-size: @text_size_m;
    text-character-spacing: 2;
    text-spacing: 300;
}

#waterway_label[type='stream'] {
    text-size: @text_size_s;
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
    text-halo-radius: 4;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-dy: -50;
    text-dx: -30;
  }
}

/* ****************************************************************** */
