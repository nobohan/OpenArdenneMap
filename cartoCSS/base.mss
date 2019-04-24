/* BASE.MSS CONTENTS
 * - Contour lines
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 *
 */

Map { background-color: @purewhite; }


/* ================================================================== */
/* MASK
/* ================================================================== */

#mask {
  polygon-fill: @purewhite;
  polygon-opacity: 0.8;
}


/* ================================================================== */
/* CONTOUR
/* ================================================================== */

#contour {
  line-color: @contour;
  [zoom <= 10] { line-width: 0; }
  [zoom = 11] { line-width: 0; }
  [zoom = 12] { line-width: 0; }
  [zoom = 13] { line-width: 0; }
  [zoom = 14] { line-width: @contour_minor_line_width*@z14; }
  [zoom = 15] { line-width: @contour_minor_line_width*@z15; }
  [zoom = 16] { line-width: @contour_minor_line_width*@z16; }
  [zoom = 17] { line-width: @contour_minor_line_width*@z17; }
  [zoom = 18] { line-width: @contour_minor_line_width*@z18; }
  [zoom = 19] { line-width: @contour_minor_line_width*@z19; }
  [zoom >= 20] { line-width: @contour_minor_line_width*@z20; }
  [main="yes"] {
    [zoom <= 10] { line-width: 0; }
    [zoom = 11] { line-width: 0; }
    [zoom = 12] { line-width: @contour_major_line_width*@z12; }
    [zoom = 13] { line-width: @contour_major_line_width*@z13; }
    [zoom = 14] { line-width: @contour_major_line_width*@z14; }
    [zoom = 15] { line-width: @contour_major_line_width*@z15; }
    [zoom = 16] { line-width: @contour_major_line_width*@z16; }
    [zoom = 17] { line-width: @contour_major_line_width*@z17; }
    [zoom = 18] { line-width: @contour_major_line_width*@z18; }
    [zoom = 19] { line-width: @contour_major_line_width*@z19; }
    [zoom >= 20] { line-width: @contour_major_line_width*@z20; }
    }
}


/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#landuse {
  [type='camp_site'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-pattern-file: url(../img/camping.svg);
    line-color: @black;
  }
  [type='cemetery'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-pattern-file: url(../img/cemetery.svg);
    line-color: @black;
  }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest'], [type='wood'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10;}
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-fill: @green;
    line-color: @darkgray;

    [zoom <= 14] { polygon-pattern-file: url(../img/forest_z14.svg); }
    [zoom > 14] { polygon-pattern-file: url(../img/forest.svg); }
    [leaf_type='broadleaved'] {
      [zoom <= 14] { polygon-pattern-file: url(../img/forest_bl_z14.svg); }
      [zoom > 14] {
        polygon-pattern-file: url(../img/forest_bl.svg);
        [area > 200000] {
          line-pattern-file: url(../img/forest-border.svg);
          line-pattern-offset: -10;
        }
      }
    }
    [leaf_type='needleleaved'] {
      [zoom <= 14] { polygon-pattern-file: url(../img/forest_nl_z14.svg); }
      [zoom > 14] { polygon-pattern-file: url(../img/forest_nl.svg); }
    }
  }
  [type='golf_course']   { polygon-fill: @sports; }
  [type='grass']         { polygon-pattern-file: url(../img/meadow.svg); }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    {
    [zoom <= 10] { line-width: @landuse_line_width*@z10*2; }
    [zoom = 11] { line-width: @landuse_line_width*@z11*2; }
    [zoom = 12] { line-width: @landuse_line_width*@z12*2; }
    [zoom = 13] { line-width: @landuse_line_width*@z13*2; }
    [zoom = 14] { line-width: @landuse_line_width*@z14*2; }
    [zoom = 15] { line-width: @landuse_line_width*@z15*2; }
    [zoom = 16] { line-width: @landuse_line_width*@z16*2; }
    [zoom = 17] { line-width: @landuse_line_width*@z17*2; }
    [zoom = 18] { line-width: @landuse_line_width*@z18*2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19*2; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20*2; }
    polygon-pattern-file: url(../img/industrial.svg);
    line-color: @gray;
  }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='scrub'], [type='heath'] { polygon-pattern-file: url(../img/heath.svg) }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='meadow']        {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-pattern-file: url(../img/meadow.svg);
    line-color: @gray;
  }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='orchard']       {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-fill: @green;
    polygon-pattern-file: url(../img/orchard.svg);
    line-color: @gray;
  }
  [type='farmyard']      { line-color: @farmyard; }
  [type='school']        { polygon-fill: @school; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: @landuse_line_width*@z17; }
    [zoom = 18] { line-width: @landuse_line_width*@z18; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-fill: @green;
    polygon-pattern-file: url(../img/christmas_trees.svg);
    line-color: @gray;
  }
}

#landuse_overlays {
  [type='nature_reserve'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10*5; }
    [zoom = 11] { line-width: @landuse_line_width*@z11*5; }
    [zoom = 12] { line-width: @landuse_line_width*@z12*5; }
    [zoom = 13] { line-width: @landuse_line_width*@z13*5; }
    [zoom = 14] { line-width: @landuse_line_width*@z14*5; }
    [zoom = 15] { line-width: @landuse_line_width*@z15*5; }
    [zoom = 16] { line-width: @landuse_line_width*@z16*5; }
    [zoom = 17] { line-width: @landuse_line_width*@z17*5; }
    [zoom = 18] { line-width: @landuse_line_width*@z18*5; }
    [zoom = 19] { line-width: @landuse_line_width*@z19*5; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20*5; }
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
  [zoom <= 10] { line-width: @building_line_width*@z10; }
  [zoom = 11] { line-width: @building_line_width*@z11; }
  [zoom = 12] { line-width: @building_line_width*@z12; }
  [zoom = 13] { line-width: @building_line_width*@z13; }
  [zoom = 14] { line-width: @building_line_width*@z14; }
  [zoom = 15] { line-width: @building_line_width*@z15; }
  [zoom = 16] { line-width: @building_line_width*@z16; }
  [zoom = 17] { line-width: @building_line_width*@z17; }
  [zoom = 18] { line-width: @building_line_width*@z18; }
  [zoom = 19] { line-width: @building_line_width*@z19; }
  [zoom >= 20] { line-width: @building_line_width*@z20; }
  polygon-fill: @building;
  line-color: darken(@building,10%);
  [type='church'], [type='chapel']{
    polygon-fill: @violet;
    line-color: @gray;
  }
  [type='farm'], [type='farm_auxiliary'], [type='barn']{
    polygon-fill: @brown;
    line-color: darken(@brown,10%);
  }
  [type='government'], [type='sports_center'], [type='school']{
    polygon-fill: @yellow;
    line-color: @gray;
  }
  [type='commercial'], [type='industrial']{
    polygon-fill: @red;
    line-color: darken(@red,70%);
  }
}

#rotated_buildings {
  [building='church'] {
    [zoom <= 10] { marker-height: @church_marker*@z10; }
    [zoom = 11] { marker-height: @church_marker*@z11; }
    [zoom = 12] { marker-height: @church_marker*@z12; }
    [zoom = 13] { marker-height: @church_marker*@z13; }
    [zoom = 14] { marker-height: @church_marker*@z14; }
    [zoom = 15] { marker-height: @church_marker*@z15; }
    [zoom = 16] { marker-height: @church_marker*@z16; }
    [zoom = 17] { marker-height: @church_marker*@z17; }
    [zoom = 18] { marker-height: @church_marker*@z18; }
    [zoom = 19] { marker-height: @church_marker*@z19; }
    [zoom >= 20] { marker-height: @church_marker*@z20; }
    marker-file: url(../img/church.svg);
    marker-transform: rotate([orientation]);
    marker-allow-overlap: true;
  }
  [building='chapel'] {
    [zoom <= 10] { marker-height: @church_marker*@z10*0.6; }
    [zoom = 11] { marker-height: @church_marker*@z11*0.6; }
    [zoom = 12] { marker-height: @church_marker*@z12*0.6; }
    [zoom = 13] { marker-height: @church_marker*@z13*0.6; }
    [zoom = 14] { marker-height: @church_marker*@z14*0.6; }
    [zoom = 15] { marker-height: @church_marker*@z15*0.6; }
    [zoom = 16] { marker-height: @church_marker*@z16*0.6; }
    [zoom = 17] { marker-height: @church_marker*@z17*0.6; }
    [zoom = 18] { marker-height: @church_marker*@z18*0.6; }
    [zoom = 19] { marker-height: @church_marker*@z19*0.6; }
    [zoom >= 20] { marker-height: @church_marker*@z20*0.6; }
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
      [zoom <= 10] { line-width: @river_line_width*@z10; }
      [zoom = 11] { line-width: @river_line_width*@z11; }
      [zoom = 12] { line-width: @river_line_width*@z12; }
      [zoom = 13] { line-width: @river_line_width*@z13; }
      [zoom = 14] { line-width: @river_line_width*@z14; }
      [zoom = 15] { line-width: @river_line_width*@z15; }
      [zoom = 16] { line-width: @river_line_width*@z16; }
      [zoom = 17] { line-width: @river_line_width*@z17; }
      [zoom = 18] { line-width: @river_line_width*@z18; }
      [zoom = 19] { line-width: @river_line_width*@z19; }
      [zoom >= 20] { line-width: @river_line_width*@z20; }
      line-cap: round;
      line-join: round;
    }
    [type='stream'], [type='canal'] {
      [zoom <= 10] { line-width: @stream_line_width*@z10; }
      [zoom = 11] { line-width: @stream_line_width*@z11; }
      [zoom = 12] { line-width: @stream_line_width*@z12; }
      [zoom = 13] { line-width: @stream_line_width*@z13; }
      [zoom = 14] { line-width: @stream_line_width*@z14; }
      [zoom = 15] { line-width: @stream_line_width*@z15; }
      [zoom = 16] { line-width: @stream_line_width*@z16; }
      [zoom = 17] { line-width: @stream_line_width*@z17; }
      [zoom = 18] { line-width: @stream_line_width*@z18; }
      [zoom = 19] { line-width: @stream_line_width*@z19; }
      [zoom >= 20] { line-width: @stream_line_width*@z20; }
    }
    [type='ditch'], [type='drain'] {
      [zoom <= 10] { line-width: @river_line_width*@z10/2; }
      [zoom = 11] { line-width: @river_line_width*@z11/2; }
      [zoom = 12] { line-width: @river_line_width*@z12/2; }
      [zoom = 13] { line-width: @river_line_width*@z13/2; }
      [zoom = 14] { line-width: @river_line_width*@z14/2; }
      [zoom = 15] { line-width: @river_line_width*@z15/2; }
      [zoom = 16] { line-width: @river_line_width*@z16/2; }
      [zoom = 17] { line-width: @river_line_width*@z17/2; }
      [zoom = 18] { line-width: @river_line_width*@z18/2; }
      [zoom = 19] { line-width: @river_line_width*@z19/2; }
      [zoom >= 20] { line-width: @river_line_width*@z20/2; }
    }
    /* === HYDRO_ARROW === */
    /* marker-file: url(../img/arrow-hydro.png);
    /* marker-height: 12;
    /* marker-placement: line;
    /* marker-spacing: 700;
    /* marker-offset: @river_line_width*1.7; */
  }
}

#waterway::top [type='river'] {
  [zoom <= 10] { line-width: @river_line_width*@z10 * 0.7; }
  [zoom = 11] { line-width: @river_line_width*@z11 * 0.7; }
  [zoom = 12] { line-width: @river_line_width*@z12 * 0.7; }
  [zoom = 13] { line-width: @river_line_width*@z13 * 0.7; }
  [zoom = 14] { line-width: @river_line_width*@z14 * 0.7; }
  [zoom = 15] { line-width: @river_line_width*@z15 * 0.7; }
  [zoom = 16] { line-width: @river_line_width*@z16 * 0.7; }
  [zoom = 17] { line-width: @river_line_width*@z17 * 0.7; }
  [zoom = 18] { line-width: @river_line_width*@z18 * 0.7; }
  [zoom = 19] { line-width: @river_line_width*@z19 * 0.7; }
  [zoom >= 20] { line-width: @river_line_width*@z20 * 0.7; }
  line-color: @water;
}
