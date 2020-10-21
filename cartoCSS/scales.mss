/* SCALES.MSS CONTENTS
 * All scale-dependent label, width and marker sizes
 */

/* scale factor double for each level of zoom */
@z10: 0.015625;
@z11: 0.03125;
@z12: 0.0625;
@z13: 0.125;
@z14: 0.25;
@z15: 0.5;
@z16: 1; /* scale = 1/20000 */
@z17: 2;
@z18: 4;
@z19: 8;
@z20: 16;

/* scale factor double until z16 and then gently increases */
@z10_contour: 0.0625;
@z11_contour: 0.0625;
@z12_contour: 0.0625;
@z13_contour: 0.0625;
@z14_contour: 0.125;
@z15_contour: 0.25;
@z16_contour: 0.5; /* scale = 1/20000 */
@z17_contour: 1;
@z18_contour: 1.5;
@z19_contour: 2;
@z20_contour: 2;

@z10_road: 0.2;
@z11_road: 0.3;
@z12_road: 0.4;
@z13_road: 0.55;
@z14_road: 0.7;
@z15_road: 0.8;
@z16_road: 1; /* scale = 1/20000 */
@z17_road: 1.4;
@z18_road: 2;
@z19_road: 2.8;
@z20_road: 4;

/* scale factor double only one zoom level on 2 (based on sqrt(2))  */
@z10_marker: 0.125;
@z11_marker: 0.18;
@z12_marker: 0.25;
@z13_marker: 0.35;
@z14_marker: 0.5;
@z15_marker: 0.7;
@z16_marker: 1; /* scale = 1/20000 */
@z17_marker: 1.4;
@z18_marker: 2;
@z19_marker: 2.8;
@z20_marker: 4;

@z10_label: 0.2;
@z11_label: 0.25;
@z12_label: 0.3;
@z13_label: 0.4;
@z14_label: 0.55;
@z15_label: 0.7;
@z16_label: 1; /* scale = 1/20000 */
@z17_label: 1.4;
@z18_label: 2;
@z19_label: 2.8;
@z20_label: 4;

@supra_text_size_alfphabet: 5;
@text_size_xl : 90 + @supra_text_size_alfphabet;
@text_size_l : 60 + @supra_text_size_alfphabet;
@text_size_m : 40 + @supra_text_size_alfphabet;
@text_size_s : 30 + @supra_text_size_alfphabet;
@text_size_xs : 20 + @supra_text_size_alfphabet;


/* =============== */
/*    BASE.MSS
/* =============== */

@contour_minor_line_width: 1.5;
@contour_major_line_width: 3;

@landuse_line_width: 0.5;

@building_line_width: 0.4;

@church_marker: 40;

@river_line_width: 12;
@stream_line_width: 4;


/* =============== */
/*    LINES.MSS
/* =============== */

/* Road width variables */
@huge: 16;
@large: 10;
@medium: 8;
@small: 5;
@mini: 4;
@tiny: 3;

@outline: 2;

@bridge_marker: 16;


/* =============== */
/*    POINTS.MSS
/* =============== */

@pitch_marker: 40;
@windmill_marker: 32;
