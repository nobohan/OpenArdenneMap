/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* Road width variables that are used in road & bridge styles */
@large: 14;
@medium: 12;
@small: 10;
@tiny: 8;
@mini: 6;

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
    line-color: #111;
    [bridge=1] { line-color: #111 * 0.8; line-width: @medium + 2 + 6; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.8; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case * 0.8; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case; line-width: @medium + 6; }
  }
  [stylegroup='railway'] {
    line-color: #111;
    [bridge=1] { line-color: @secondary_case; line-width: @mini + 2 + 6; }
  }
  [tunnel=1] { line-dasharray: 3,3; }

  [stylegroup='minorroad'],
  [stylegroup='service'] {
    [bridge=1] { line-width: @tiny + 2 + 4; }
  }

  /* -- widths -- */
  [stylegroup='motorway'] { line-width: @medium + 2; }
  [stylegroup='mainroad'] { line-width: @medium + 3; }
  [stylegroup='minorroad']{ line-width: @tiny + 2; }
  [stylegroup='noauto']   { line-width: @mini; line-dasharray: 12, 12; line-color:@black; }
  [stylegroup='railway']  { line-width: @mini + 2; }
  [stylegroup='service']{
    [tracktype='grade1'] { line-width: @tiny + 2; line-color: #111}
    [tracktype='grade2'] { line-width: @tiny + 2; }
    [tracktype='grade3'] { line-width: @tiny + 2; }
    [tracktype='grade4'] { line-width: @mini + 2; }
    [tracktype='grade5'] { line-width: @mini + 2; }
    line-width: @small / 2 + 3;
  }

}


/* This second group (roads) is the final layer for most of the roads */
/* elements, which will give the center of the roads (inner fill) */

#roads,
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
    [type='subway'] { line-opacity: 0.67; }
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
  [stylegroup='motorway'] { line-width: @medium; }
  [stylegroup='mainroad'] { line-width: @medium; }
  [stylegroup='minorroad']{ line-width: @tiny; }
  [stylegroup='noauto']   { line-width: 0; }
  [stylegroup='railway']  { line-width: @mini; line-dasharray: 15,15;}
  [stylegroup='service'] {
    [tracktype='grade1'] { line-width: @tiny; line-color: @secondary_fill;}
    [tracktype='grade2'] { line-width: @tiny; }
    [tracktype='grade3'] { line-width: @tiny; }
    [tracktype='grade4'] { line-width: @mini; }
    [tracktype='grade5'] { line-width: @mini; }
    line-width: @small / 2;
  }
}

/* This third layer (roads::top) is the "top" layer of some special roads */
/* elements that needs 3 superimposed layer for their rendering. */

#roads::top {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: #fff;
    line-width: 2;
    line-dasharray: 5,5;
  }

  [stylegroup='service'] {
    [tracktype='grade1'] {
      line-width: @tiny ;
      line-dasharray: 20,20;
      line-color: #fff; }
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

  [stylegroup='noauto']   { line-width: @small / 4 + 1; }
  [stylegroup='railway']  { line-width: 2 + 1; }

}

/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  marker-width:@small * 1.1;
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    line-width:15;
  }
  [type='taxiway'] {
    line-width:3;
  }
}

/******************************************************************* */
