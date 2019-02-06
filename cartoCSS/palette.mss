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
Map { font-directory: url(../fonts); }

/* set up font sets for various weights and styles */
@sans_lt:       "Open Sans Regular", "DejaVu Sans Book";
@sans_lt_italic:    "DejaVu Sans Oblique";
@sans:          "Belgika 8th", "Open Sans Semibold", "DejaVu Sans Book";
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

@gold:              #aaa16c;
@bottle:            #698785;

@purewhite:         #ffffff;
@white:             #F1EFE0;
@black:             #111111;
@darkgray:          #444444;
@gray:              #bbbbbb;

@red:               #f5812b;
@green:             #26b424; /*59773f*/   /*135955*/
@blue:              #00aee4;
@darkblue:          #605492;



@contour:           @gray;

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
@building:          @darkgray;
@hospital:          @white;
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

@motorway_line:     @black;
@motorway_fill:     @red;
@motorway_case:     @motorway_line * 0.9;

@trunk_line:        @black;
@trunk_fill:        @red;
@trunk_case:        @trunk_line * 0.9;

@primary_line:      @black;
@primary_fill:      @red;
@primary_case:      @primary_line * 0.9;

@secondary_line:    @black;
@secondary_fill:    @red;
@secondary_case:    @secondary_line * 0.9;

@standard_line:     @black;
@standard_fill:     @white;
@standard_case:     @standard_line * 0.9;

@pedestrian_line:   @black;
@pedestrian_fill:   @white;
@pedestrian_case:   @land;

@cycle_line:        @black;
@cycle_fill:        @white;
@cycle_case:        @land;

@rail_line:         @black;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin:             @black;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,25%);

@country_text:      @black;
@country_halo:      @place_halo;

@state_text:        @black;
@state_halo:        @place_halo;

@city_text:         @black;
@city_halo:         @place_halo;

@town_text:         @black;
@town_halo:         @place_halo;

@poi_text:          @black;

@road_text:         @black;
@road_halo:         #fff;

@other_text:        @black;
@other_halo:        @place_halo;

@locality_text:     @black;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      @black;
@village_halo:      @place_halo;

/* ****************************************************************** */
