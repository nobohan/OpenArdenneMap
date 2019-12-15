/* POINTS.MSS CONTENTS
 * - Train elements
 * - various point features
 *
 */

 /* ================================================================== */
 /* TRAIN ELEMENTS
 /* ================================================================== */

 #train_elements {
   [type='level_crossing'] {
     marker-file: url(../img/level-crossing.svg);
     [zoom <= 10] { marker-height: @large*@z10; }
     [zoom = 11] { marker-height: @large*@z11; }
     [zoom = 12] { marker-height: @large*@z12; }
     [zoom = 13] { marker-height: @large*@z13; }
     [zoom = 14] { marker-height: @large*@z14; }
     [zoom = 15] { marker-height: @large*@z15; }
     [zoom = 16] { marker-height: @large*@z16; }
     [zoom = 17] { marker-height: @large*@z17; }
     [zoom = 18] { marker-height: @large*@z18; }
     [zoom = 19] { marker-height: @large*@z19; }
     [zoom >= 20] { marker-height: @large*@z20; }
   }
 }

/* ================================================================== */
/* VARIOUS POINT FEATURES
/* ================================================================== */

#point_features {
    [power = 'tower'], [man_made = 'mast'] {
        [zoom <= 10] { marker-height: @mini*@z10; }
        [zoom = 11] { marker-height: @mini*@z11; }
        [zoom = 12] { marker-height: @mini*@z12; }
        [zoom = 13] { marker-height: @mini*@z13; }
        [zoom = 14] { marker-height: @mini*@z14; }
        [zoom = 15] { marker-height: @mini*@z15; }
        [zoom = 16] { marker-height: @mini*@z16; }
        [zoom = 17] { marker-height: @mini*@z17; }
        [zoom = 18] { marker-height: @mini*@z18; }
        [zoom = 19] { marker-height: @mini*@z19; }
        [zoom >= 20] { marker-height: @mini*@z20; }
        marker-file: url(../img/tower.svg);
        ['tower:type' = 'communication'] {
            [zoom <= 10] { text-size: @text_size_s*@z10_label; }
            [zoom = 11] { text-size: @text_size_s*@z11_label; }
            [zoom = 12] { text-size: @text_size_s*@z12_label; }
            [zoom = 13] { text-size: @text_size_s*@z13_label; }
            [zoom = 14] { text-size: @text_size_s*@z14_label; }
            [zoom = 15] { text-size: @text_size_s*@z15_label; }
            [zoom = 16] { text-size: @text_size_s*@z16_label; }
            [zoom = 17] { text-size: @text_size_s*@z17_label; }
            [zoom = 18] { text-size: @text_size_s*@z18_label; }
            [zoom = 19] { text-size: @text_size_s*@z19_label; }
            [zoom >= 20] { text-size: @text_size_s*@z20_label; }
            text-name: "'Pyl.'";
            text-face-name: @sans;
            text-placement: point;
            text-fill: @black;
            text-character-spacing: 2;
            text-line-spacing: 2;
            text-halo-fill: @other_halo;
            text-halo-radius: 1;
            text-dy: -8;
            text-allow-overlap: true;
        }
    }
    [amenity = 'fountain'] {
        [zoom <= 10] { marker-height: @large*@z10; text-size: @text_size_s*@z10_label; }
        [zoom = 11] { marker-height: @large*@z11; text-size: @text_size_s*@z11_label; }
        [zoom = 12] { marker-height: @large*@z12; text-size: @text_size_s*@z12_label; }
        [zoom = 13] { marker-height: @large*@z13; text-size: @text_size_s*@z13_label; }
        [zoom = 14] { marker-height: @large*@z14; text-size: @text_size_s*@z14_label; }
        [zoom = 15] { marker-height: @large*@z15; text-size: @text_size_s*@z15_label; }
        [zoom = 16] { marker-height: @large*@z16; text-size: @text_size_s*@z16_label; }
        [zoom = 17] { marker-height: @large*@z17; text-size: @text_size_s*@z17_label; }
        [zoom = 18] { marker-height: @large*@z18; text-size: @text_size_s*@z18_label; }
        [zoom = 19] { marker-height: @large*@z19; text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { marker-height: @large*@z20; text-size: @text_size_s*@z20_label; }
        marker-file: url(../img/fountain.svg);
        marker-allow-overlap: true;
        text-name:"'Font.'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @darkblue;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-dy: -16;
        text-dx: -5;
    }
    [ford = 'yes'] {
        [zoom <= 10] { text-size: 0; }
        [zoom = 11] { text-size: @text_size_s*@z11_label; }
        [zoom = 12] { text-size: @text_size_s*@z12_label; }
        [zoom = 13] { text-size: @text_size_s*@z13_label; }
        [zoom = 14] { text-size: @text_size_s*@z14_label; }
        [zoom = 15] { text-size: @text_size_s*@z15_label; }
        [zoom = 16] { text-size: @text_size_s*@z16_label; }
        [zoom = 17] { text-size: @text_size_s*@z17_label; }
        [zoom = 18] { text-size: @text_size_s*@z18_label; }
        [zoom = 19] { text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { text-size: @text_size_s*@z20_label; }
        text-name:"'Gué'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @darkblue;
        text-character-spacing: 2;
        text-dy: -16;
        text-allow-overlap: false;
    }
    [historic = 'wayside_cross'] {
        [zoom <= 10] { marker-height: @huge*@z10; }
        [zoom = 11] { marker-height: @huge*@z11; }
        [zoom = 12] { marker-height: @huge*@z12; }
        [zoom = 13] { marker-height: @huge*@z13; }
        [zoom = 14] { marker-height: @huge*@z14; }
        [zoom = 15] { marker-height: @huge*@z15; }
        [zoom = 16] { marker-height: @huge*@z16; }
        [zoom = 17] { marker-height: @huge*@z17; }
        [zoom = 18] { marker-height: @huge*@z18; }
        [zoom = 19] { marker-height: @huge*@z19; }
        [zoom >= 20] { marker-height: @huge*@z20; }
        marker-file: url(../img/cross.svg);
        marker-allow-overlap: true;
    }
    [leisure = 'picnic_table'], [tourism = 'picnic_site'] {
        [zoom <= 10] { marker-height: @large*@z10; }
        [zoom = 11] { marker-height: @large*@z11; }
        [zoom = 12] { marker-height: @large*@z12; }
        [zoom = 13] { marker-height: @large*@z13; }
        [zoom = 14] { marker-height: @large*@z14; }
        [zoom = 15] { marker-height: @large*@z15; }
        [zoom = 16] { marker-height: @large*@z16; }
        [zoom = 17] { marker-height: @large*@z17; }
        [zoom = 18] { marker-height: @large*@z18; }
        [zoom = 19] { marker-height: @large*@z19; }
        [zoom >= 20] { marker-height: @large*@z20; }
        marker-file: url(../img/picnic.svg);
    }
    [historic = 'archaeological_site'], [historic = 'ruins'] {
        [zoom <= 10] { marker-height: @huge*@z10; text-size: @text_size_s*@z10_label; }
        [zoom = 11] { marker-height: @huge*@z11; text-size: @text_size_s*@z11_label; }
        [zoom = 12] { marker-height: @huge*@z12; text-size: @text_size_s*@z12_label; }
        [zoom = 13] { marker-height: @huge*@z13; text-size: @text_size_s*@z13_label; }
        [zoom = 14] { marker-height: @huge*@z14; text-size: @text_size_s*@z14_label; }
        [zoom = 15] { marker-height: @huge*@z15; text-size: @text_size_s*@z15_label; }
        [zoom = 16] { marker-height: @huge*@z16; text-size: @text_size_s*@z16_label; }
        [zoom = 17] { marker-height: @huge*@z17; text-size: @text_size_s*@z17_label; }
        [zoom = 18] { marker-height: @huge*@z18; text-size: @text_size_s*@z18_label; }
        [zoom = 19] { marker-height: @huge*@z19; text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { marker-height: @huge*@z20; text-size: @text_size_s*@z20_label; }
        marker-file: url(../img/ruins.svg);
        marker-allow-overlap: true;
        text-name:'[name]';
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 100;
        text-halo-fill: @other_halo;
        text-halo-radius: 1;
        text-dx: 12;
        text-allow-overlap: true;
    }
    [historic = 'castle'] {
        [zoom <= 10] { text-size: @text_size_s*@z10_label; }
        [zoom = 11] { text-size: @text_size_s*@z11_label; }
        [zoom = 12] { text-size: @text_size_s*@z12_label; }
        [zoom = 13] { text-size: @text_size_s*@z13_label; }
        [zoom = 14] { text-size: @text_size_s*@z14_label; }
        [zoom = 15] { text-size: @text_size_s*@z15_label; }
        [zoom = 16] { text-size: @text_size_s*@z16_label; }
        [zoom = 17] { text-size: @text_size_s*@z17_label; }
        [zoom = 18] { text-size: @text_size_s*@z18_label; }
        [zoom = 19] { text-size: @text_size_s*@z19_label; }
        [zoom >= 20] { text-size: @text_size_s*@z20_label; }
        text-name:'[short_name]';
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 100;
        text-halo-fill: @other_halo;
        text-halo-radius: 1;
        text-dx: 12;
        text-allow-overlap: true;
    }
    [public_transport = 'stop_position'] {
        ['bus' = 'yes'] {
            [zoom <= 10] { marker-height: @large*@z10; text-size: @text_size_xs*@z10_label; }
            [zoom = 11] { marker-height: @large*@z11; text-size: @text_size_xs*@z11_label; }
            [zoom = 12] { marker-height: @large*@z12; text-size: @text_size_xs*@z12_label; }
            [zoom = 13] { marker-height: @large*@z13; text-size: @text_size_xs*@z13_label; }
            [zoom = 14] { marker-height: @large*@z14; text-size: @text_size_xs*@z14_label; }
            [zoom = 15] { marker-height: @large*@z15; text-size: @text_size_xs*@z15_label; }
            [zoom = 16] { marker-height: @large*@z16; text-size: @text_size_xs*@z16_label; }
            [zoom = 17] { marker-height: @large*@z17; text-size: @text_size_xs*@z17_label; }
            [zoom = 18] { marker-height: @large*@z18; text-size: @text_size_xs*@z18_label; }
            [zoom = 19] { marker-height: @large*@z19; text-size: @text_size_xs*@z19_label; }
            [zoom >= 20] { marker-height: @large*@z20; text-size: @text_size_xs*@z20_label; }
            marker-file: url(../img/bus.svg);
            marker-allow-overlap: true;
            text-name: "'Bus'";
            text-face-name: @sans;
            text-placement: point;
            text-fill: @black;
            text-character-spacing: 2;
            text-line-spacing: 2;
            text-halo-fill: @other_halo;
            text-halo-radius: 1;
            text-dy: -5;
            text-dx: 0;
            text-allow-overlap: false;
        }
    }
}


/* ================================================================== */
/* ROTATED PITCHES
/* ================================================================== */

#pitch { [orientation != ''] {
    [sport='soccer'] {
        [length > 100] {
            [zoom <= 10] { marker-height: @pitch_marker*@z10; }
            [zoom = 11] { marker-height: @pitch_marker*@z11; }
            [zoom = 12] { marker-height: @pitch_marker*@z12; }
            [zoom = 13] { marker-height: @pitch_marker*@z13; }
            [zoom = 14] { marker-height: @pitch_marker*@z14; }
            [zoom = 15] { marker-height: @pitch_marker*@z15; }
            [zoom = 16] { marker-height: @pitch_marker*@z16; }
            [zoom = 17] { marker-height: @pitch_marker*@z17; }
            [zoom = 18] { marker-height: @pitch_marker*@z18; }
            [zoom = 19] { marker-height: @pitch_marker*@z19; }
            [zoom >= 20] { marker-height: @pitch_marker*@z20; }
            marker-file: url(../img/soccer.svg);
            marker-height: @pitch_marker;
            marker-transform: rotate([orientation]);
            marker-allow-overlap: true;
            }
        }
    [sport='tennis'] {
        [length > 10] {
            [zoom <= 10] { marker-height: @pitch_marker/2*@z10; }
            [zoom = 11] { marker-height: @pitch_marker/2*@z11; }
            [zoom = 12] { marker-height: @pitch_marker/2*@z12; }
            [zoom = 13] { marker-height: @pitch_marker/2*@z13; }
            [zoom = 14] { marker-height: @pitch_marker/2*@z14; }
            [zoom = 15] { marker-height: @pitch_marker/2*@z15; }
            [zoom = 16] { marker-height: @pitch_marker/2*@z16; }
            [zoom = 17] { marker-height: @pitch_marker/2*@z17; }
            [zoom = 18] { marker-height: @pitch_marker/2*@z18; }
            [zoom = 19] { marker-height: @pitch_marker/2*@z19; }
            [zoom >= 20] { marker-height: @pitch_marker/2*@z20; }
            marker-file: url(../img/tennis.svg);
            marker-height: @pitch_marker/2;
            marker-transform: rotate([orientation]);
            marker-allow-overlap: true;
            }
        }
    }
}
