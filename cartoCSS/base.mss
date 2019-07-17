/* BASE.MSS CONTENTS
 * - Contour lines
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 *
 */

Map { background-color: @white; }

/* ================================================================== */
/* CONTOUR
/* ================================================================== */

#contour  {
  line-color: @contour;
  line-width: 1;
  [main="yes"] {line-width: 2;}
}


/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#landuse::base {
  [type='camp_site']     { polygon-pattern-file: url(../img/camping.svg); line-width:0.3; line-color: @black;}
  [type='cemetery']      { polygon-pattern-file: url(../img/cemetery.svg); line-width:0.3; line-color: @black;}
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest'], [type='wood'] {
      polygon-fill: @bottle;
      line-width: 0.3;
      line-color: @darkgray;
      polygon-pattern-file: url(../img/forest.svg);
      [leaf_type='broadleaved']  { polygon-pattern-file: url(../img/forest_bl.svg);}
      [leaf_type='needleleaved']  { polygon-pattern-file: url(../img/forest_nl.svg);}
  }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file: url(../img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-pattern-file: url(../img/industrial.svg); line-width:0.5; line-color: @gray;}
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='scrub'], [type='heath'] { polygon-pattern-file:url(../img/heath.svg) }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='meadow']        { polygon-pattern-file:url(../img/meadow.svg); line-width:0.5; line-color: @gray; }
  [type='farmland']      {
      [orientation < 10 ] { polygon-pattern-file: url(../img/pattern.svg); }
      [orientation > 10 ] { polygon-pattern-file: url(../img/pattern-10.svg); }
      [orientation > 20 ] { polygon-pattern-file: url(../img/pattern-20.svg); }
      [orientation > 40 ] { polygon-pattern-file: url(../img/pattern-40.svg); }
      [orientation > 60 ] { polygon-pattern-file: url(../img/pattern-60.svg); }
      [orientation > 80 ] { polygon-pattern-file: url(../img/pattern-80.svg); }
      [orientation > 90 ] { polygon-pattern-file: url(../img/pattern-90.svg); }
      [orientation > 110 ] { polygon-pattern-file: url(../img/pattern-20.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 130 ] { polygon-pattern-file: url(../img/pattern-40.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 150 ] { polygon-pattern-file: url(../img/pattern-60.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 170 ] { polygon-pattern-file: url(../img/pattern-80.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 180 ] { polygon-pattern-file: url(../img/pattern-90.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 200 ] { polygon-pattern-file: url(../img/pattern-20.svg); }
      [orientation > 220 ] { polygon-pattern-file: url(../img/pattern-40.svg); }
      [orientation > 240 ] { polygon-pattern-file: url(../img/pattern-60.svg); }
      [orientation > 260 ] { polygon-pattern-file: url(../img/pattern-80.svg); }
      [orientation > 270 ] { polygon-pattern-file: url(../img/pattern-90.svg); }
      [orientation > 280 ] { polygon-pattern-file: url(../img/pattern-20.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 310 ] { polygon-pattern-file: url(../img/pattern-40.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 330 ] { polygon-pattern-file: url(../img/pattern-60.svg); polygon-pattern-transform: "rotate(90)"}
      [orientation > 340 ] { polygon-pattern-file: url(../img/pattern-90.svg); polygon-pattern-transform: "rotate(90)"}
      polygon-pattern-file: url(../img/pattern.svg);
      line-width: 0.5;
      line-color: @gray;
      /*text-name: [orientation];*/
      /*text-face-name: @sans;*/
      /*text-size: @text_size_s;*/
      /*text-fill: @black;*/
      /*polygon-pattern-transform: "rotate([orientation]) scale(2) skewX(45)";*/
  }
  [type='orchard']       { polygon-pattern-file:url(../img/orchard.svg); line-width:0.5; line-color: @gray; }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    polygon-fill: @bottle;
    polygon-pattern-file: url(../img/christmas_trees.svg);
    line-width: 0.5;
    line-color: @gray;
  }
}


#landuse_overlays {
  [type='nature_reserve'] {
    line-color: darken(@wooded,25%);
    line-opacity:  0.3;
    line-dasharray: 1,1;
    polygon-fill: darken(@wooded,25%);
    polygon-opacity: 0.1;
    line-width: 2.0;
  }
  [type='wetland'] {
    polygon-pattern-file: url(../img/wetland.svg);
  }
}


/* ---- BUILDINGS ---- */
#buildings {
  polygon-fill:@building;
  line-color:darken(@building,10%);
  line-width:0.4;
}

#rotated_buildings {
  [building='church'] {
    marker-file: url(../img/church.svg);
    marker-height: 40;
    marker-transform: rotate([orientation]);
    marker-allow-overlap: true;
  }
  [building='chapel'] {
    marker-file: url(../img/church.svg);
    marker-height: 25;
    marker-transform: rotate([orientation]);
  }
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */


#water {
  polygon-fill: @water;
  line-color: @darkblue;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */


#waterway { [type='river'], [type='stream'], [type='canal'], [type='ditch'], [type='drain'] {
    line-color: @blue;
    [type='river']
        {
        line-cap: round;
        line-join: round;
        line-width: 12;
        }
    [type='stream'], [type='canal'] {
        line-width: 6;
        }
    [type='ditch'], [type='drain'] {
        line-width: 2;
        }
    }
}

#waterway::top [type='river'] {
  line-width: 8;
  line-color: @water;
}
