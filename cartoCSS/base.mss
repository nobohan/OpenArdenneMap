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

  [zoom <= 10]{ line-width: @contour_minor_line_width_z10; }
  [zoom = 11]{ line-width: @contour_minor_line_width_z11; }
  [zoom = 12]{ line-width: @contour_minor_line_width_z12; }
  [zoom = 13]{ line-width: @contour_minor_line_width_z13; }
  [zoom = 14]{ line-width: @contour_minor_line_width_z14; }
  [zoom = 15]{ line-width: @contour_minor_line_width_z15; }
  [zoom = 16]{ line-width: @contour_minor_line_width_z16; }
  [zoom = 17]{ line-width: @contour_minor_line_width_z17; }
  [zoom = 18]{ line-width: @contour_minor_line_width_z18; }
  [zoom > 18] {line-width: @contour_minor_line_width; }
  [main="yes"] { line-width: @contour_major_line_width; }
}


/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#landuse {
  [type='camp_site']     { polygon-pattern-file:url(../img/camping.svg); line-width: @landuse_line_width; line-color: @black;}
  [type='cemetery']      { polygon-pattern-file:url(../img/cemetery.svg); line-width: @landuse_line_width; line-color: @black;}
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest'], [type='wood'] {
      polygon-fill: @green;
      line-width: 0.3;
      line-color: @darkgray;
      polygon-pattern-file:url(../img/forest.svg);
      [leaf_type='broadleaved']  { polygon-pattern-file:url(../img/forest_bl.svg);}
      [leaf_type='needleleaved']  { polygon-pattern-file:url(../img/forest_nl.svg);}
  }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(../img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-pattern-file:url(../img/industrial.svg); line-width: @landuse_line_width*2; line-color: @gray;}
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='scrub'], [type='heath'] { polygon-pattern-file:url(../img/heath.svg) }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='meadow']        { polygon-pattern-file:url(../img/meadow.svg); line-width: @landuse_line_width; line-color: @gray; }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='orchard']       { polygon-fill: @green; polygon-pattern-file:url(../img/orchard.svg); line-width: @landuse_line_width; line-color: @gray; }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    polygon-fill: @green;
    polygon-pattern-file: url(../img/christmas_trees.svg);
    line-width: @landuse_line_width;
    line-color: @gray;
  }
}

#landuse_overlays {
  [type='nature_reserve'] {
    line-color: darken(@wooded,25%);
    line-opacity: 0.3;
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
  polygon-fill: @building;
  line-color: darken(@building,10%);
  line-width: @building_line_width;
}

#rotated_buildings {
  [building='church'] {
    marker-file: url(../img/church.svg);
    marker-height: @church_marker;
    marker-transform: rotate([orientation]);
    marker-allow-overlap: true;
  }
  [building='chapel'] {
    marker-file: url(../img/church.svg);
    marker-height: @church_marker*0.625;
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
    line-color: @darkblue;
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
