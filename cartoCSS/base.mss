/* BASE.MSS CONTENTS
 * - Contour lines
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 *
 */

Map { background-color: @purewhite; }

/* ================================================================== */
/* CONTOUR
/* ================================================================== */

#contour  {
  line-color: @contour;
  line-width: 1.5;
  [main="yes"] {line-width: 3;}
}


/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#landuse {
  [type='camp_site']     { polygon-pattern-file:url(../img/camping.svg); line-width:0.3; line-color: @black;}
  [type='cemetery']      { polygon-pattern-file:url(../img/cemetery.svg); line-width:0.3; line-color: @black;}
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest'], [type='wood'] {
      polygon-fill: @bottle;
      line-width: 0.3;
      line-color: @darkgray;
      polygon-pattern-file:url(../img/forest.svg);
      [leaf_type='broadleaved']  { polygon-pattern-file:url(../img/forest_bl.svg);}
      [leaf_type='needleleaved']  { polygon-pattern-file:url(../img/forest_nl.svg);}
  }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(../img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-pattern-file:url(../img/industrial.svg); line-width:0.5; line-color: @gray;}
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
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='orchard']       { polygon-fill: @green; polygon-pattern-file:url(../img/orchard.svg); line-width:0.5; line-color: @gray; }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    polygon-fill: @green;
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
    polygon-pattern-file:url(../img/wetland.svg);
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
        line-width: 4;
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
