/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* set up font sets for various weights and styles */
@sans_lt:       "Open Sans Regular", "DejaVu Sans Book";
@sans_lt_italic:    "DejaVu Sans Oblique";
@sans:          "Open Sans Semibold", "DejaVu Sans Book";
@sans_italic:   "Open Sans Semibold Italic", "DejaVu Sans Oblique";
@sans_bold:  "Open Sans Bold", "DejaVu Sans Bold";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Oblique", "DejaVu Sans Oblique";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;


/* ================================================================== */
/* BASE COLORS
/* ================================================================== */

@white:             #FCFBE7;
@black:             #444444;
@darkgray:          #999999;
@red:               #db794c;
@green:             #3d9142;
@blue:              #7b7be1;

@contour:           #b06435;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              @white;
@water:             @blue;
@grass:             @white;
@park:              @white;
@cemetery:          @white;
@wooded:            @green;
@agriculture:       @white;
@farmyard:          @white;
@building:          @black;
@hospital:          @black;
@school:            @white;
@sports:            @white;
@residential:       @white;
@commercial:        @white;
@industrial:        @white;
@parking:           @white;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #de1111;
@motorway_fill:     @red;
@motorway_case:     @motorway_line * 0.9;

@trunk_line:        #de1111;
@trunk_fill:        @red;
@trunk_case:        @trunk_line * 0.9;

@primary_line:      #de1111;
@primary_fill:      @red;
@primary_case:      @primary_line * 0.9;

@secondary_line:    #de5f11;
@secondary_fill:    @red;
@secondary_case:    @secondary_line * 0.9;

@standard_line:     #000;
@standard_fill:     @white;
@standard_case:     @standard_line * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   @white;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        @white;
@cycle_case:        @land;

@rail_line:         #111;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #435;
@country_halo:      @place_halo;

@state_text:        #546;
@state_halo:        @place_halo;

@city_text:         #444;
@city_halo:         @place_halo;

@town_text:         #666;
@town_halo:         @place_halo;

@poi_text:          #888;

@road_text:         #777;
@road_halo:         #fff;

@other_text:        #888;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;

/* ****************************************************************** */
