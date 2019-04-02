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
  [zoom <= 10] { line-width: @contour_minor_line_width_z10; }
  [zoom = 11] { line-width: @contour_minor_line_width_z11; }
  [zoom = 12] { line-width: @contour_minor_line_width_z12; }
  [zoom = 13] { line-width: @contour_minor_line_width_z13; }
  [zoom = 14] { line-width: @contour_minor_line_width_z14; }
  [zoom = 15] { line-width: @contour_minor_line_width_z15; }
  [zoom = 16] { line-width: @contour_minor_line_width_z16; }
  [zoom = 17] { line-width: @contour_minor_line_width_z17; }
  [zoom = 18] { line-width: @contour_minor_line_width_z18; }
  [zoom = 19] { line-width: @contour_minor_line_width_z19; }
  [zoom >= 20] { line-width: @contour_minor_line_width_z20; }
  [main="yes"] {
    [zoom <= 10] { line-width: @contour_major_line_width_z10; }
    [zoom = 11] { line-width: @contour_major_line_width_z11; }
    [zoom = 12] { line-width: @contour_major_line_width_z12; }
    [zoom = 13] { line-width: @contour_major_line_width_z13; }
    [zoom = 14] { line-width: @contour_major_line_width_z14; }
    [zoom = 15] { line-width: @contour_major_line_width_z15; }
    [zoom = 16] { line-width: @contour_major_line_width_z16; }
    [zoom = 17] { line-width: @contour_major_line_width_z17; }
    [zoom = 18] { line-width: @contour_major_line_width_z18; }
    [zoom = 19] { line-width: @contour_major_line_width_z19; }
    [zoom >= 20] { line-width: @contour_major_line_width_z20; }
    }
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
    [zoom <= 10] { line-width: @landuse_line_width_z10; }
    [zoom = 11] { line-width: @landuse_line_width_z11; }
    [zoom = 12] { line-width: @landuse_line_width_z12; }
    [zoom = 13] { line-width: @landuse_line_width_z13; }
    [zoom = 14] { line-width: @landuse_line_width_z14; }
    [zoom = 15] { line-width: @landuse_line_width_z15; }
    [zoom = 16] { line-width: @landuse_line_width_z16; }
    [zoom = 17] { line-width: @landuse_line_width_z17; }
    [zoom = 18] { line-width: @landuse_line_width_z18; }
    [zoom = 19] { line-width: @landuse_line_width_z19; }
    [zoom >= 20] { line-width: @landuse_line_width_z20; }
    polygon-fill: @green;
    line-color: @darkgray;
    polygon-pattern-file: url(../img/forest.svg);
    [leaf_type='broadleaved']  { polygon-pattern-file: url(../img/forest_bl.svg);}
    [leaf_type='needleleaved']  { polygon-pattern-file: url(../img/forest_nl.svg);}
  }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file:url(../img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    {
    [zoom <= 10] { line-width: @landuse_line_width_z10*2; }
    [zoom = 11] { line-width: @landuse_line_width_z11*2; }
    [zoom = 12] { line-width: @landuse_line_width_z12*2; }
    [zoom = 13] { line-width: @landuse_line_width_z13*2; }
    [zoom = 14] { line-width: @landuse_line_width_z14*2; }
    [zoom = 15] { line-width: @landuse_line_width_z15*2; }
    [zoom = 16] { line-width: @landuse_line_width_z16*2; }
    [zoom = 17] { line-width: @landuse_line_width_z17*2; }
    [zoom = 18] { line-width: @landuse_line_width_z18*2; }
    [zoom = 19] { line-width: @landuse_line_width_z19*2; }
    [zoom >= 20] { line-width: @landuse_line_width_z20*2; }
    polygon-pattern-file: url(../img/industrial.svg);
    line-color: @gray;
  }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='scrub'], [type='heath'] { polygon-pattern-file:url(../img/heath.svg) }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='meadow']        {
    [zoom <= 10] { line-width: @landuse_line_width_z10; }
    [zoom = 11] { line-width: @landuse_line_width_z11; }
    [zoom = 12] { line-width: @landuse_line_width_z12; }
    [zoom = 13] { line-width: @landuse_line_width_z13; }
    [zoom = 14] { line-width: @landuse_line_width_z14; }
    [zoom = 15] { line-width: @landuse_line_width_z15; }
    [zoom = 16] { line-width: @landuse_line_width_z16; }
    [zoom = 17] { line-width: @landuse_line_width_z17; }
    [zoom = 18] { line-width: @landuse_line_width_z18; }
    [zoom = 19] { line-width: @landuse_line_width_z19; }
    [zoom >= 20] { line-width: @landuse_line_width_z20; }
    polygon-pattern-file: url(../img/meadow.svg);
    line-color: @gray;
  }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='orchard']       { polygon-fill: @green; polygon-pattern-file:url(../img/orchard.svg); line-width: @landuse_line_width; line-color: @gray; }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    [zoom <= 10] { line-width: @landuse_line_width_z10; }
    [zoom = 11] { line-width: @landuse_line_width_z11; }
    [zoom = 12] { line-width: @landuse_line_width_z12; }
    [zoom = 13] { line-width: @landuse_line_width_z13; }
    [zoom = 14] { line-width: @landuse_line_width_z14; }
    [zoom = 15] { line-width: @landuse_line_width_z15; }
    [zoom = 16] { line-width: @landuse_line_width_z16; }
    [zoom = 17] { line-width: @landuse_line_width_z17; }
    [zoom = 18] { line-width: @landuse_line_width_z18; }
    [zoom = 19] { line-width: @landuse_line_width_z19; }
    [zoom >= 20] { line-width: @landuse_line_width_z20; }
    polygon-fill: @green;
    polygon-pattern-file: url(../img/christmas_trees.svg);
    line-color: @gray;
  }
}

#landuse_overlays {
  [type='nature_reserve'] {
    [zoom <= 10] { line-width: @landuse_line_width_z10*5; }
    [zoom = 11] { line-width: @landuse_line_width_z11*5; }
    [zoom = 12] { line-width: @landuse_line_width_z12*5; }
    [zoom = 13] { line-width: @landuse_line_width_z13*5; }
    [zoom = 14] { line-width: @landuse_line_width_z14*5; }
    [zoom = 15] { line-width: @landuse_line_width_z15*5; }
    [zoom = 16] { line-width: @landuse_line_width_z16*5; }
    [zoom = 17] { line-width: @landuse_line_width_z17*5; }
    [zoom = 18] { line-width: @landuse_line_width_z18*5; }
    [zoom = 19] { line-width: @landuse_line_width_z19*5; }
    [zoom >= 20] { line-width: @landuse_line_width_z20*5; }
    line-color: darken(@wooded,25%);
    line-opacity: 0.3;
    line-dasharray: 1,1;
    polygon-fill: darken(@wooded,25%);
    polygon-opacity: 0.1;
  }
  [type='wetland'] {
    polygon-pattern-file: url(../img/wetland.svg);
  }
}


/* ---- BUILDINGS ---- */
#buildings {
  [zoom <= 10] { line-width: @building_line_width_z10; }
  [zoom = 11] { line-width: @building_line_width_z11; }
  [zoom = 12] { line-width: @building_line_width_z12; }
  [zoom = 13] { line-width: @building_line_width_z13; }
  [zoom = 14] { line-width: @building_line_width_z14; }
  [zoom = 15] { line-width: @building_line_width_z15; }
  [zoom = 16] { line-width: @building_line_width_z16; }
  [zoom = 17] { line-width: @building_line_width_z17; }
  [zoom = 18] { line-width: @building_line_width_z18; }
  [zoom = 19] { line-width: @building_line_width_z19; }
  [zoom >= 20] { line-width: @building_line_width_z20; }
  polygon-fill: @building;
  line-color: darken(@building,10%);
}

#rotated_buildings {
  [building='church'] {
    [zoom <= 10] { marker-height: @church_marker_z10; }
    [zoom = 11] { marker-height: @church_marker_z11; }
    [zoom = 12] { marker-height: @church_marker_z12; }
    [zoom = 13] { marker-height: @church_marker_z13; }
    [zoom = 14] { marker-height: @church_marker_z14; }
    [zoom = 15] { marker-height: @church_marker_z15; }
    [zoom = 16] { marker-height: @church_marker_z16; }
    [zoom = 17] { marker-height: @church_marker_z17; }
    [zoom = 18] { marker-height: @church_marker_z18; }
    [zoom = 19] { marker-height: @church_marker_z19; }
    [zoom >= 20] { marker-height: @church_marker_z20; }
    marker-file: url(../img/church.svg);
    marker-transform: rotate([orientation]);
    marker-allow-overlap: true;
  }
  [building='chapel'] {
    [zoom <= 10] { marker-height: @church_marker_z10*0.6; }
    [zoom = 11] { marker-height: @church_marker_z11*0.6; }
    [zoom = 12] { marker-height: @church_marker_z12*0.6; }
    [zoom = 13] { marker-height: @church_marker_z13*0.6; }
    [zoom = 14] { marker-height: @church_marker_z14*0.6; }
    [zoom = 15] { marker-height: @church_marker_z15*0.6; }
    [zoom = 16] { marker-height: @church_marker_z16*0.6; }
    [zoom = 17] { marker-height: @church_marker_z17*0.6; }
    [zoom = 18] { marker-height: @church_marker_z18*0.6; }
    [zoom = 19] { marker-height: @church_marker_z19*0.6; }
    [zoom >= 20] { marker-height: @church_marker_z20*0.6; }
    marker-file: url(../img/church.svg);
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
    [type='river'] {
      [zoom <= 10] { line-width: @river_line_width_z10; }
      [zoom = 11] { line-width: @river_line_width_z11; }
      [zoom = 12] { line-width: @river_line_width_z12; }
      [zoom = 13] { line-width: @river_line_width_z13; }
      [zoom = 14] { line-width: @river_line_width_z14; }
      [zoom = 15] { line-width: @river_line_width_z15; }
      [zoom = 16] { line-width: @river_line_width_z16; }
      [zoom = 17] { line-width: @river_line_width_z17; }
      [zoom = 18] { line-width: @river_line_width_z18; }
      [zoom = 19] { line-width: @river_line_width_z19; }
      [zoom >= 20] { line-width: @river_line_width_z20; }
      line-cap: round;
      line-join: round;
    }
    [type='stream'], [type='canal'] {
      [zoom <= 10] { line-width: @stream_line_width_z10; }
      [zoom = 11] { line-width: @stream_line_width_z11; }
      [zoom = 12] { line-width: @stream_line_width_z12; }
      [zoom = 13] { line-width: @stream_line_width_z13; }
      [zoom = 14] { line-width: @stream_line_width_z14; }
      [zoom = 15] { line-width: @stream_line_width_z15; }
      [zoom = 16] { line-width: @stream_line_width_z16; }
      [zoom = 17] { line-width: @stream_line_width_z17; }
      [zoom = 18] { line-width: @stream_line_width_z18; }
      [zoom = 19] { line-width: @stream_line_width_z19; }
      [zoom >= 20] { line-width: @stream_line_width_z20; }
    }
    [type='ditch'], [type='drain'] {
      [zoom <= 10] { line-width: @river_line_width_z10/2; }
      [zoom = 11] { line-width: @river_line_width_z11/2; }
      [zoom = 12] { line-width: @river_line_width_z12/2; }
      [zoom = 13] { line-width: @river_line_width_z13/2; }
      [zoom = 14] { line-width: @river_line_width_z14/2; }
      [zoom = 15] { line-width: @river_line_width_z15/2; }
      [zoom = 16] { line-width: @river_line_width_z16/2; }
      [zoom = 17] { line-width: @river_line_width_z17/2; }
      [zoom = 18] { line-width: @river_line_width_z18/2; }
      [zoom = 19] { line-width: @river_line_width_z19/2; }
      [zoom >= 20] { line-width: @river_line_width_z20/2; }
    }
  }
}

#waterway::top [type='river'] {
  [zoom <= 10] { line-width: @river_line_width_z10 * 0.7; }
  [zoom = 11] { line-width: @river_line_width_z11 * 0.7; }
  [zoom = 12] { line-width: @river_line_width_z12 * 0.7; }
  [zoom = 13] { line-width: @river_line_width_z13 * 0.7; }
  [zoom = 14] { line-width: @river_line_width_z14 * 0.7; }
  [zoom = 15] { line-width: @river_line_width_z15 * 0.7; }
  [zoom = 16] { line-width: @river_line_width_z16 * 0.7; }
  [zoom = 17] { line-width: @river_line_width_z17 * 0.7; }
  [zoom = 18] { line-width: @river_line_width_z18 * 0.7; }
  [zoom = 19] { line-width: @river_line_width_z19 * 0.7; }
  [zoom >= 20] { line-width: @river_line_width_z20 * 0.7; }
  line-color: @water;
}
