/* BASE.MSS CONTENTS
 * - Contour lines
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 *
 */

Map { background-color: @background; }

/* ================================================================== */
/* CONTOUR
/* ================================================================== */

#contour  {
    line-color: @contour;
    [zoom <= 14] { line-width: 0; }
    [zoom = 15] { line-width: @contour_minor_line_width*@z15_contour; }
    [zoom = 16] { line-width: @contour_minor_line_width*@z16_contour; }
    [zoom = 17] { line-width: @contour_minor_line_width*@z17_contour; }
    [zoom = 18] { line-width: @contour_minor_line_width*@z18_contour; }
    [zoom = 19] { line-width: @contour_minor_line_width*@z19_contour; }
    [zoom >= 20] { line-width: @contour_minor_line_width*@z20_contour; }
    [[ELEV] % 20 = 0] {
        [zoom <= 12] { line-width: 0; }
        [zoom = 13] { line-width: @contour_major_line_width*@z13_contour; }
        [zoom = 14] { line-width: @contour_major_line_width*@z14_contour; }
        [zoom = 15] { line-width: @contour_major_line_width*@z15_contour; }
        [zoom = 16] { line-width: @contour_major_line_width*@z16_contour; }
        [zoom = 17] { line-width: @contour_major_line_width*@z17_contour; }
        [zoom = 18] { line-width: @contour_major_line_width*@z18_contour; }
        [zoom = 19] { line-width: @contour_major_line_width*@z19_contour; }
        [zoom >= 20] { line-width: @contour_major_line_width*@z20_contour; }
    }
}


/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#landuse {
    [zoom >= 15] {
        [type='camp_site'] {
            line-width: @landuse_line_width*@z15;
            [zoom = 16] { line-width: @landuse_line_width*@z16; }
            [zoom = 17] { line-width: @landuse_line_width*@z17; }
            [zoom = 18] { line-width: @landuse_line_width*@z18; }
            [zoom = 19] { line-width: @landuse_line_width*@z19; }
            [zoom >= 20] { line-width: @landuse_line_width*@z20; }
            polygon-pattern-file: url(../img/camping.svg);
            line-color: @black;
        }
    }
    [zoom >= 15] {
        [type='college'], [type='university'], [type='school'] {
            polygon-fill: @school;
        }
        [type='commercial'] {
            polygon-fill: @industrial;
        }
        [type='common'] {
            polygon-fill: @park;
        }
        [type='golf_course'] {
            polygon-fill: @sports;
        }
        [type='grass'] {
            polygon-pattern-file: url(../img/meadow.svg);
        }
        [type='park'] {
            polygon-fill: @park;
        }
        [type='parking'] {
            polygon-fill: @parking;
        }
        [type='pedestrian'] {
            polygon-fill: @pedestrian_fill;
        }
        [type='pitch'], [type='sports_center'], [type='stadium'] {
            polygon-fill: @sports;
        }
    }
    [type='forest'], [type='wood'] {
        [zoom <= 13] { line-width: @landuse_line_width*@z16; }
        [zoom = 14] { line-width: @landuse_line_width*@z16; }
        [zoom = 15] { line-width: @landuse_line_width*@z16; }
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
                [zoom >= 16] {
                    [area > 200000] {
                        line-pattern-file: url(../img/forest-border.svg);
                        line-pattern-offset: -10;
                    }
                }
            }
        }
        [leaf_type='needleleaved'] {
            [zoom <= 14] { polygon-pattern-file: url(../img/forest_nl_z14.svg); }
            [zoom > 14] { polygon-pattern-file: url(../img/forest_nl.svg); }
        }
    }

    [type='industrial']    {
        [zoom <= 13] { line-width: @landuse_line_width*@z16*2; }
        [zoom = 14] { line-width: @landuse_line_width*@z16*2; }
        [zoom = 15] { line-width: @landuse_line_width*@z16*2; }
        [zoom = 16] { line-width: @landuse_line_width*@z16*2; }
        [zoom = 17] { line-width: @landuse_line_width*@z17*2; }
        [zoom = 18] { line-width: @landuse_line_width*@z18*2; }
        [zoom = 19] { line-width: @landuse_line_width*@z19*2; }
        [zoom >= 20] { line-width: @landuse_line_width*@z20*2; }
        polygon-pattern-file: url(../img/industrial.svg);
        line-color: @gray;
    }

    [type='residential'] {
        polygon-fill: @residential;
    }
    [type='scrub'], [type='heath'] {
        polygon-pattern-file: url(../img/heath.svg)
    }

    [type='meadow']        {
        [zoom <= 13] { line-width: 0; }
        [zoom = 14] { line-width: @landuse_line_width*@z16; }
        [zoom = 15] { line-width: @landuse_line_width*@z16; }
        [zoom = 16] { line-width: @landuse_line_width*@z16; }
        [zoom = 17] { line-width: @landuse_line_width*@z17; }
        [zoom = 18] { line-width: @landuse_line_width*@z18; }
        [zoom = 19] { line-width: @landuse_line_width*@z19; }
        [zoom >= 20] { line-width: @landuse_line_width*@z20; }
        polygon-pattern-file: url(../img/meadow.svg);
        line-color: @gray;
    }
    [type='farmland'] {
        polygon-fill: @agriculture;
    }
    [type='orchard']       {
        [zoom <= 13] { line-width: 0; }
        [zoom = 14] { line-width: @landuse_line_width*@z16; }
        [zoom = 15] { line-width: @landuse_line_width*@z16; }
        [zoom = 16] { line-width: @landuse_line_width*@z16; }
        [zoom = 17] { line-width: @landuse_line_width*@z17; }
        [zoom = 18] { line-width: @landuse_line_width*@z18; }
        [zoom = 19] { line-width: @landuse_line_width*@z19; }
        [zoom >= 20] { line-width: @landuse_line_width*@z20; }
        polygon-fill: @green;
        polygon-pattern-file: url(../img/orchard.svg);
        line-color: @gray;
    }
    [trees='christmas_trees'], [produce='christmas_trees'] {
        [zoom <= 13] { line-width: 0; }
        [zoom = 14] { line-width: @landuse_line_width*@z16; }
        [zoom = 15] { line-width: @landuse_line_width*@z16; }
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
        [zoom <= 14] { line-width: @landuse_line_width*@z14*5; }
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

#cemetery {
    [zoom >= 15] {
        [zoom = 15] { line-width: @landuse_line_width*@z15; }
        [zoom = 16] { line-width: @landuse_line_width*@z16; }
        [zoom = 17] { line-width: @landuse_line_width*@z17; }
        [zoom = 18] { line-width: @landuse_line_width*@z18; }
        [zoom = 19] { line-width: @landuse_line_width*@z19; }
        [zoom >= 20] { line-width: @landuse_line_width*@z20; }
        polygon-fill: @background;
        polygon-pattern-file: url(../img/cemetery.svg);
        line-color: @black;
    }
}


/* ---- BUILDINGS ---- */
#buildings {
    [zoom >= 12] {
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
    }
}

#rotated_buildings {
    [zoom >= 12] {
        [building='church'] {
            [zoom = 12] { marker-height: @church_marker*@z12_marker; }
            [zoom = 13] { marker-height: @church_marker*@z13_marker; }
            [zoom = 14] { marker-height: @church_marker*@z14_marker; }
            [zoom = 15] { marker-height: @church_marker*@z15_marker; }
            [zoom = 16] { marker-height: @church_marker*@z16_marker; }
            [zoom = 17] { marker-height: @church_marker*@z17_marker; }
            [zoom = 18] { marker-height: @church_marker*@z18_marker; }
            [zoom = 19] { marker-height: @church_marker*@z19_marker; }
            [zoom >= 20] { marker-height: @church_marker*@z20_marker; }
            marker-file: url(../img/church.svg);
            marker-transform: rotate([orientation]);
            marker-allow-overlap: true;
        }
        [building='chapel'] {
            [zoom = 12] { marker-height: @church_marker*@z12_marker * 0.6; }
            [zoom = 13] { marker-height: @church_marker*@z13_marker * 0.6; }
            [zoom = 14] { marker-height: @church_marker*@z14_marker * 0.6; }
            [zoom = 15] { marker-height: @church_marker*@z15_marker * 0.6; }
            [zoom = 16] { marker-height: @church_marker*@z16_marker * 0.6; }
            [zoom = 17] { marker-height: @church_marker*@z17_marker * 0.6; }
            [zoom = 18] { marker-height: @church_marker*@z18_marker * 0.6; }
            [zoom = 19] { marker-height: @church_marker*@z19_marker * 0.6; }
            [zoom >= 20] { marker-height: @church_marker*@z20_marker * 0.6; }
            marker-file: url(../img/church.svg);
            marker-transform: rotate([orientation]);
        }
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
        [zoom <= 12] { line-width: @river_line_width*@z12; }
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
        [zoom >= 14] {
            [zoom = 14] { line-width: @stream_line_width*@z14; }
            [zoom = 15] { line-width: @stream_line_width*@z15; }
            [zoom = 16] { line-width: @stream_line_width*@z16; }
            [zoom = 17] { line-width: @stream_line_width*@z17; }
            [zoom = 18] { line-width: @stream_line_width*@z18; }
            [zoom = 19] { line-width: @stream_line_width*@z19; }
            [zoom >= 20] { line-width: @stream_line_width*@z20; }
        }
    }

    [type='ditch'], [type='drain'] {
        [zoom >= 15] {
            [zoom = 15] { line-width: @stream_line_width*@z15; }
            [zoom = 16] { line-width: @stream_line_width*@z16; }
            [zoom = 17] { line-width: @stream_line_width*@z17; }
            [zoom = 18] { line-width: @stream_line_width*@z18; }
            [zoom = 19] { line-width: @stream_line_width*@z19; }
            [zoom >= 20] { line-width: @stream_line_width*@z20; }
            line-dasharray: 4, 8;
            }
        }
    }
}

#waterway::top {
    [type='river'] {
        [zoom <= 12] { line-width: @river_line_width*@z12 * 0.7; }
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
    [type='stream'], [type='canal'] {
        [zoom >= 18] {
            [zoom = 18] { line-width: @stream_line_width*@z18 * 0.7; }
            [zoom = 19] { line-width: @stream_line_width*@z19 * 0.7; }
            [zoom >= 20] { line-width: @stream_line_width*@z20 * 0.7; }
            line-color: @water;
        }
    }
}
