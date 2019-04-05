/* LINES.MSS CONTENTS
 * - Roads
 * - other linear features
 */


/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* ---- Casing ----------------------------------------------- */

/* This first layer (roads::outline) is the "bottom" layer of most of roads */
/* elements. It will give the outline of the roads, except for roads that also use */
/* outline2. */

#roads::outline,
#tunnel[render='1_outline'],
#bridge[render='1_outline']{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1],
  [tunnel=1] {
    line-cap: butt;
  }
  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: @standard_case * 0.8; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @black;
    [bridge=1] {
      [zoom <= 10] { line-width: (@huge + @outline)*@z10; }
      [zoom = 11] { line-width: (@huge + @outline)*@z11; }
      [zoom = 12] { line-width: (@huge + @outline)*@z12; }
      [zoom = 13] { line-width: (@huge + @outline)*@z13; }
      [zoom = 14] { line-width: (@huge + @outline)*@z14; }
      [zoom = 15] { line-width: (@huge + @outline)*@z15; }
      [zoom = 16] { line-width: (@huge + @outline)*@z16; }
      [zoom = 17] { line-width: (@huge + @outline)*@z17; }
      [zoom = 18] { line-width: (@huge + @outline)*@z18; }
      [zoom = 19] { line-width: (@huge + @outline)*@z19; }
      [zoom >= 20] { line-width: (@huge + @outline)*@z20; }
      line-color: @black * 0.8;
    }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.8; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] {
      [zoom <= 10] { line-width: (@large + @outline)*@z10; }
      [zoom = 11] { line-width: (@large + @outline)*@z11; }
      [zoom = 12] { line-width: (@large + @outline)*@z12; }
      [zoom = 13] { line-width: (@large + @outline)*@z13; }
      [zoom = 14] { line-width: (@large + @outline)*@z14; }
      [zoom = 15] { line-width: (@large + @outline)*@z15; }
      [zoom = 16] { line-width: (@large + @outline)*@z16; }
      [zoom = 17] { line-width: (@large + @outline)*@z17; }
      [zoom = 18] { line-width: (@large + @outline)*@z18; }
      [zoom = 19] { line-width: (@large + @outline)*@z19; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20; }
      line-color: @primary_case * 0.8;
    }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] {
      [zoom <= 10] { line-width: (@large + @outline)*@z10; }
      [zoom = 11] { line-width: (@large + @outline)*@z11; }
      [zoom = 12] { line-width: (@large + @outline)*@z12; }
      [zoom = 13] { line-width: (@large + @outline)*@z13; }
      [zoom = 14] { line-width: (@large + @outline)*@z14; }
      [zoom = 15] { line-width: (@large + @outline)*@z15; }
      [zoom = 16] { line-width: (@large + @outline)*@z16; }
      [zoom = 17] { line-width: (@large + @outline)*@z17; }
      [zoom = 18] { line-width: (@large + @outline)*@z18; }
      [zoom = 19] { line-width: (@large + @outline)*@z19; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20; }
      line-color: @secondary_case;
    }
  }
  [stylegroup='railway'] {
    line-color: #111;
    [bridge=1] {
      [zoom <= 10] { line-width: (@large + @outline)*@z10; }
      [zoom = 11] { line-width: (@large + @outline)*@z11; }
      [zoom = 12] { line-width: (@large + @outline)*@z12; }
      [zoom = 13] { line-width: (@large + @outline)*@z13; }
      [zoom = 14] { line-width: (@large + @outline)*@z14; }
      [zoom = 15] { line-width: (@large + @outline)*@z15; }
      [zoom = 16] { line-width: (@large + @outline)*@z16; }
      [zoom = 17] { line-width: (@large + @outline)*@z17; }
      [zoom = 18] { line-width: (@large + @outline)*@z18; }
      [zoom = 19] { line-width: (@large + @outline)*@z19; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20; }
      line-color: @secondary_case;
    }
    [type='disused'] { line-opacity: 0.5; }
  }
  [tunnel=1] { line-dasharray: 3,3; }

  [stylegroup='minorroad'],
  [stylegroup='service'] {
    [bridge=1] {
      [zoom <= 10] { line-width: (@medium + @outline)*@z10; }
      [zoom = 11] { line-width: (@medium + @outline)*@z11; }
      [zoom = 12] { line-width: (@medium + @outline)*@z12; }
      [zoom = 13] { line-width: (@medium + @outline)*@z13; }
      [zoom = 14] { line-width: (@medium + @outline)*@z14; }
      [zoom = 15] { line-width: (@medium + @outline)*@z15; }
      [zoom = 16] { line-width: (@medium + @outline)*@z16; }
      [zoom = 17] { line-width: (@medium + @outline)*@z17; }
      [zoom = 18] { line-width: (@medium + @outline)*@z18; }
      [zoom = 19] { line-width: (@medium + @outline)*@z19; }
      [zoom >= 20] { line-width: (@medium + @outline)*@z20; }
    }
  }

  [stylegroup='noauto'] {
    [zoom <= 10] { line-width: @tiny*@z10; }
    [zoom = 11] { line-width: @tiny*@z11; }
    [zoom = 12] { line-width: @tiny*@z12; }
    [zoom = 13] { line-width: @tiny*@z13; }
    [zoom = 14] { line-width: @tiny*@z14; }
    [zoom = 15] { line-width: @tiny*@z15; }
    [zoom = 16] { line-width: @tiny*@z16; }
    [zoom = 17] { line-width: @tiny*@z17; }
    [zoom = 18] { line-width: @tiny*@z18; }
    [zoom = 19] { line-width: @tiny*@z19; }
    [zoom >= 20] { line-width: @tiny*@z20; }
    line-dasharray: 8, 8;
    line-color: lighten(@black, 20%);
  }

  /* -- widths -- */
  [stylegroup='motorway'] {
    [zoom <= 10] { line-width: (@large + @outline)*@z10; }
    [zoom = 11] { line-width: (@large + @outline)*@z11; }
    [zoom = 12] { line-width: (@large + @outline)*@z12; }
    [zoom = 13] { line-width: (@large + @outline)*@z13; }
    [zoom = 14] { line-width: (@large + @outline)*@z14; }
    [zoom = 15] { line-width: (@large + @outline)*@z15; }
    [zoom = 16] { line-width: (@large + @outline)*@z16; }
    [zoom = 17] { line-width: (@large + @outline)*@z17; }
    [zoom = 18] { line-width: (@large + @outline)*@z18; }
    [zoom = 19] { line-width: (@large + @outline)*@z19; }
    [zoom >= 20] { line-width: (@large + @outline)*@z20; }
  }
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-width: (@large + @outline*1.5)*@z10; }
    [zoom = 11] { line-width: (@large + @outline*1.5)*@z11; }
    [zoom = 12] { line-width: (@large + @outline*1.5)*@z12; }
    [zoom = 13] { line-width: (@large + @outline*1.5)*@z13; }
    [zoom = 14] { line-width: (@large + @outline*1.5)*@z14; }
    [zoom = 15] { line-width: (@large + @outline*1.5)*@z15; }
    [zoom = 16] { line-width: (@large + @outline*1.5)*@z16; }
    [zoom = 17] { line-width: (@large + @outline*1.5)*@z17; }
    [zoom = 18] { line-width: (@large + @outline*1.5)*@z18; }
    [zoom = 19] { line-width: (@large + @outline*1.5)*@z19; }
    [zoom >= 20] { line-width: (@large + @outline*1.5)*@z20; }
  }
  [stylegroup='minorroad'] {
    [zoom <= 10] { line-width: (@small + @outline)*@z10; }
    [zoom = 11] { line-width: (@small + @outline)*@z11; }
    [zoom = 12] { line-width: (@small + @outline)*@z12; }
    [zoom = 13] { line-width: (@small + @outline)*@z13; }
    [zoom = 14] { line-width: (@small + @outline)*@z14; }
    [zoom = 15] { line-width: (@small + @outline)*@z15; }
    [zoom = 16] { line-width: (@small + @outline)*@z16; }
    [zoom = 17] { line-width: (@small + @outline)*@z17; }
    [zoom = 18] { line-width: (@small + @outline)*@z18; }
    [zoom = 19] { line-width: (@small + @outline)*@z19; }
    [zoom >= 20] { line-width: (@small + @outline)*@z20; }
  }
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: (@small + @outline)*@z10; }
    [zoom = 11] { line-width: (@small + @outline)*@z11; }
    [zoom = 12] { line-width: (@small + @outline)*@z12; }
    [zoom = 13] { line-width: (@small + @outline)*@z13; }
    [zoom = 14] { line-width: (@small + @outline)*@z14; }
    [zoom = 15] { line-width: (@small + @outline)*@z15; }
    [zoom = 16] { line-width: (@small + @outline)*@z16; }
    [zoom = 17] { line-width: (@small + @outline)*@z17; }
    [zoom = 18] { line-width: (@small + @outline)*@z18; }
    [zoom = 19] { line-width: (@small + @outline)*@z19; }
    [zoom >= 20] { line-width: (@small + @outline)*@z20; }
  }
  [stylegroup='service']{
    [tracktype='grade1'] {
      [zoom <= 10] { line-width: (@small + @outline)*@z10; }
      [zoom = 11] { line-width: (@small + @outline)*@z11; }
      [zoom = 12] { line-width: (@small + @outline)*@z12; }
      [zoom = 13] { line-width: (@small + @outline)*@z13; }
      [zoom = 14] { line-width: (@small + @outline)*@z14; }
      [zoom = 15] { line-width: (@small + @outline)*@z15; }
      [zoom = 16] { line-width: (@small + @outline)*@z16; }
      [zoom = 17] { line-width: (@small + @outline)*@z17; }
      [zoom = 18] { line-width: (@small + @outline)*@z18; }
      [zoom = 19] { line-width: (@small + @outline)*@z19; }
      [zoom >= 20] { line-width: (@small + @outline)*@z20; }
      line-color: @black;
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-width: (@small + @outline)*@z10; }
      [zoom = 11] { line-width: (@small + @outline)*@z11; }
      [zoom = 12] { line-width: (@small + @outline)*@z12; }
      [zoom = 13] { line-width: (@small + @outline)*@z13; }
      [zoom = 14] { line-width: (@small + @outline)*@z14; }
      [zoom = 15] { line-width: (@small + @outline)*@z15; }
      [zoom = 16] { line-width: (@small + @outline)*@z16; }
      [zoom = 17] { line-width: (@small + @outline)*@z17; }
      [zoom = 18] { line-width: (@small + @outline)*@z18; }
      [zoom = 19] { line-width: (@small + @outline)*@z19; }
      [zoom >= 20] { line-width: (@small + @outline)*@z20; }
    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-width: (@small + @outline)*@z10; }
      [zoom = 11] { line-width: (@small + @outline)*@z11; }
      [zoom = 12] { line-width: (@small + @outline)*@z12; }
      [zoom = 13] { line-width: (@small + @outline)*@z13; }
      [zoom = 14] { line-width: (@small + @outline)*@z14; }
      [zoom = 15] { line-width: (@small + @outline)*@z15; }
      [zoom = 16] { line-width: (@small + @outline)*@z16; }
      [zoom = 17] { line-width: (@small + @outline)*@z17; }
      [zoom = 18] { line-width: (@small + @outline)*@z18; }
      [zoom = 19] { line-width: (@small + @outline)*@z19; }
      [zoom >= 20] { line-width: (@small + @outline)*@z20; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16; }
      [zoom = 17] { line-width: (@mini + @outline)*@z17; }
      [zoom = 18] { line-width: (@mini + @outline)*@z18; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20; }
      line-dasharray: 8, 8;
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16; }
      [zoom = 17] { line-width: (@mini + @outline)*@z17; }
      [zoom = 18] { line-width: (@mini + @outline)*@z18; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20; }
      line-dasharray: 8, 8;
    }
    [zoom <= 10] { line-width: (@small + @outline)*@z10; }
    [zoom = 11] { line-width: (@small + @outline)*@z11; }
    [zoom = 12] { line-width: (@small + @outline)*@z12; }
    [zoom = 13] { line-width: (@small + @outline)*@z13; }
    [zoom = 14] { line-width: (@small + @outline)*@z14; }
    [zoom = 15] { line-width: (@small + @outline)*@z15; }
    [zoom = 16] { line-width: (@small + @outline)*@z16; }
    [zoom = 17] { line-width: (@small + @outline)*@z17; }
    [zoom = 18] { line-width: (@small + @outline)*@z18; }
    [zoom = 19] { line-width: (@small + @outline)*@z19; }
    [zoom >= 20] { line-width: (@small + @outline)*@z20; }
  }

}


/* This second group (roads) is the final layer for most of the roads */
/* elements, which will give the center of the roads (inner fill) */

#roads::middle,
#tunnel[render='3_inline'],
#bridge[render='3_inline']{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { line-color: lighten(@motorway_fill, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: lighten(@trunk_fill, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: lighten(@primary_fill, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { line-color: lighten(@secondary_fill, 10%); }
  }
  [stylegroup='railway'] {
    line-color: #fff;
    [type='disused'] { line-opacity: 0.67; }
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto'] {
    line-join: round;
  }
  [tunnel=1] {
    line-cap: butt;
  }

  [stylegroup='minorroad'] {
    line-color: @secondary_fill;
  }

  /* -- widths -- */
  [stylegroup='motorway'] {
    [zoom <= 10] { line-width: @large*@z10; }
    [zoom = 11] { line-width: @large*@z11; }
    [zoom = 12] { line-width: @large*@z12; }
    [zoom = 13] { line-width: @large*@z13; }
    [zoom = 14] { line-width: @large*@z14; }
    [zoom = 15] { line-width: @large*@z15; }
    [zoom = 16] { line-width: @large*@z16; }
    [zoom = 17] { line-width: @large*@z17; }
    [zoom = 18] { line-width: @large*@z18; }
    [zoom = 19] { line-width: @large*@z19; }
    [zoom >= 20] { line-width: @large*@z20; }
  }
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-width: @large*@z10; }
    [zoom = 11] { line-width: @large*@z11; }
    [zoom = 12] { line-width: @large*@z12; }
    [zoom = 13] { line-width: @large*@z13; }
    [zoom = 14] { line-width: @large*@z14; }
    [zoom = 15] { line-width: @large*@z15; }
    [zoom = 16] { line-width: @large*@z16; }
    [zoom = 17] { line-width: @large*@z17; }
    [zoom = 18] { line-width: @large*@z18; }
    [zoom = 19] { line-width: @large*@z19; }
    [zoom >= 20] { line-width: @large*@z20; }
  }
  [stylegroup='minorroad']{
    [zoom <= 10] { line-width: @small*@z10; }
    [zoom = 11] { line-width: @small*@z11; }
    [zoom = 12] { line-width: @small*@z12; }
    [zoom = 13] { line-width: @small*@z13; }
    [zoom = 14] { line-width: @small*@z14; }
    [zoom = 15] { line-width: @small*@z15; }
    [zoom = 16] { line-width: @small*@z16; }
    [zoom = 17] { line-width: @small*@z17; }
    [zoom = 18] { line-width: @small*@z18; }
    [zoom = 19] { line-width: @small*@z19; }
    [zoom >= 20] { line-width: @small*@z20; }
  }
  [stylegroup='noauto'] { line-width: 0; }
  [type='cutline'] { line-width: 0; }
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: @small*@z10; }
    [zoom = 11] { line-width: @small*@z11; }
    [zoom = 12] { line-width: @small*@z12; }
    [zoom = 13] { line-width: @small*@z13; }
    [zoom = 14] { line-width: @small*@z14; }
    [zoom = 15] { line-width: @small*@z15; }
    [zoom = 16] { line-width: @small*@z16; }
    [zoom = 17] { line-width: @small*@z17; }
    [zoom = 18] { line-width: @small*@z18; }
    [zoom = 19] { line-width: @small*@z19; }
    [zoom >= 20] { line-width: @small*@z20; }
    line-dasharray: 15,15;
  }
  [stylegroup='service'] {
    [tracktype='grade1'] {
      [zoom <= 10] { line-width: @small*@z10; }
      [zoom = 11] { line-width: @small*@z11; }
      [zoom = 12] { line-width: @small*@z12; }
      [zoom = 13] { line-width: @small*@z13; }
      [zoom = 14] { line-width: @small*@z14; }
      [zoom = 15] { line-width: @small*@z15; }
      [zoom = 16] { line-width: @small*@z16; }
      [zoom = 17] { line-width: @small*@z17; }
      [zoom = 18] { line-width: @small*@z18; }
      [zoom = 19] { line-width: @small*@z19; }
      [zoom >= 20] { line-width: @small*@z20; }
      line-color: @secondary_fill;
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-width: @small*@z10; }
      [zoom = 11] { line-width: @small*@z11; }
      [zoom = 12] { line-width: @small*@z12; }
      [zoom = 13] { line-width: @small*@z13; }
      [zoom = 14] { line-width: @small*@z14; }
      [zoom = 15] { line-width: @small*@z15; }
      [zoom = 16] { line-width: @small*@z16; }
      [zoom = 17] { line-width: @small*@z17; }
      [zoom = 18] { line-width: @small*@z18; }
      [zoom = 19] { line-width: @small*@z19; }
      [zoom >= 20] { line-width: @small*@z20; }
    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-width: @small*@z10; }
      [zoom = 11] { line-width: @small*@z11; }
      [zoom = 12] { line-width: @small*@z12; }
      [zoom = 13] { line-width: @small*@z13; }
      [zoom = 14] { line-width: @small*@z14; }
      [zoom = 15] { line-width: @small*@z15; }
      [zoom = 16] { line-width: @small*@z16; }
      [zoom = 17] { line-width: @small*@z17; }
      [zoom = 18] { line-width: @small*@z18; }
      [zoom = 19] { line-width: @small*@z19; }
      [zoom >= 20] { line-width: @small*@z20; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-width: @mini*@z10; }
      [zoom = 11] { line-width: @mini*@z11; }
      [zoom = 12] { line-width: @mini*@z12; }
      [zoom = 13] { line-width: @mini*@z13; }
      [zoom = 14] { line-width: @mini*@z14; }
      [zoom = 15] { line-width: @mini*@z15; }
      [zoom = 16] { line-width: @mini*@z16; }
      [zoom = 17] { line-width: @mini*@z17; }
      [zoom = 18] { line-width: @mini*@z18; }
      [zoom = 19] { line-width: @mini*@z19; }
      [zoom >= 20] { line-width: @mini*@z20; }
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-width: @mini*@z10; }
      [zoom = 11] { line-width: @mini*@z11; }
      [zoom = 12] { line-width: @mini*@z12; }
      [zoom = 13] { line-width: @mini*@z13; }
      [zoom = 14] { line-width: @mini*@z14; }
      [zoom = 15] { line-width: @mini*@z15; }
      [zoom = 16] { line-width: @mini*@z16; }
      [zoom = 17] { line-width: @mini*@z17; }
      [zoom = 18] { line-width: @mini*@z18; }
      [zoom = 19] { line-width: @mini*@z19; }
      [zoom >= 20] { line-width: @mini*@z20; }
    }
    [zoom <= 10] { line-width: @small*@z10; }
    [zoom = 11] { line-width: @small*@z11; }
    [zoom = 12] { line-width: @small*@z12; }
    [zoom = 13] { line-width: @small*@z13; }
    [zoom = 14] { line-width: @small*@z14; }
    [zoom = 15] { line-width: @small*@z15; }
    [zoom = 16] { line-width: @small*@z16; }
    [zoom = 17] { line-width: @small*@z17; }
    [zoom = 18] { line-width: @small*@z18; }
    [zoom = 19] { line-width: @small*@z19; }
    [zoom >= 20] { line-width: @small*@z20; }
  }
}

/* This third layer (roads::top) is the "top" layer of some special roads */
/* elements that needs 3 superimposed layer for their rendering. */

#roads::top {
  [type='motorway'],
  [type='motorway_link'] {
    [zoom <= 10] { line-width: @outline*@z10; }
    [zoom = 11] { line-width: @outline*@z11; }
    [zoom = 12] { line-width: @outline*@z12; }
    [zoom = 13] { line-width: @outline*@z13; }
    [zoom = 14] { line-width: @outline*@z14; }
    [zoom = 15] { line-width: @outline*@z15; }
    [zoom = 16] { line-width: @outline*@z16; }
    [zoom = 17] { line-width: @outline*@z17; }
    [zoom = 18] { line-width: @outline*@z18; }
    [zoom = 19] { line-width: @outline*@z19; }
    [zoom >= 20] { line-width: @outline*@z20; }
    line-color: #fff;
    line-dasharray: 5,5;
  }

  [stylegroup='service'] {
    [tracktype='grade1'] {
      [zoom <= 10] { line-width: @small*@z10; }
      [zoom = 11] { line-width: @small*@z11; }
      [zoom = 12] { line-width: @small*@z12; }
      [zoom = 13] { line-width: @small*@z13; }
      [zoom = 14] { line-width: @small*@z14; }
      [zoom = 15] { line-width: @small*@z15; }
      [zoom = 16] { line-width: @small*@z16; }
      [zoom = 17] { line-width: @small*@z17; }
      [zoom = 18] { line-width: @small*@z18; }
      [zoom = 19] { line-width: @small*@z19; }
      [zoom >= 20] { line-width: @small*@z20; }
      line-dasharray: 20,20;
      line-color: #fff;
    }
  }
}


/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'],
#bridge[render='2_line']{
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
  }
  /* -- widths -- */
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: @outline*@z10*1.5; }
    [zoom = 11] { line-width: @outline*@z11*1.5; }
    [zoom = 12] { line-width: @outline*@z12*1.5; }
    [zoom = 13] { line-width: @outline*@z13*1.5; }
    [zoom = 14] { line-width: @outline*@z14*1.5; }
    [zoom = 15] { line-width: @outline*@z15*1.5; }
    [zoom = 16] { line-width: @outline*@z16*1.5; }
    [zoom = 17] { line-width: @outline*@z17*1.5; }
    [zoom = 18] { line-width: @outline*@z18*1.5; }
    [zoom = 19] { line-width: @outline*@z19*1.5; }
    [zoom >= 20] { line-width: @outline*@z20*1.5; }
  }
}

/* ---- Bridge symbol layer -------------------------------- */
#bridge_symbol {
  [zoom <= 10] { marker-height: @bridge_marker*@z10; }
  [zoom = 11] { marker-height: @bridge_marker*@z11; }
  [zoom = 12] { marker-height: @bridge_marker*@z12; }
  [zoom = 13] { marker-height: @bridge_marker*@z13; }
  [zoom = 14] { marker-height: @bridge_marker*@z14; }
  [zoom = 15] { marker-height: @bridge_marker*@z15; }
  [zoom = 16] { marker-height: @bridge_marker*@z16; }
  [zoom = 17] { marker-height: @bridge_marker*@z17; }
  [zoom = 18] { marker-height: @bridge_marker*@z18; }
  [zoom = 19] { marker-height: @bridge_marker*@z19; }
  [zoom >= 20] { marker-height: @bridge_marker*@z20; }
  marker-file: url(../img/bridge.svg);
  marker-transform: rotate([orientation]);
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway {
  line-color: @aeroway;
  line-cap: butt;
  line-join: miter;
  [type='runway'] {
    [zoom <= 10] { line-width: @huge*@z10; }
    [zoom = 11] { line-width: @huge*@z11; }
    [zoom = 12] { line-width: @huge*@z12; }
    [zoom = 13] { line-width: @huge*@z13; }
    [zoom = 14] { line-width: @huge*@z14; }
    [zoom = 15] { line-width: @huge*@z15; }
    [zoom = 16] { line-width: @huge*@z16; }
    [zoom = 17] { line-width: @huge*@z17; }
    [zoom = 18] { line-width: @huge*@z18; }
    [zoom = 19] { line-width: @huge*@z19; }
    [zoom >= 20] { line-width: @huge*@z20; }
    line-color: @darkgray;
  }
  [type='taxiway'] {
    [zoom <= 10] { line-width: @tiny*@z10; }
    [zoom = 11] { line-width: @tiny*@z11; }
    [zoom = 12] { line-width: @tiny*@z12; }
    [zoom = 13] { line-width: @tiny*@z13; }
    [zoom = 14] { line-width: @tiny*@z14; }
    [zoom = 15] { line-width: @tiny*@z15; }
    [zoom = 16] { line-width: @tiny*@z16; }
    [zoom = 17] { line-width: @tiny*@z17; }
    [zoom = 18] { line-width: @tiny*@z18; }
    [zoom = 19] { line-width: @tiny*@z19; }
    [zoom >= 20] { line-width: @tiny*@z20; }
  }
}


/* ================================================================== */
/* LINEAR FEATURES
/* ================================================================== */

#linear_features {
  [type = 'hedge'], [type = 'tree_row'] {
    [zoom <= 10] { line-width: @tiny*@z10; }
    [zoom = 11] { line-width: @tiny*@z11; }
    [zoom = 12] { line-width: @tiny*@z12; }
    [zoom = 13] { line-width: @tiny*@z13; }
    [zoom = 14] { line-width: @tiny*@z14; }
    [zoom = 15] { line-width: @tiny*@z15; }
    [zoom = 16] { line-width: @tiny*@z16; }
    [zoom = 17] { line-width: @tiny*@z17; }
    [zoom = 18] { line-width: @tiny*@z18; }
    [zoom = 19] { line-width: @tiny*@z19; }
    [zoom >= 20] { line-width: @tiny*@z20; }
    line-color: darken(@green,30%);
    line-dasharray: 3,5;
  }
  [type = 'line'] {
    line-color: @black;
    [zoom <= 10] { line-width: @outline*@z10; }
    [zoom = 11] { line-width: @outline*@z11; }
    [zoom = 12] { line-width: @outline*@z12; }
    [zoom = 13] { line-width: @outline*@z13; }
    [zoom = 14] { line-width: @outline*@z14; }
    [zoom = 15] { line-width: @outline*@z15; }
    [zoom = 16] { line-width: @outline*@z16; }
    [zoom = 17] { line-width: @outline*@z17; }
    [zoom = 18] { line-width: @outline*@z18; }
    [zoom = 19] { line-width: @outline*@z19; }
    [zoom >= 20] { line-width: @outline*@z20; }
  }
  [type = 'embankment'] {
      line-pattern-file: url(../img/embankment.svg);
  }
  [type = 'cliff'] {
      line-pattern-file: url(../img/cliff.svg);
  }
  [type = 'cutline'] {
    [zoom <= 10] { line-width: @outline*@z10; }
    [zoom = 11] { line-width: @outline*@z11; }
    [zoom = 12] { line-width: @outline*@z12; }
    [zoom = 13] { line-width: @outline*@z13; }
    [zoom = 14] { line-width: @outline*@z14; }
    [zoom = 15] { line-width: @outline*@z15; }
    [zoom = 16] { line-width: @outline*@z16; }
    [zoom = 17] { line-width: @outline*@z17; }
    [zoom = 18] { line-width: @outline*@z18; }
    [zoom = 19] { line-width: @outline*@z19; }
    [zoom >= 20] { line-width: @outline*@z20; }
    line-dasharray: 25, 15;
    line-color: @darkgray;
  }
}

/******************************************************************* */


/* ================================================================== */
/* BOUNDARIES
/* ================================================================== */

#boundaries {
  line-color: @admin;
  line-dasharray: 20, 10, 5;
  [admin_level = "6"] {
    [zoom <= 10] { line-width: @small*@z10; }
    [zoom = 11] { line-width: @small*@z11; }
    [zoom = 12] { line-width: @small*@z12; }
    [zoom = 13] { line-width: @small*@z13; }
    [zoom = 14] { line-width: @small*@z14; }
    [zoom = 15] { line-width: @small*@z15; }
    [zoom = 16] { line-width: @small*@z16; }
    [zoom = 17] { line-width: @small*@z17; }
    [zoom = 18] { line-width: @small*@z18; }
    [zoom = 19] { line-width: @small*@z19; }
    [zoom >= 20] { line-width: @small*@z20; }
  }
  [admin_level = "8"] {
    [zoom <= 10] { line-width: @mini*@z10; }
    [zoom = 11] { line-width: @mini*@z11; }
    [zoom = 12] { line-width: @mini*@z12; }
    [zoom = 13] { line-width: @mini*@z13; }
    [zoom = 14] { line-width: @mini*@z14; }
    [zoom = 15] { line-width: @mini*@z15; }
    [zoom = 16] { line-width: @mini*@z16; }
    [zoom = 17] { line-width: @mini*@z17; }
    [zoom = 18] { line-width: @mini*@z18; }
    [zoom = 19] { line-width: @mini*@z19; }
    [zoom >= 20] { line-width: @mini*@z20; }
  }
}

/******************************************************************* */
