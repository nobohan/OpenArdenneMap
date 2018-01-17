/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

Map { background-color: @land; }

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#contour {
  line-color: @contour;
}

#hillshade {
  opacity: 0.8;
}

#landuse {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-pattern-file:url(img/forest.svg) }
  [type='forest'] [leaf_type='mixed']  { polygon-pattern-file:url(img/forest.svg) }
  [type='forest'] [leaf_type='broadleaved']  { polygon-pattern-file:url(img/forest_bl.svg) }
  [type='forest'] [leaf_type='needleleaved']  { polygon-pattern-file:url(img/forest_nl.svg) }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-pattern-file:url(img/industrial.png); }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-pattern-file:url(img/forest.svg) }
  [type='meadow']        { polygon-pattern-file:url(img/meadow.svg); line-width:0.5; line-color: @gray; }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='farmyard']      { line-color: @farmyard; }
}

#landuse_overlays[type='nature_reserve'] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  line-width: 2.0;
}

#landuse_overlays[type='wetland'] {
  polygon-pattern-file:url(img/wetland.svg);
  }

/* ---- BUILDINGS ---- */
#buildings {
  polygon-fill:@building;
  line-color:darken(@building,10%);
  line-width:0.4;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */


#water {
  polygon-fill: @water;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_high {
  line-color: @darkblue;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    line-width: 12;
  }
  [type='stream'] {
    line-width: 6;
  }
  [type='ditch'],
  [type='drain'] {
    line-width: 2;
  }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin[admin_level='2'] {
  line-color:@admin_2;
  line-width:0.5;
  line-opacity: 0.4;
}


/* ================================================================== */
/* LINEAR FEATURES
/* ================================================================== */

#linear_features {
  line-width: 4;
  line-dasharray: 3,2;
  [type = 'hedge'] {line-color: @green;}
  [type = 'embankment'] {line-color: #222;}
}
