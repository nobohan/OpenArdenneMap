/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* Road width variables that are used in road & bridge styles */
@rdz16_maj: 14;   @rdz16_med: 12;   @rdz16_min: 10;

/* ---- Casing ----------------------------------------------- */
/* This first layer (roads::outline) is the "bottom" layer of the roads */
/* elements, which will give the outline of the roads. */

#roads::outline2{
  [stylegroup='service']{
    [tracktype='grade1'] { line-width: @rdz16_min / 2 + 8; line-color: #111}
  }
}


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
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case * 0.8; }
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
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [stylegroup='railway'] {
    line-color: #111;
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [tunnel=1] { line-dasharray: 3,3; }

  /* -- widths -- */
  [stylegroup='motorway'] { line-width: @rdz16_maj + 2.5; }
  [stylegroup='mainroad'] { line-width: @rdz16_med + 2.5; }
  [stylegroup='minorroad']{ line-width: @rdz16_min + 2; }
  [stylegroup='noauto']   { line-width: @rdz16_min / 5; }
  [stylegroup='railway']  { line-width: @rdz16_min / 2 + 2; }
  [stylegroup='service']{
    [tracktype='grade1'] { line-width: @rdz16_min / 2 + 2; line-color: @primary_line;}
    [tracktype='grade2'] { line-width: @rdz16_min / 2 + 2; }
    [tracktype='grade3'] { line-width: @rdz16_min / 2 + 2; }
    [tracktype='grade4'] { line-width: @rdz16_min / 3 + 2; }
    [tracktype='grade5'] { line-width: @rdz16_min / 3 + 2; }
  }
}


/* This second group (roads) is the "upper" layer of the roads */
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
  [stylegroup='motorway'] { line-width: @rdz16_maj; }
  [stylegroup='mainroad'] { line-width: @rdz16_med; }
  [stylegroup='minorroad']{ line-width: @rdz16_min; }
  [stylegroup='noauto']   { line-width: 0; }
  [stylegroup='railway']  { line-width: @rdz16_min / 2; line-dasharray: 15,15;}
  [stylegroup='service'] {
    [tracktype='grade1'] { line-width: @rdz16_min / 2; line-dasharray: 10,10;}
    [tracktype='grade2'] { line-width: @rdz16_min / 2; }
    [tracktype='grade3'] { line-width: @rdz16_min / 2; }
    [tracktype='grade4'] { line-width: @rdz16_min / 3; }
    [tracktype='grade5'] { line-width: @rdz16_min / 3; }
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

  [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 1; }
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
  marker-width:@rdz16_min * 1.1;
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
