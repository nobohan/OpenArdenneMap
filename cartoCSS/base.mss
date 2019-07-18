/* BASE.MSS CONTENTS
 * - Contour lines
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 *
 */

Map { background-color: @rose; }


/* ================================================================== */
/* MASK
/* ================================================================== */

#mask {

}

/* ================================================================== */
/* GRID
/* ================================================================== */

#grid {
  line-color: @blue;
  line-width: 2	;
}

#grid::label {
  text-face-name: @sans;
  text-size: @text_size_l*2;
  text-fill: @blue;
  text-name: '[col]+[row]';
  text-allow-overlap: true;
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
  [zoom = 17] { line-width: 2; }
  [zoom = 18] { line-width: 2; }
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
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
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
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
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
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-pattern-file: url(../img/cemetery.svg);
    line-color: @black;
  }
  [type='college']       { polygon-fill: @school; line-color: @black; line-width: 2; }
  [type='commercial']    { polygon-fill: @industrial; line-color: @black; line-width: 2; }
  [type='common']        { polygon-fill: @park; line-color: @black; line-width: 2;  }
  [type='forest'], [type='wood'] {
    polygon-fill: @green;
    [zoom <= 10] { line-width: @landuse_line_width*@z10;}
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    line-color: @black;
    [zoom <= 14] { polygon-pattern-file: url(../img/forest_z14.svg); }
    [zoom > 14] { polygon-pattern-file: url(../img/forest.svg); }
    [leaf_type='broadleaved'] {
      [zoom <= 14] { polygon-pattern-file: url(../img/forest_bl_z14.svg); }
      [zoom > 14] { polygon-pattern-file: url(../img/forest_bl.svg); }
    }
    [leaf_type='needleleaved'] {
      [zoom <= 14] { polygon-pattern-file: url(../img/forest_nl_z14.svg); }
      [zoom > 14] { polygon-pattern-file: url(../img/forest_nl.svg); }
    }
  }
  [type='golf_course']   { polygon-fill: @sports; line-color: @black; line-width: 2; }
  [type='grass']         { polygon-pattern-file: url(../img/meadow.svg); line-color: @black; line-width: 2; }
  [type='hospital']      { polygon-fill: @hospital; line-color: @black; line-width: 2; }
  [type='industrial']    {
    [zoom <= 10] { line-width: @landuse_line_width*@z10*2; }
    [zoom = 11] { line-width: @landuse_line_width*@z11*2; }
    [zoom = 12] { line-width: @landuse_line_width*@z12*2; }
    [zoom = 13] { line-width: @landuse_line_width*@z13*2; }
    [zoom = 14] { line-width: @landuse_line_width*@z14*2; }
    [zoom = 15] { line-width: @landuse_line_width*@z15*2; }
    [zoom = 16] { line-width: @landuse_line_width*@z16*2; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19*2; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20*2; }
    polygon-pattern-file: url(../img/industrial.svg);
    line-color: @black;
  }
  [type='park']          { polygon-fill: @park; polygon-pattern-file: url(../img/park.svg); line-color: @black; line-width: 2; }
  [type='parking']       { polygon-fill: @parking; line-color: @black; line-width: 2;  }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; line-color: @black; line-width: 2;}
  [type='pitch']         { polygon-fill: @sports; line-color: @black; line-width: 2;}
  [type='residential']   { polygon-fill: @residential; line-color: @black; line-width: 2; }
  [type='scrub'], [type='heath'] { polygon-pattern-file: url(../img/heath.svg); line-color: @black; line-width: 2; }
  [type='sports_center'] { polygon-fill: @sports; line-color: @black; line-width: 2; }
  [type='stadium']       { polygon-fill: @sports; line-color: @black; line-width: 2; }
  [type='university']    { polygon-fill: @school; line-color: @black; line-width: 2; }
  [type='meadow']        {
    polygon-pattern-file: url(../img/meadow.svg);
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    line-color: @black;
  }
  [type='farmland']      { polygon-fill: @agriculture; line-color: @black; line-width: 2;}
  [type='orchard']       {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-fill: @green;
    polygon-pattern-file: url(../img/orchard.svg);
    line-color: @black;
  }
  [type='farmyard']      { line-color: @black; line-width: 2; }
  [type='school']        { polygon-fill: @school; line-color: @black; line-width: 2; }
  [trees='christmas_trees'], [produce='christmas_trees'] {
    [zoom <= 10] { line-width: @landuse_line_width*@z10; }
    [zoom = 11] { line-width: @landuse_line_width*@z11; }
    [zoom = 12] { line-width: @landuse_line_width*@z12; }
    [zoom = 13] { line-width: @landuse_line_width*@z13; }
    [zoom = 14] { line-width: @landuse_line_width*@z14; }
    [zoom = 15] { line-width: @landuse_line_width*@z15; }
    [zoom = 16] { line-width: @landuse_line_width*@z16; }
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20; }
    polygon-fill: @green;
    polygon-pattern-file: url(../img/christmas_trees.svg);
    line-color: @black;
  }
}

#zoo [name = 'Pairi Daiza'] {
  polygon-pattern-file: url(../img/industrial.svg);
  line-color: @black;
  line-width: @tiny;
  text-name: '[name]';
  text-face-name: @sans;
  text-fill: @black;
  text-transform: uppercase;
  text-character-spacing: 14;
  text-size: @text_size_l;
  text-allow-overlap: false;
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
    [zoom = 17] { line-width: 2; }
    [zoom = 18] { line-width: 2; }
    [zoom = 19] { line-width: @landuse_line_width*@z19*5; }
    [zoom >= 20] { line-width: @landuse_line_width*@z20*5; }
    line-color: @wooded;
    line-dasharray: 1,1;
    polygon-fill: @wooded;
  }
  [type='wetland'] {
    polygon-pattern-file: url(../img/wetland.svg); line-color: @black; line-width: 2;
  }
}


/* ---- BUILDINGS ---- */
#buildings {
  polygon-fill: @building;
  [zoom <= 10] { line-width: @building_line_width*@z10; }
  [zoom = 11] { line-width: @building_line_width*@z11; }
  [zoom = 12] { line-width: @building_line_width*@z12; }
  [zoom = 13] { line-width: @building_line_width*@z13; }
  [zoom = 14] { line-width: @building_line_width*@z14; }
  [zoom = 15] { line-width: @building_line_width*@z15; }
  [zoom = 16] { line-width: @building_line_width*@z16; }
  [zoom = 17] { line-width: 2; }
  [zoom = 18] { line-width: 2; }
  [zoom = 19] { line-width: @building_line_width*@z19; }
  [zoom >= 20] { line-width: @building_line_width*@z20; }

  line-color: @black;
  [zoom <= 18] {
    [type='church'], [type='chapel']{
polygon-fill: @building;
line-color: @black;
      line-width: 2;
      marker-file: url(../img/cross.svg);
      marker-height: @church_marker*1.2;
    }
  }
  /* [type='farm'], [type='farm_auxiliary'], [type='barn']{
  /*  polygon-fill: @marron;
  /*  line-color: @marron;
  /* }
  /* [type='government'], [type='sports_center'], [type='school']{
  /*  polygon-fill: @yellow;
  /*  line-color: @black;
  /* }
  /* [type='commercial'], [type='industrial']{
  /*  polygon-fill: @rouge;
  /*  line-color: @rouge;
  /* } */
}

#rotated_buildings {
  [building='church'] {
      marker-height: @church_marker;
      marker-file: url(../img/cross.svg);
      [osm_id=203802634] { /* Attre */
        marker-transform: rotate(-68);
      }
      [osm_id=677442860] { /* Brugelette */
        marker-transform: rotate(-53);
      }
      [osm_id=321824285] { /* Cambron */
        marker-transform: rotate(-99);
      }
      [osm_id=674066050] { /* Gages */
        marker-transform: rotate(84);
      }
      [osm_id=673210333] { /* Mevergnies */
        marker-transform: rotate(0);
      }
      /*marker-transform: rotate([orientation]);*/
      marker-allow-overlap: false;
   

  }

}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */


#water {
  polygon-fill: @water;
  line-color: @black; line-width: 2;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */


#waterway { [type='river'], [type='stream'], [type='canal'], [type='ditch'], [type='drain'] {
    line-color: @water;
    [type='river'] {
      [zoom <= 10] { line-width: @river_line_width*@z10; }
      [zoom = 11] { line-width: @river_line_width*@z11; }
      [zoom = 12] { line-width: @river_line_width*@z12; }
      [zoom = 13] { line-width: @river_line_width*@z13; }
      [zoom = 14] { line-width: @river_line_width*@z14; }
      [zoom = 15] { line-width: @river_line_width*@z15; }
      [zoom = 16] { line-width: @river_line_width*@z16; }
      [zoom = 17] { line-width: 12; }
      [zoom = 18] { line-width: 12; }
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
      [zoom = 17] { line-width: 6; }
      [zoom = 18] { line-width: 6; }
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
      [zoom = 17] { line-width: 3; }
      [zoom = 18] { line-width: 3; }
      [zoom = 19] { line-width: @river_line_width*@z19/2; }
      [zoom >= 20] { line-width: @river_line_width*@z20/2; }
    }
    /* === HYDRO_ARROW === */
    marker-file: url(../img/arrow.svg);
    marker-height: 2;
    marker-placement: line;
    marker-spacing: 1200;
    [type='river'] { marker-offset: @river_line_width*2.5; }
    [type='stream'] { marker-offset: @river_line_width*1.7; }
    [zoom > 17] {
      marker-spacing: 1400;
      marker-offset: @river_line_width*3;
    }
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
  [zoom = 17] { line-width: 8; }
  [zoom = 18] { line-width: 8; }
  [zoom = 19] { line-width: @river_line_width*@z19 * 0.7; }
  [zoom >= 20] { line-width: @river_line_width*@z20 * 0.7; }
  line-color: @water;
}


#hillshade {
    raster-opacity: 1;
    raster-comp-op: grain-merge;
}

/* ================================================================== */
/* BOUNDARIES

/* ================================================================== */
#boundaries::offset [admin_level='8'][name='Brugelette'] {
  line-color: @rouge;
  line-offset: 14;
  line-width: 34;
  line-cap: round;
  line-join: round;
}

#boundaries [admin_level='8'] {
  line-color: @admin;
  line-dasharray: 10, 10;
  [zoom <= 10] { line-width: @mini*@z10; }
  [zoom = 11] { line-width: @mini*@z11; }
  [zoom = 12] { line-width: @mini*@z12; }
  [zoom = 13] { line-width: @mini*@z13; }
  [zoom = 14] { line-width: @mini*@z14; }
  [zoom = 15] { line-width: @mini*@z15; }
  [zoom = 16] { line-width: @mini*@z16; }
  [zoom = 17] { line-width: 6; }
  [zoom = 18] { line-width: 6; }
  [zoom = 19] { line-width: @mini*@z19; }
  [zoom >= 20] { line-width: @mini*@z20; }
}


/******************************************************************* */


