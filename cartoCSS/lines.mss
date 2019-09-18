/* LINES.MSS CONTENTS
 * - Roads
 * - other linear features
 */

/******************************************************************* */





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
  line-color: @black;
  [bridge=1] { line-color: @standard_case * 0.8; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @black;
    [bridge=1] {
      [zoom <= 10] { line-width: (@huge + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@huge + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@huge + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@huge + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@huge + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@huge + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@huge + @outline)*@z16_road; }
      [zoom = 17] { line-width: @huge + @outline; }
      [zoom = 18] { line-width: @huge + @outline; }
      [zoom = 19] { line-width: (@huge + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@huge + @outline)*@z20_road; }
      line-color: @black;
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
      [zoom <= 10] { line-width: (@large + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@large + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@large + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@large + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@large + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@large + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@large + @outline)*@z16_road; }
      [zoom = 17] { line-width: @large*2.5 + @outline; }
      [zoom = 18] { line-width: @large*2.5 + @outline; }
      [zoom = 19] { line-width: (@large + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20_road; }
      line-color: @primary_case;
    }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @black;
    [bridge=1] {
      [zoom <= 10] { line-width: (@large + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@large + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@large + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@large + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@large + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@large + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@large + @outline)*@z16_road; }
      [zoom = 17] { line-width: @large*1.5 + @outline; }
      [zoom = 18] { line-width: @large*1.5 + @outline; }
      [zoom = 19] { line-width: (@large + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20_road; }

    }
  }
  [stylegroup='railway'] {
    line-color: @black;
    [bridge=1] {
      [zoom <= 10] { line-width: (@large + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@large + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@large + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@large + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@large + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@large + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@large + @outline)*@z16_road; }
      [zoom = 17] { line-width: @small + @outline; }
      [zoom = 18] { line-width: @small + @outline; }
      [zoom = 19] { line-width: (@large + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@large + @outline)*@z20_road; }
    }

  }
  [tunnel=1] { line-dasharray: 3,3; }

  [stylegroup='minorroad'],
  [stylegroup='service'] {
    [bridge=1] {
      [zoom <= 10] { line-width: (@medium + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@medium + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@medium + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@medium + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@medium + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@medium + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@medium + @outline)*@z16_road; }
      [zoom = 17] { line-width: @medium + @outline; }
      [zoom = 18] { line-width: @medium + @outline; }
      [zoom = 19] { line-width: (@medium + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@medium + @outline)*@z20_road; }
    }
  }

  [stylegroup='noauto'] {
    line-cap: butt;
    [zoom <= 10] { line-width: (@minus+@outline)*@z10_road; }
    [zoom = 11] { line-width: (@minus+@outline)*@z11_road; }
    [zoom = 12] { line-width: (@minus+@outline)*@z12_road; }
    [zoom = 13] { line-width: (@minus+@outline)*@z13_road; }
    [zoom = 14] { line-width: (@minus+@outline)*@z14_road; }
    [zoom = 15] { line-width: (@minus+@outline)*@z15_road; }
    [zoom = 16] { line-width: (@minus+@outline)*@z16_road; }
    [zoom = 17] { line-width: @minus+@outline; }
    [zoom = 18] { line-width: @minus+@outline; }
    [zoom = 19] { line-width: (@minus+@outline)*@z19_road; }
    [zoom >= 20] { line-width: (@minus+@outline)*@z20_road; }

    line-color: @black;
  }

  /* -- widths -- */
  [stylegroup='motorway'] {
    [zoom <= 10] { line-width: (@large + @outline)*@z10_road; }
    [zoom = 11] { line-width: (@large + @outline)*@z11_road; }
    [zoom = 12] { line-width: (@large + @outline)*@z12_road; }
    [zoom = 13] { line-width: (@large + @outline)*@z13_road; }
    [zoom = 14] { line-width: (@large + @outline)*@z14_road; }
    [zoom = 15] { line-width: (@large + @outline)*@z15_road; }
    [zoom = 16] { line-width: (@large + @outline)*@z16_road; }
    [zoom = 17] { line-width: @large + @outline; }
    [zoom = 18] { line-width: @large + @outline; }
    [zoom = 19] { line-width: (@large + @outline)*@z19_road; }
    [zoom >= 20] { line-width: (@large + @outline)*@z20_road; }
  }
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-width: (@large*2.5 + @outline*1.5)*@z10_road; }
    [zoom = 11] { line-width: (@large*2.5 + @outline*1.5)*@z11_road; }
    [zoom = 12] { line-width: (@large*2.5 + @outline*1.5)*@z12_road; }
    [zoom = 13] { line-width: (@large*2.5 + @outline*1.5)*@z13_road; }
    [zoom = 14] { line-width: (@large*2.5 + @outline*1.5)*@z14_road; }
    [zoom = 15] { line-width: (@large*2.5 + @outline*1.5)*@z15_road; }
    [zoom = 16] { line-width: (@large*2.5 + @outline*1.5)*@z16_road; }
    [zoom = 17] { line-width: @large*2.5 + @outline; }
    [zoom = 18] { line-width: @large*2.5 + @outline; }
    [zoom = 19] { line-width: (@large*2.5 + @outline*1.5)*@z19_road; }
    [zoom >= 20] { line-width: (@large*2.5 + @outline*1.5)*@z20_road; }
  }
  [stylegroup='minorroad'] {
    [zoom <= 10] { line-width: (@large*1.5 + @outline)*@z10_road; }
    [zoom = 11] { line-width: (@large*1.5 + @outline)*@z11_road; }
    [zoom = 12] { line-width: (@large*1.5 + @outline)*@z12_road; }
    [zoom = 13] { line-width: (@large*1.5 + @outline)*@z13_road; }
    [zoom = 14] { line-width: (@large*1.5 + @outline)*@z14_road; }
    [zoom = 15] { line-width: (@large*1.5 + @outline)*@z15_road; }
    [zoom = 16] { line-width: (@large*1.5 + @outline)*@z16_road; }
    [zoom = 17] { line-width: @large*1.5 + @outline; }
    [zoom = 18] { line-width: @large*1.5 + @outline; }
    [zoom = 19] { line-width: (@large*1.5 + @outline)*@z19_road; }
    [zoom >= 20] { line-width: (@large*1.5 + @outline)*@z20_road; }
  }
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: (@medium + @outline)*@z10_road; }
    [zoom = 11] { line-width: (@medium + @outline)*@z11_road; }
    [zoom = 12] { line-width: (@medium + @outline)*@z12_road; }
    [zoom = 13] { line-width: (@medium + @outline)*@z13_road; }
    [zoom = 14] { line-width: (@medium + @outline)*@z14_road; }
    [zoom = 15] { line-width: (@medium + @outline)*@z15_road; }
    [zoom = 16] { line-width: (@medium + @outline)*@z16_road; }
    [zoom = 17] { line-width: @medium + @outline; }
    [zoom = 18] { line-width: @medium + @outline; }
    [zoom = 19] { line-width: (@medium + @outline)*@z19_road; }
    [zoom >= 20] { line-width: (@medium + @outline)*@z20_road; }
  }
  [stylegroup='service']{
    [tracktype='grade1'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
      [zoom = 17] { line-width: @mini + @outline; }
      [zoom = 18] { line-width: @mini + @outline; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }
      line-color: @black;
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
      [zoom = 17] { line-width: @mini + @outline; }
      [zoom = 18] { line-width: @mini + @outline; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }

    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
      [zoom = 17] { line-width: @mini + @outline; }
      [zoom = 18] { line-width: @mini + @outline; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
      [zoom = 17] { line-width: @mini + @outline; }
      [zoom = 18] { line-width: @mini + @outline; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
      [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
      [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
      [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
      [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
      [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
      [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
      [zoom = 17] { line-width: @mini + @outline; }
      [zoom = 18] { line-width: @mini + @outline; }
      [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }
      line-color: @black;
    }
    [zoom <= 10] { line-width: (@mini + @outline)*@z10_road; }
    [zoom = 11] { line-width: (@mini + @outline)*@z11_road; }
    [zoom = 12] { line-width: (@mini + @outline)*@z12_road; }
    [zoom = 13] { line-width: (@mini + @outline)*@z13_road; }
    [zoom = 14] { line-width: (@mini + @outline)*@z14_road; }
    [zoom = 15] { line-width: (@mini + @outline)*@z15_road; }
    [zoom = 16] { line-width: (@mini + @outline)*@z16_road; }
    [zoom = 17] { line-width: @mini + @outline; }
    [zoom = 18] { line-width: @mini + @outline; }
    [zoom = 19] { line-width: (@mini + @outline)*@z19_road; }
    [zoom >= 20] { line-width: (@mini + @outline)*@z20_road; }
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
    [tunnel=1] { line-color: @motorway_fill; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: @trunk_fill; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: @primary_fill; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { line-color: @secondary_fill; }
  }
  [stylegroup='railway'] {
    line-color: #fff;
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
    [zoom <= 10] { line-width: @large*@z10_road; }
    [zoom = 11] { line-width: @large*@z11_road; }
    [zoom = 12] { line-width: @large*@z12_road; }
    [zoom = 13] { line-width: @large*@z13_road; }
    [zoom = 14] { line-width: @large*@z14_road; }
    [zoom = 15] { line-width: @large*@z15_road; }
    [zoom = 16] { line-width: @large*@z16_road; }
    [zoom = 17] { line-width: @large; }
    [zoom = 18] { line-width: @large; }
    [zoom = 19] { line-width: @large*@z19_road; }
    [zoom >= 20] { line-width: @large*@z20_road; }
  }
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-width: @large*2.5*@z10_road; }
    [zoom = 11] { line-width: @large*2.5*@z11_road; }
    [zoom = 12] { line-width: @large*2.5*@z12_road; }
    [zoom = 13] { line-width: @large*2.5*@z13_road; }
    [zoom = 14] { line-width: @large*2.5*@z14_road; }
    [zoom = 15] { line-width: @large*2.5*@z15_road; }
    [zoom = 16] { line-width: @large*2.5*@z16_road; }
    [zoom = 17] { line-width: @large*2.5; }
    [zoom = 18] { line-width: @large*2.5; }
    [zoom = 19] { line-width: @large*2.5*@z19_road; }
    [zoom >= 20] { line-width: @large*2.5*@z20_road; }
  }
  [stylegroup='minorroad']{
    [zoom <= 10] { line-width: @large*1.5*@z10_road; }
    [zoom = 11] { line-width: @large*1.5*@z11_road; }
    [zoom = 12] { line-width: @large*1.5*@z12_road; }
    [zoom = 13] { line-width: @large*1.5*@z13_road; }
    [zoom = 14] { line-width: @large*1.5*@z14_road; }
    [zoom = 15] { line-width: @large*1.5*@z15_road; }
    [zoom = 16] { line-width: @large*1.5*@z16_road; }
    [zoom = 17] { line-width: @large*1.5; }
    [zoom = 18] { line-width: @large*1.5; }
    [zoom = 19] { line-width: @large*1.5*@z19_road; }
    [zoom >= 20] { line-width: @large*1.5*@z20_road; }
  }
  [stylegroup='noauto'] {
    [zoom <= 10] { line-width: @minus*@z10_road; }
    [zoom = 11] { line-width: @tiny*@z11_road; }
    [zoom = 12] { line-width: @tiny*@z12_road; }
    [zoom = 13] { line-width: @tiny*@z13_road; }
    [zoom = 14] { line-width: @tiny*@z14_road; }
    [zoom = 15] { line-width: @tiny*@z15_road; }
    [zoom = 16] { line-width: @tiny*@z16_road; }
    [zoom = 17] { line-width: @minus; }
    [zoom = 18] { line-width: @minus; }
    [zoom = 19] { line-width: @tiny*@z19_road; }
    [zoom >= 20] { line-width: @tiny*@z20_road; }
    line-color: @yellow;
  }
  [type='cutline'] { line-width: 0; }
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: @medium*@z10_road; }
    [zoom = 11] { line-width: @medium*@z11_road; }
    [zoom = 12] { line-width: @medium*@z12_road; }
    [zoom = 13] { line-width: @medium*@z13_road; }
    [zoom = 14] { line-width: @medium*@z14_road; }
    [zoom = 15] { line-width: @medium*@z15_road; }
    [zoom = 16] { line-width: @medium*@z16_road; }
    [zoom = 17] { line-width: @medium; }
    [zoom = 18] { line-width: @medium; }
    [zoom = 19] { line-width: @medium*@z19_road; }
    [zoom >= 20] { line-width: @medium*@z20_road; }
    line-dasharray: 15, 15;
  }
  [stylegroup='service'] {
    [tracktype='grade1'] {
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
      line-color: @secondary_fill;
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
    }
      [zoom <= 10] { line-width: @mini*@z10_road; }
      [zoom = 11] { line-width: @mini*@z11_road; }
      [zoom = 12] { line-width: @mini*@z12_road; }
      [zoom = 13] { line-width: @mini*@z13_road; }
      [zoom = 14] { line-width: @mini*@z14_road; }
      [zoom = 15] { line-width: @mini*@z15_road; }
      [zoom = 16] { line-width: @mini*@z16_road; }
      [zoom = 17] { line-width: @mini; }
      [zoom = 18] { line-width: @mini; }
      [zoom = 19] { line-width: @mini*@z19_road; }
      [zoom >= 20] { line-width: @mini*@z20_road; }
  }
}

/* This third layer (roads::top) is the "top" layer of some special roads */
/* elements that needs 3 superimposed layer for their rendering. */

#roads::top {
  [type='motorway'],
  [type='motorway_link'] {
    [zoom <= 10] { line-width: @outline*@z10_road; }
    [zoom = 11] { line-width: @outline*@z11_road; }
    [zoom = 12] { line-width: @outline*@z12_road; }
    [zoom = 13] { line-width: @outline*@z13_road; }
    [zoom = 14] { line-width: @outline*@z14_road; }
    [zoom = 15] { line-width: @outline*@z15_road; }
    [zoom = 16] { line-width: @outline*@z16_road; }
    [zoom = 17] { line-width: @outline*@z17_road; }
    [zoom = 18] { line-width: @outline*@z18_road; }
    [zoom = 19] { line-width: @outline*@z19_road; }
    [zoom >= 20] { line-width: @outline*@z20_road; }
    line-color: #fff;
    line-dasharray: 5,5;
  }

}


/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='1_line'],
#bridge[render='2_line']{
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @black;
    line-join: round;
  }
  /* -- widths -- */
  [stylegroup='railway'] {
    [zoom <= 10] { line-width: @outline*@z10_road*1.5; }
    [zoom = 11] { line-width: @outline*@z11_road*1.5; }
    [zoom = 12] { line-width: @outline*@z12_road*1.5; }
    [zoom = 13] { line-width: @outline*@z13_road*1.5; }
    [zoom = 14] { line-width: @outline*@z14_road*1.5; }
    [zoom = 15] { line-width: @outline*@z15_road*1.5; }
    [zoom = 16] { line-width: @outline*@z16_road*1.5; }
    [zoom = 17] { line-width: @small + @outline; }
    [zoom = 18] { line-width: @small + @outline; }
    [zoom = 19] { line-width: @outline*@z19_road*1.5; }
    [zoom >= 20] { line-width: @outline*@z20_road*1.5; }
  }
}

/* ---- Bridge symbol layer -------------------------------- */
#bridge_symbol {
  [zoom <= 10] { marker-height: @bridge_marker*@z10_road; }
  [zoom = 11] { marker-height: @bridge_marker*@z11_road; }
  [zoom = 12] { marker-height: @bridge_marker*@z12_road; }
  [zoom = 13] { marker-height: @bridge_marker*@z13_road; }
  [zoom = 14] { marker-height: @bridge_marker*@z14_road; }
  [zoom = 15] { marker-height: @bridge_marker*@z15_road; }
  [zoom = 16] { marker-height: @bridge_marker*@z16_road; }
  [zoom = 17] { marker-height: 8; }
  [zoom = 18] { marker-height: 8; }
  [zoom = 19] { marker-height: @bridge_marker*@z19_road; }
  [zoom >= 20] { marker-height: @bridge_marker*@z20_road; }
  marker-file: url(../img/bridge.svg);
  marker-transform: rotate([orientation]);
}

/* ================================================================== */
/* SIDEWALK
/* ================================================================== */

#sidewalk::right {
  line-color: @vertpale;
  /*line-dasharray: 40, 15;*/
  line-join: round;
  line-cap: round;

  /* -- offsets -- */
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-offset: 0.5*(@large + @outline*1.5)*@z10_road; }
    [zoom = 11] { line-offset: 0.5*(@large + @outline*1.5)*@z11_road; }
    [zoom = 12] { line-offset: 0.5*(@large + @outline*1.5)*@z12_road; }
    [zoom = 13] { line-offset: 0.5*(@large + @outline*1.5)*@z13_road; }
    [zoom = 14] { line-offset: 0.5*(@large + @outline*1.5)*@z14_road; }
    [zoom = 15] { line-offset: 0.5*(@large + @outline*1.5)*@z15_road; }
    [zoom = 16] { line-offset: 0.5*(@large + @outline*1.5)*@z16_road; }
    [zoom = 17] { line-offset: 0.5*(@large + @outline)*0.8;  }
    [zoom = 18] { line-offset: 0.5*(@large + @outline)*0.8;  }
    [zoom = 19] { line-offset: 0.5*(@large + @outline*1.5)*@z19_road; }
    [zoom >= 20] { line-offset: 0.5*(@large + @outline*1.5)*@z20_road; }
  }
  [stylegroup='minorroad'] {
    [zoom <= 10] { line-offset: 0.5*(@small + @outline)*@z10_road; }
    [zoom = 11] { line-offset: 0.5*(@small + @outline)*@z11_road; }
    [zoom = 12] { line-offset: 0.5*(@small + @outline)*@z12_road; }
    [zoom = 13] { line-offset: 0.5*(@small + @outline)*@z13_road; }
    [zoom = 14] { line-offset: 0.5*(@small + @outline)*@z14_road; }
    [zoom = 15] { line-offset: 0.5*(@small + @outline)*@z15_road; }
    [zoom = 16] { line-offset: 0.5*(@small + @outline)*@z16_road; }
    [zoom = 17] { line-offset: 0.5*(@small + @outline)*0.8; }
    [zoom = 18] { line-offset: 0.5*(@small + @outline)*0.8; }
    [zoom = 19] { line-offset: 0.5*(@small + @outline)*@z19_road; }
    [zoom >= 20] { line-offset: 0.5*(@small + @outline)*@z20_road; }
  }
  [stylegroup='service']{
    [tracktype='grade1'] {
      [zoom <= 10] { line-offset: 0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: 0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: 0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: 0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: 0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: 0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: 0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: 0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: 0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: 0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: 0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-offset: 0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: 0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: 0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: 0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: 0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: 0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: 0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: 0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: 0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: 0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: 0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-offset: 0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: 0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: 0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: 0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: 0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: 0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: 0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: 0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: 0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: 0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: 0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-offset: 0.5*(@mini + @outline)*@z10_road; }
      [zoom = 11] { line-offset: 0.5*(@mini + @outline)*@z11_road; }
      [zoom = 12] { line-offset: 0.5*(@mini + @outline)*@z12_road; }
      [zoom = 13] { line-offset: 0.5*(@mini + @outline)*@z13_road; }
      [zoom = 14] { line-offset: 0.5*(@mini + @outline)*@z14_road; }
      [zoom = 15] { line-offset: 0.5*(@mini + @outline)*@z15_road; }
      [zoom = 16] { line-offset: 0.5*(@mini + @outline)*@z16_road; }
      [zoom = 17] { line-offset: 0.5*(@mini + @outline)*@z17_road; }
      [zoom = 18] { line-offset: 0.5*(@mini + @outline)*@z18_road; }
      [zoom = 19] { line-offset: 0.5*(@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: 0.5*(@mini + @outline)*@z20_road; }
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-offset: 0.5*(@mini + @outline)*@z10_road; }
      [zoom = 11] { line-offset: 0.5*(@mini + @outline)*@z11_road; }
      [zoom = 12] { line-offset: 0.5*(@mini + @outline)*@z12_road; }
      [zoom = 13] { line-offset: 0.5*(@mini + @outline)*@z13_road; }
      [zoom = 14] { line-offset: 0.5*(@mini + @outline)*@z14_road; }
      [zoom = 15] { line-offset: 0.5*(@mini + @outline)*@z15_road; }
      [zoom = 16] { line-offset: 0.5*(@mini + @outline)*@z16_road; }
      [zoom = 17] { line-offset: 0.5*(@mini + @outline)*@z17_road; }
      [zoom = 18] { line-offset: 0.5*(@mini + @outline)*@z18_road; }
      [zoom = 19] { line-offset: 0.5*(@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: 0.5*(@mini + @outline)*@z20_road; }
    }
    [zoom <= 10] { line-offset: 0.5*(@small + @outline)*@z10_road; }
    [zoom = 11] { line-offset: 0.5*(@small + @outline)*@z11_road; }
    [zoom = 12] { line-offset: 0.5*(@small + @outline)*@z12_road; }
    [zoom = 13] { line-offset: 0.5*(@small + @outline)*@z13_road; }
    [zoom = 14] { line-offset: 0.5*(@small + @outline)*@z14_road; }
    [zoom = 15] { line-offset: 0.5*(@small + @outline)*@z15_road; }
    [zoom = 16] { line-offset: 0.5*(@small + @outline)*@z16_road; }
    [zoom = 17] { line-offset: 0.5*(@small + @outline)*@z17_road; }
    [zoom = 18] { line-offset: 0.5*(@small + @outline)*@z18_road; }
    [zoom = 19] { line-offset: 0.5*(@small + @outline)*@z19_road; }
    [zoom >= 20] { line-offset: 0.5*(@small + @outline)*@z20_road; }
  }
  [sidewalk='right'], [sidewalk='both'] {line-width: @large;}
  line-width: 0;
}

#sidewalk::left {
  line-color: @vertpale;
  /*line-dasharray: 40, 15;*/
  line-join: round;
  line-cap: round;

  /* -- offsets -- */
  [stylegroup='mainroad'] {
    [zoom <= 10] { line-offset: -0.5*(@large + @outline*1.5)*@z10_road; }
    [zoom = 11] { line-offset: -0.5*(@large + @outline*1.5)*@z11_road; }
    [zoom = 12] { line-offset: -0.5*(@large + @outline*1.5)*@z12_road; }
    [zoom = 13] { line-offset: -0.5*(@large + @outline*1.5)*@z13_road; }
    [zoom = 14] { line-offset: -0.5*(@large + @outline*1.5)*@z14_road; }
    [zoom = 15] { line-offset: -0.5*(@large + @outline*1.5)*@z15_road; }
    [zoom = 16] { line-offset: -0.5*(@large + @outline*1.5)*@z16_road; }
    [zoom = 17] { line-offset: -0.5*(@large + @outline)*0.8; }
    [zoom = 18] { line-offset: -0.5*(@large + @outline)*0.8; }
    [zoom = 19] { line-offset: -0.5*(@large + @outline*1.5)*@z19_road; }
    [zoom >= 20] { line-offset: -0.5*(@large + @outline*1.5)*@z20_road; }
  }
  [stylegroup='minorroad'] {
    [zoom <= 10] { line-offset: -0.5*(@small + @outline)*@z10_road; }
    [zoom = 11] { line-offset: -0.5*(@small + @outline)*@z11_road; }
    [zoom = 12] { line-offset: -0.5*(@small + @outline)*@z12_road; }
    [zoom = 13] { line-offset: -0.5*(@small + @outline)*@z13_road; }
    [zoom = 14] { line-offset: -0.5*(@small + @outline)*@z14_road; }
    [zoom = 15] { line-offset: -0.5*(@small + @outline)*@z15_road; }
    [zoom = 16] { line-offset: -0.5*(@small + @outline)*@z16_road; }
    [zoom = 17] { line-offset: -0.5*(@small + @outline)*0.8; }
    [zoom = 18] { line-offset: -0.5*(@small + @outline)*0.8; }
    [zoom = 19] { line-offset: -0.5*(@small + @outline)*@z19_road; }
    [zoom >= 20] { line-offset: -0.5*(@small + @outline)*@z20_road; }
  }
  [stylegroup='service']{
    [tracktype='grade1'] {
      [zoom <= 10] { line-offset: -0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: -0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: -0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: -0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: -0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: -0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: -0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: -0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: -0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: -0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: -0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade2'] {
      [zoom <= 10] { line-offset: -0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: -0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: -0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: -0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: -0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: -0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: -0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: -0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: -0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: -0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: -0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade3'] {
      [zoom <= 10] { line-offset: -0.5*(@small + @outline)*@z10_road; }
      [zoom = 11] { line-offset: -0.5*(@small + @outline)*@z11_road; }
      [zoom = 12] { line-offset: -0.5*(@small + @outline)*@z12_road; }
      [zoom = 13] { line-offset: -0.5*(@small + @outline)*@z13_road; }
      [zoom = 14] { line-offset: -0.5*(@small + @outline)*@z14_road; }
      [zoom = 15] { line-offset: -0.5*(@small + @outline)*@z15_road; }
      [zoom = 16] { line-offset: -0.5*(@small + @outline)*@z16_road; }
      [zoom = 17] { line-offset: -0.5*(@small + @outline)*@z17_road; }
      [zoom = 18] { line-offset: -0.5*(@small + @outline)*@z18_road; }
      [zoom = 19] { line-offset: -0.5*(@small + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: -0.5*(@small + @outline)*@z20_road; }
    }
    [tracktype='grade4'] {
      [zoom <= 10] { line-offset: -0.5*(@mini + @outline)*@z10_road; }
      [zoom = 11] { line-offset: -0.5*(@mini + @outline)*@z11_road; }
      [zoom = 12] { line-offset: -0.5*(@mini + @outline)*@z12_road; }
      [zoom = 13] { line-offset: -0.5*(@mini + @outline)*@z13_road; }
      [zoom = 14] { line-offset: -0.5*(@mini + @outline)*@z14_road; }
      [zoom = 15] { line-offset: -0.5*(@mini + @outline)*@z15_road; }
      [zoom = 16] { line-offset: -0.5*(@mini + @outline)*@z16_road; }
      [zoom = 17] { line-offset: -0.5*(@mini + @outline)*@z17_road; }
      [zoom = 18] { line-offset: -0.5*(@mini + @outline)*@z18_road; }
      [zoom = 19] { line-offset: -0.5*(@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: -0.5*(@mini + @outline)*@z20_road; }
    }
    [tracktype='grade5'] {
      [zoom <= 10] { line-offset: -0.5*(@mini + @outline)*@z10_road; }
      [zoom = 11] { line-offset: -0.5*(@mini + @outline)*@z11_road; }
      [zoom = 12] { line-offset: -0.5*(@mini + @outline)*@z12_road; }
      [zoom = 13] { line-offset: -0.5*(@mini + @outline)*@z13_road; }
      [zoom = 14] { line-offset: -0.5*(@mini + @outline)*@z14_road; }
      [zoom = 15] { line-offset: -0.5*(@mini + @outline)*@z15_road; }
      [zoom = 16] { line-offset: -0.5*(@mini + @outline)*@z16_road; }
      [zoom = 17] { line-offset: -0.5*(@mini + @outline)*@z17_road; }
      [zoom = 18] { line-offset: -0.5*(@mini + @outline)*@z18_road; }
      [zoom = 19] { line-offset: -0.5*(@mini + @outline)*@z19_road; }
      [zoom >= 20] { line-offset: -0.5*(@mini + @outline)*@z20_road; }
    }
    [zoom <= 10] { line-offset: -0.5*(@small + @outline)*@z10_road; }
    [zoom = 11] { line-offset: -0.5*(@small + @outline)*@z11_road; }
    [zoom = 12] { line-offset: -0.5*(@small + @outline)*@z12_road; }
    [zoom = 13] { line-offset: -0.5*(@small + @outline)*@z13_road; }
    [zoom = 14] { line-offset: -0.5*(@small + @outline)*@z14_road; }
    [zoom = 15] { line-offset: -0.5*(@small + @outline)*@z15_road; }
    [zoom = 16] { line-offset: -0.5*(@small + @outline)*@z16_road; }
    [zoom = 17] { line-offset: -0.5*(@small + @outline)*@z17_road; }
    [zoom = 18] { line-offset: -0.5*(@small + @outline)*@z18_road; }
    [zoom = 19] { line-offset: -0.5*(@small + @outline)*@z19_road; }
    [zoom >= 20] { line-offset: -0.5*(@small + @outline)*@z20_road; }
  }
  [sidewalk='left'], [sidewalk= 'both'] {line-width: @large;}
  line-width: 0;
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
    line-color: @black;
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
    line-cap: round;
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
    line-color: @green;
    [zoom <= 17] {
      line-width: 0;
      line-dasharray: 1,6;
    }
    [zoom > 17] {
      line-width: 4;
      line-dasharray: 2,8;
    }

  }
  [type = 'line'] {
    line-color: @black;
    [zoom <= 10] { line-width: @mini/2*@z10; }
    [zoom = 11] { line-width: @mini/2*@z11; }
    [zoom = 12] { line-width: @mini/2*@z12; }
    [zoom = 13] { line-width: @mini/2*@z13; }
    [zoom = 14] { line-width: @mini/2*@z14; }
    [zoom = 15] { line-width: @mini/2*@z15; }
    [zoom = 16] { line-width: @mini/2*@z16; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @mini/2*@z19; }
    [zoom >= 20] { line-width: @mini/2*@z20; }
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
    line-color: @black;
  }
}
