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

#landuse {
  [type='camp_site']     { polygon-pattern-file:url(img/camping.svg); line-width:0.3; line-color: @black;}
  [type='cemetery']      { polygon-pattern-file:url(img/cemetery.svg); line-width:0.3; line-color: @black;}
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-pattern-file:url(img/forest.svg); line-width:0.2; line-color: @darkgray; }
  [type='forest'] [leaf_type='mixed']  { polygon-pattern-file:url(img/forest.svg); line-width:0.3; line-color: @black; }
  [type='forest'] [leaf_type='broadleaved']  { polygon-pattern-file:url(img/forest_bl.svg); line-width:0.3; line-color: @black; }
  [type='forest'] [leaf_type='needleleaved']  { polygon-pattern-file:url(img/forest_nl.svg); line-width:0.3; line-color: @black; }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-pattern-file:url(img/industrial.svg); line-width:0.5; line-color: @gray;}
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='heath']         { polygon-pattern-file:url(img/heath.svg) }
  [type='scrub']         { polygon-pattern-file:url(img/heath.svg) }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-pattern-file:url(img/forest.svg) }
  [type='meadow']        { polygon-pattern-file:url(img/meadow.svg); line-width:0.5; line-color: @gray; }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='orchard']       { polygon-pattern-file:url(img/orchard.svg); line-width:0.5; line-color: @gray; }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
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
  [type='church'] {
    marker-file: url(img/church.svg);
    marker-height: 60;
  }
  [type='chapel'] {
    marker-file: url(img/church.svg);
    marker-height: 40;
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
  [type = 'hedge'] {
      line-color: @green;
      line-width: 4;
      line-dasharray: 3,2;
  }
  [type = 'line'] {
      line-color: @black;
      line-width: 2;
  }
  [type = 'embankment'] {
      line-pattern-file: url(img/embankment.svg);
  }
}


/* ================================================================== */
/* POINT FEATURES
/* ================================================================== */

#point_features {
  [type = 'tower'] {
      marker-file: url(img/tower.svg);
      marker-height: 4;
  }
  [type = 'fountain'] {
      marker-file: url(img/fountain.svg);
      marker-height: 10;
      marker-allow-overlap: true; /* always render */
      text-name:"'Font.'";
      text-face-name:@sans;
      text-placement:point;
      text-fill:@water;
      text-size:@text_size_s;
      text-character-spacing: 2;
      text-line-spacing: 2;
      text-dy: -16;
      text-dx: -5;
  }
}
