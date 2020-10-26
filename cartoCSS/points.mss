/* POINTS.MSS CONTENTS
 * - Train elements
 * - various point features
 *
 */

 /* ================================================================== */
 /* TRAIN ELEMENTS
 /* ================================================================== */

 #train_elements {
     [zoom >= 15] {
         [type='level_crossing'] {
             marker-file: url(../img/level-crossing.svg);
             [zoom = 15] { marker-height: @large*@z15_marker; }
             [zoom = 16] { marker-height: @large*@z16_marker; }
             [zoom = 17] { marker-height: @large*@z17_marker; }
             [zoom = 18] { marker-height: @large*@z18_marker; }
             [zoom = 19] { marker-height: @large*@z19_marker; }
             [zoom >= 20] { marker-height: @large*@z20_marker; }
         }
     }
 }

/* ================================================================== */
/* VARIOUS POINT FEATURES
/* ================================================================== */

#point_features {
    [power = 'tower'], [man_made = 'mast'] {
        [zoom >= 14] {
            [zoom = 14] { marker-height: @mini*@z14_marker; }
            [zoom = 15] { marker-height: @mini*@z15_marker; }
            [zoom = 16] { marker-height: @mini*@z16_marker; }
            [zoom = 17] { marker-height: @mini*@z17_marker; }
            [zoom = 18] { marker-height: @mini*@z18_marker; }
            [zoom = 19] { marker-height: @mini*@z19_marker; }
            [zoom >= 20] { marker-height: @mini*@z20_marker; }
            marker-file: url(../img/tower.svg);
            ['tower:type' = 'communication'] {
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
    }
    [power = 'generator'], ['generator:source' = 'wind'] {
        [zoom >= 14] {
            [zoom = 14] { marker-height: @windmill_marker*@z14_marker; }
            [zoom = 15] { marker-height: @windmill_marker*@z15_marker; }
            [zoom = 16] { marker-height: @windmill_marker*@z16_marker; }
            [zoom = 17] { marker-height: @windmill_marker*@z17_marker; }
            [zoom = 18] { marker-height: @windmill_marker*@z18_marker; }
            [zoom = 19] { marker-height: @windmill_marker*@z19_marker; }
            [zoom >= 20] { marker-height: @windmill_marker*@z20_marker; }
            marker-file: url(../img/windmill.svg);
        }
    }
    [amenity = 'fountain'] {
        [zoom >= 15] {
            [zoom = 15] { marker-height: @large*@z15_marker; text-size: @text_size_s*@z15_label; }
            [zoom = 16] { marker-height: @large*@z16_marker; text-size: @text_size_s*@z16_label; }
            [zoom = 17] { marker-height: @large*@z17_marker; text-size: @text_size_s*@z17_label; }
            [zoom = 18] { marker-height: @large*@z18_marker; text-size: @text_size_s*@z18_label; }
            [zoom = 19] { marker-height: @large*@z19_marker; text-size: @text_size_s*@z19_label; }
            [zoom >= 20] { marker-height: @large*@z20_marker; text-size: @text_size_s*@z20_label; }
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
    }
    [ford = 'yes'] {
        [zoom >= 14] {
            text-name:"'Gué'";
            text-face-name: @sans;
            text-placement: point;
            text-fill: @darkblue;
            text-halo-fill: #ffffff;
            text-halo-radius: 2;
            text-character-spacing: 2;
            text-allow-overlap: false;
            [zoom = 14] { text-size: @text_size_s*@z14_label; text-dy: 0;}
            [zoom = 15] { text-size: @text_size_s*@z15_label; text-dy: -8;}
            [zoom = 16] { text-size: @text_size_s*@z16_label; text-dy: -16; }
            [zoom = 17] { text-size: @text_size_s*@z17_label; text-dy: -20;}
            [zoom = 18] { text-size: @text_size_s*@z18_label; text-dy: -24;}
            [zoom = 19] { text-size: @text_size_s*@z19_label; text-dy: -28;}
            [zoom >= 20] { text-size: @text_size_s*@z20_label; text-dy: -32;}
        }
    }
    [historic = 'wayside_cross'] {
        [zoom >= 15] {
            [zoom = 15] { marker-height: @huge*1.5*@z15_marker; }
            [zoom = 16] { marker-height: @huge*1.5*@z16_marker; }
            [zoom = 17] { marker-height: @huge*1.5*@z17_marker; }
            [zoom = 18] { marker-height: @huge*1.5*@z18_marker; }
            [zoom = 19] { marker-height: @huge*1.5*@z19_marker; }
            [zoom >= 20] { marker-height: @huge*1.5*@z20_marker; }
            marker-file: url(../img/cross.svg);
            marker-allow-overlap: true;
        }
    }
    [leisure = 'picnic_table'], [tourism = 'picnic_site'] {
        [zoom >= 15] {
            [zoom = 15] { marker-height: @large*@z15_marker; }
            [zoom = 16] { marker-height: @large*@z16_marker; }
            [zoom = 17] { marker-height: @large*@z17_marker; }
            [zoom = 18] { marker-height: @large*@z18_marker; }
            [zoom = 19] { marker-height: @large*@z19_marker; }
            [zoom >= 20] { marker-height: @large*@z20_marker; }
            marker-file: url(../img/picnic.svg);
        }
    }
    [historic = 'archaeological_site'], [historic = 'ruins'] {
        [zoom >= 14] {
            [zoom = 14] { marker-height: @huge*@z14_marker; text-size: @text_size_s*@z14_label; }
            [zoom = 15] { marker-height: @huge*@z15_marker; text-size: @text_size_s*@z15_label; }
            [zoom = 16] { marker-height: @huge*@z16_marker; text-size: @text_size_s*@z16_label; }
            [zoom = 17] { marker-height: @huge*@z17_marker; text-size: @text_size_s*@z17_label; }
            [zoom = 18] { marker-height: @huge*@z18_marker; text-size: @text_size_s*@z18_label; }
            [zoom = 19] { marker-height: @huge*@z19_marker; text-size: @text_size_s*@z19_label; }
            [zoom >= 20] { marker-height: @huge*@z20_marker; text-size: @text_size_s*@z20_label; }
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
    }
    [historic = 'castle'] {
        [zoom >= 13] {
            [zoom = 13] { text-size: @text_size_s*@z13_label; }
            [zoom = 14] { text-size: @text_size_s*@z14_label; }
            [zoom = 15] { text-size: @text_size_s*@z15_label; }
            [zoom = 16] { text-size: @text_size_s*@z16_label; }
            [zoom = 17] { text-size: @text_size_s*@z17_label; }
            [zoom = 18] { text-size: @text_size_s*@z18_label; }
            [zoom = 19] { text-size: @text_size_s*@z19_label; }
            [zoom >= 20] { text-size: @text_size_s*@z20_label; }
            text-name: '[short_name]';
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
    }
    [public_transport = 'stop_position'] {
        ['bus' = 'yes'] {
            [zoom >= 14] {
                [zoom = 14] { marker-height: @large*@z14_marker; text-size: @text_size_xs*@z14_label; }
                [zoom = 15] { marker-height: @large*@z15_marker; text-size: @text_size_xs*@z15_label; }
                [zoom = 16] { marker-height: @large*@z16_marker; text-size: @text_size_xs*@z16_label; }
                [zoom = 17] { marker-height: @large*@z17_marker; text-size: @text_size_xs*@z17_label; }
                [zoom = 18] { marker-height: @large*@z18_marker; text-size: @text_size_xs*@z18_label; }
                [zoom = 19] { marker-height: @large*@z19_marker; text-size: @text_size_xs*@z19_label; }
                [zoom >= 20] { marker-height: @large*@z20_marker; text-size: @text_size_xs*@z20_label; }
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
    [tourism = 'viewpoint'] {
        [zoom >= 14] {
            [zoom = 14] { marker-height: @viewpoint_marker*@z14_marker; }
            [zoom = 15] { marker-height: @viewpoint_marker*@z15_marker; }
            [zoom = 16] { marker-height: @viewpoint_marker*@z16_marker; }
            [zoom = 17] { marker-height: @viewpoint_marker*@z17_marker; }
            [zoom = 18] { marker-height: @viewpoint_marker*@z18_marker; }
            [zoom = 19] { marker-height: @viewpoint_marker*@z19_marker; }
            [zoom >= 20] { marker-height: @viewpoint_marker*@z20_marker; }
            marker-file: url(../img/viewpoint.svg);
            marker-transform: rotate([orientation]);
        }
    }
}


/* ================================================================== */
/* ROTATED PITCHES
/* ================================================================== */

#pitch { [orientation != ''][zoom >= 14] {
    [sport='soccer'] {
        [length > 100] {
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
