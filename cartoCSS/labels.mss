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
    [main="yes"] {
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
        text-name:'[level]';
        text-face-name:@sans;
        text-placement:line;
        text-wrap-width: 60;
        text-line-spacing: 1;
        text-fill: @contour;
        text-halo-fill: #ffffff;
        text-halo-radius: 2;
    }
}


/* ================================================================== */
/* STREET LABELS
/* ================================================================== */

#street_label {
  text-name: '[name]';
  text-face-name: @sans;
  text-placement: line;
  text-character-spacing: 2;
  text-line-spacing: 1;
  text-fill: @road_text;
  text-halo-fill: #ffffff;
  text-halo-radius: 2;
  text-allow-overlap: true;
  text-size: @text_size_s;
  text-line-spacing: 25;
  [stylegroup = "mainroad"] {
    text-transform: uppercase;
    text-size: @text_size_s*0.8
  }
  [stylegroup = "noauto"], [stylegroup = "service"] {
    text-dy: 14;
    text-size: @text_size_s*0.8;
    text-wrap-width: 800;
  }
  [stylegroup = "noauto"] {
    text-dy: 10;
  }

  /* Low scale maps (global map) */
  [zoom <= 17]{
    [length <= 1000]{
      text-name: '[short_name]';
      text-wrap-width: 100;
      text-character-spacing: 0.1;
    }
    [length > 1000]{
      text-name: '[name]';
      text-wrap-width: 400;
      text-character-spacing: 6;
      text-spacing: 900;
    }
  }


  /* High scale maps (Mini-maps) */
  [zoom > 17]{
    [length <= 100] {
      text-name: '[very_short_name]';
      text-wrap-width: 20;
      text-character-spacing: 0.1;
      text-size: @text_size_xs;
      text-max-char-angle-delta: 50;
    }
    [length > 100] {
      text-name: '[very_short_name]';
      text-wrap-width: 110;
      text-character-spacing: 0.1;
      text-size: @text_size_xs;
      text-max-char-angle-delta: 50;
    }
    [length > 150]{
      text-name: '[short_name]';
      text-wrap-width: 300;
      text-repeat-distance: 2000;
      text-character-spacing: 0.1;
      text-size: @text_size_s;
    }
    [length > 400]{
      text-name: '[short_name]';
      text-wrap-width: 600;
      text-size: @text_size_m;
    }
    [length > 1000]{
      text-name: '[name]';
      text-spacing: 1200;
      text-character-spacing: 4;
      text-wrap-width: 800;
      text-size: @text_size_m;
    }
    [stylegroup= "noauto"], [stylegroup="service"] {
      text-size: @text_size_m*0.8;
    }
    [stylegroup= "mainroad"] {
      text-size: @text_size_m
    }
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
  text-name: '[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @city_text;
  text-halo-fill: @city_halo;
  text-halo-radius: 4;
  text-character-spacing: 20;
  text-wrap-width: 400;
  text-transform: uppercase;
  [zoom > 17] { text-size: 0;}
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
  text-dy: 40;
  text-dx: -250;
  [zoom > 17] { text-name: '';}
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
  text-name: "";
  text-face-name: @sans;
  text-character-spacing: 1;
  text-halo-radius: 3;
  text-wrap-width: 30;
  text-fill: @black;
  text-halo-fill: #fff;
  // Specific style overrides for different types of areas:
  [type='park'] {
    text-face-name: @sans;
    text-fill: @green;
    text-halo-fill: @park;
  }
  [type='tourism'], [type='industrial'] {
    text-name: '[name]';
  }
  [type='hospital'] {
    text-fill: @black;
    text-halo-fill: @hospital;
  }
  [type='college'],
  [type='university'] {
    text-fill: @black;
    text-halo-fill: @hospital;
  }
  [type='water'] {
    text-name: '[name]';
    text-fill: @water;
    text-halo-fill: @purewhite;
    text-halo-radius: 3;
  }
  [type='school'] {
    text-name: "'Éc.'";
    text-dy: -20;
    text-allow-overlap: true;
  }

  [type='forest'] {
    text-face-name: @sans;
    /*text-size: @text_size_l; /*[area]/100000*/
    /*text-size: 100/([area]*[area]);*/
    text-fill: @black;
    text-transform: uppercase;
    text-character-spacing: 10;
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
  text-name: '[name]';
  text-face-name: @sans;
  text-fill: @water;
  text-halo-fill: @purewhite;
  text-halo-radius: 3;
  text-placement: line;
  text-repeat-distance: 1200;
  text-spacing: 300;
  [zoom > 17]{ text-name: '';}
}

#waterway_label[type='stream'] {
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



/* ****************************************************************** */
