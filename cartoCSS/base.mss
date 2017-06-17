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
  line-color: #b06435;
}

#landuse {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-pattern-file:url(img/forest.png); line-color: darken(@wooded,25%); }
  [type='forest'] [leaf_type='mixed']  { polygon-pattern-file:url(img/forest.png); line-color: darken(@wooded,25%); }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(img/meadow.png); line-color: darken(@land,25%); }
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
  [type='wood']          { polygon-pattern-file:url(img/forest.png); line-color: darken(@wooded,25%); }
  [type='meadow']        { polygon-pattern-file:url(img/meadow.png); line-color: darken(@land,25%); }
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
  polygon-pattern-file:url(img/marsh-32.png);
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
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    line-width: 6;
  }
  [type='stream'] {
    line-width: 2;
  }
  [type='ditch'],
  [type='drain'] {
    line-width: 1;
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
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5%);

}
