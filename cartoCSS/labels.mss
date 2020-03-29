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
    text-name:'[ELEV]';
    text-face-name:@sans;
    text-placement:line;
    text-wrap-width: 60;
    text-line-spacing: 1;
    text-fill: @contour;
    text-halo-fill: #ffffff;
    text-halo-radius:2;
    [zoom <= 14] { text-size: 0; }
    [zoom = 15] { text-size: @text_size_s*@z15_label; }
    [zoom = 16] { text-size: @text_size_s*@z16_label; }
    [zoom = 17] { text-size: @text_size_s*@z17_label; }
    [zoom = 18] { text-size: @text_size_s*@z18_label; }
    [zoom = 19] { text-size: @text_size_s*@z19_label; }
    [zoom >= 20] { text-size: @text_size_s*@z20_label; }
    [[ELEV] % 20 = 0] {
        [zoom <= 12] { text-size: 0; }
        [zoom = 13] { text-size: @text_size_s*@z13_label; }
        [zoom = 14] { text-size: @text_size_s*@z14_label; }
    }
}



/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

/* ---- Cities ------------------------------------------------------ */

#place::city[type='city'] {
  [zoom <= 10] { text-size: @text_size_l*@z10_label*1.2; }
  [zoom = 11] { text-size: @text_size_l*@z11_label*1.2; }
  [zoom = 12] { text-size: @text_size_l*@z12_label*1.2; }
  [zoom = 13] { text-size: @text_size_l*@z13_label*1.2; }
  [zoom = 14] { text-size: @text_size_l*@z14_label*1.2; }
  [zoom = 15] { text-size: @text_size_l*@z15_label*1.2; }
  [zoom = 16] { text-size: @text_size_l*@z16_label*1.2; }
  [zoom = 17] { text-size: @text_size_l*@z17_label*1.2; }
  [zoom = 18] { text-size: @text_size_l*@z18_label*1.2; }
  [zoom = 19] { text-size: @text_size_l*@z19_label*1.2; }
  [zoom >= 20] { text-size: @text_size_l*@z20_label*1.2; }
  text-name: '[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @city_text;
  text-halo-fill: @city_halo;
  text-halo-radius: 4;
  text-character-spacing: 20;
  text-wrap-width: 400;
  text-transform: uppercase;
}

/* ---- Towns ------------------------------------------------------- */

#place::small[type='town'],
#place::town[type='village'] {
  [zoom <= 10] { text-size: @text_size_l*@z10_label; }
  [zoom = 11] { text-size: @text_size_l*@z11_label; }
  [zoom = 12] { text-size: @text_size_l*@z12_label; }
  [zoom = 13] { text-size: @text_size_l*@z13_label; text-dy: 10; }
  [zoom = 14] { text-size: @text_size_l*@z14_label; text-dy: 20; }
  [zoom = 15] { text-size: @text_size_l*@z15_label; text-dy: 100; }
  [zoom = 16] { text-size: @text_size_l*@z16_label; text-dy: 200; }
  [zoom = 17] { text-size: @text_size_l*@z17_label; }
  [zoom = 18] { text-size: @text_size_l*@z18_label; }
  [zoom = 19] { text-size: @text_size_l*@z19_label; }
  [zoom >= 20] { text-size: @text_size_l*@z20_label; }
  text-name:'[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @town_text;
  text-halo-fill: @town_halo;
  text-halo-radius: 4;
  text-wrap-width: 50;
  text-line-spacing: 2;
  text-character-spacing: 20;
  text-line-spacing: 6;
  text-allow-overlap: true;
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='suburb'],
#place::small[type='hamlet'],
#place::small[type='neighbourhood'],
#place::small[type='isolated_dwelling'] {
  [zoom <= 10] { text-size: @text_size_s*@z10_label; }
  [zoom = 11] { text-size: @text_size_s*@z11_label; }
  [zoom = 12] { text-size: @text_size_s*@z12_label; }
  [zoom = 13] { text-size: @text_size_s*@z13_label; }
  [zoom = 14] { text-size: @text_size_s*@z14_label; }
  [zoom = 15] { text-size: @text_size_s*@z15_label; }
  [zoom = 16] { text-size: @text_size_s*@z16_label; }
  [zoom = 17] { text-size: @text_size_s*@z17_label; }
  [zoom = 18] { text-size: @text_size_s*@z18_label; }
  [zoom = 19] { text-size: @text_size_s*@z19_label; }
  [zoom >= 20] { text-size: @text_size_s*@z20_label; }
  text-name: '[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @other_text;
  text-halo-fill: @other_halo;
  text-halo-radius: 4;
  text-character-spacing: 5;
  text-wrap-width: 120;
  text-line-spacing: 2;
  text-dy: -50
}

#place::small[type='locality'] {
  [zoom <= 10] { text-size: @text_size_m*@z10_label; }
  [zoom = 11] { text-size: @text_size_m*@z11_label; }
  [zoom = 12] { text-size: @text_size_m*@z12_label; }
  [zoom = 13] { text-size: @text_size_m*@z13_label; }
  [zoom = 14] { text-size: @text_size_m*@z14_label; }
  [zoom = 15] { text-size: @text_size_m*@z15_label; }
  [zoom = 16] { text-size: @text_size_m*@z16_label; }
  [zoom = 17] { text-size: @text_size_m*@z17_label; }
  [zoom = 18] { text-size: @text_size_m*@z18_label; }
  [zoom = 19] { text-size: @text_size_m*@z19_label; }
  [zoom >= 20] { text-size: @text_size_m*@z20_label; }
  text-name: '';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @locality_text;
  text-halo-fill: @locality_halo;
  text-halo-radius: 4;
  text-wrap-width: 30;
  text-wrap-width: 60;
  text-line-spacing: 1;
  text-allow-overlap: false;
  text-repeat-distance: 20000;
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
    [zoom <= 10] { text-size: 0; }
    [zoom = 11] { text-size: @text_size_s*@z11_label; }
    [zoom = 12] { text-size: @text_size_s*@z12_label; }
    [zoom = 13] { text-size: @text_size_s*@z13_label; }
    [zoom = 14] { text-size: @text_size_s*@z14_label; }
    [zoom = 15] { text-size: @text_size_s*@z15_label; }
    [zoom = 16] { text-size: @text_size_s*@z16_label; }
    [zoom = 17] { text-size: @text_size_s*@z17_label; }
    [zoom = 18] { text-size: @text_size_s*@z18_label; }
    [zoom = 19] { text-size: @text_size_s*@z19_label; }
    [zoom >= 20] { text-size: @text_size_s*@z20_label; }
    text-name: "";
    text-face-name:@sans;
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
        [area < 10000] {
            text-name: '[name]';
            text-fill: @darkblue;
            text-halo-fill: lighten(@water, 10%);
            text-halo-radius: 3;
        }
    }
    [type='school'] {
        [zoom >= 16] {
            text-name: "'Éc.'";
            text-dy: -20;
        }
    }
    [type='farmyard'] {
        [zoom >= 15] {
            text-name: "'Fme'";
            text-dy: -20;
            text-allow-overlap: false;
            text-repeat-distance: 60;
        }
    }
    [type='forest'] {
        [area > 5000000] {

            [zoom > 10] { text-size: 0; }
            [zoom = 18] { text-size: @text_size_l*[area]/5000000/4; }

            text-face-name: @sans_lt_italic;
            text-fill: lighten(@black, 10%);
            text-transform: uppercase;
            text-character-spacing: 80;
            text-line-spacing: 150;
            text-wrap-width: 200;
            text-allow-overlap: true;
            text-name: '[name]';
        }
    }
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label {
    text-name: '[name]';
    text-face-name: @sans;
    text-fill: @darkblue;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 3;
    text-placement: line;
    text-repeat-distance: 1200;
    [type='pond'], [type='lake'], [type='basin'], [type='reservoir'] {
        [zoom <= 10] { text-size: @text_size_s*@z10_label; }
        [zoom = 11] { text-size: @text_size_s*@z11_label; }
        [zoom = 12] { text-size: @text_size_s*@z12_label; }
        [zoom = 13] { text-size: @text_size_s*@z13_label; }
        [zoom = 14] { text-size: @text_size_s*@z14_label; }
        [zoom = 15] { text-size: @text_size_s*@z15_label; }
        [zoom = 16] { text-size: @text_size_s*@z16_label; }
        [zoom = 17] { text-size: @text_size_s*@z17_label; }
        [zoom = 18] { text-size: @text_size_s*@z18_label; }
        [zoom = 19] { text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { text-size: @text_size_s*@z20_label; }
        text-max-char-angle-delta: 50;
        text-allow-overlap: true;
    }
    [type='river'], [type='canal'] {
        [zoom <= 10] { text-size: @text_size_m*@z10_label; }
        [zoom = 11] { text-size: @text_size_m*@z11_label; }
        [zoom = 12] { text-size: @text_size_m*@z12_label; }
        [zoom = 13] { text-size: @text_size_m*@z13_label; }
        [zoom = 14] { text-size: @text_size_m*@z14_label; }
        [zoom = 15] { text-size: @text_size_m*@z15_label; }
        [zoom = 16] { text-size: @text_size_m*@z16_label; }
        [zoom = 17] { text-size: @text_size_m*@z17_label; }
        [zoom = 18] { text-size: @text_size_m*@z18_label; }
        [zoom = 19] { text-size: @text_size_m*@z19_label; }
        [zoom >= 20] { text-size: @text_size_m*@z20_label; }
    }
    [type='stream'] {
        [zoom <= 10] { text-size: @text_size_s*@z10_label; }
        [zoom = 11] { text-size: @text_size_s*@z11_label; }
        [zoom = 12] { text-size: @text_size_s*@z12_label; }
        [zoom = 13] { text-size: @text_size_s*@z13_label; }
        [zoom = 14] { text-size: @text_size_s*@z14_label; }
        [zoom = 15] { text-size: @text_size_s*@z15_label; }
        [zoom = 16] { text-size: @text_size_s*@z16_label; }
        [zoom = 17] { text-size: @text_size_s*@z17_label; }
        [zoom = 18] { text-size: @text_size_s*@z18_label; }
        [zoom = 19] { text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { text-size: @text_size_s*@z20_label; }
    }

}


/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_elements {
  [type='station'] {
    [zoom <= 10] { text-size: @text_size_m*@z10_label; }
    [zoom = 11] { text-size: @text_size_m*@z11_label; }
    [zoom = 12] { text-size: @text_size_m*@z12_label; }
    [zoom = 13] { text-size: @text_size_m*@z13_label; }
    [zoom = 14] { text-size: @text_size_m*@z14_label; }
    [zoom = 15] { text-size: @text_size_m*@z15_label; }
    [zoom = 16] { text-size: @text_size_m*@z16_label; }
    [zoom = 17] { text-size: @text_size_m*@z17_label; }
    [zoom = 18] { text-size: @text_size_m*@z18_label; }
    [zoom = 19] { text-size: @text_size_m*@z19_label; }
    [zoom >= 20] { text-size: @text_size_m*@z20_label; }
    text-name: 'Gare';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @other_text;
    text-halo-fill: @other_halo;
    text-halo-radius: 4;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-dy: -50;
    text-dx: -30;
  }
}

/* ****************************************************************** */
