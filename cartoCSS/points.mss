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
     marker-height: 16;
   }
 }

/* ================================================================== */
/* VARIOUS POINT FEATURES
/* ================================================================== */

#point_features {
    [power = 'tower'], [man_made = 'mast'] {
        marker-file: url(../img/tower.svg);
        marker-height: 4;
        ['tower:type' = 'communication'] {
            text-name:"'Pyl.'";
            text-face-name:@sans;
            text-placement:point;
            text-fill:@black;
            text-size:@text_size_s;
            text-character-spacing: 2;
            text-line-spacing: 2;
            text-halo-fill:@other_halo;
            text-halo-radius:1;
            text-dy: -8;
            /*text-dx: 12;*/
            text-allow-overlap: true;
        }
    }
    [amenity = 'fountain'] {
        marker-file: url(../img/fountain.svg);
        marker-height: 10;
        marker-allow-overlap: true; /* always render */
        text-name:"'Font.'";
        text-face-name:@sans;
        text-placement:point;
        text-fill: @blue;
        text-halo-fill: @white;
        text-halo-radius: 4;
        text-size:@text_size_s;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-dy: -16;
        text-dx: -5;
    }
    [historic = 'wayside_cross'] {
        marker-file: url(../img/cross.svg);
        marker-height: 25;
        marker-allow-overlap: true; /* always render */
    }
    [leisure = 'picnic_table'], [tourism = 'picnic_site'] {
        marker-file: url(../img/picnic.svg);
        marker-height: 12;
    }
    [historic = 'archaeological_site'], [historic = 'ruins'] {
        marker-file: url(../img/ruins.svg);
        marker-height: 15;
        marker-allow-overlap: true; /* always render */
        text-name:'[name]';
        text-face-name:@sans;
        text-placement:point;
        text-fill:@black;
        text-size:@text_size_s;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 50;
        text-halo-fill:@other_halo;
        text-halo-radius:1;
        text-dy: -5;
        text-dx: 12;
    }
    [public_transport = 'stop_position'] {
        ['bus' = 'yes'] {
            marker-file: url(../img/bus.svg);
            marker-height: 12;
            marker-allow-overlap: true;
            text-name:"'Bus'";
            text-face-name:@sans;
            text-placement:point;
            text-fill:@black;
            text-size:@text_size_xs;
            text-character-spacing: 2;
            text-line-spacing: 2;
            text-halo-fill:@other_halo;
            text-halo-radius:1;
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
            marker-file: url(../img/soccer.svg);
            marker-height: 120;
            marker-transform: rotate([orientation]);
            marker-allow-overlap: true;
            }
        }
    [sport='tennis'] {
        [length > 10] {
            marker-file: url(../img/tennis.svg);
            marker-height: 120;
            marker-transform: rotate([orientation]);
            marker-allow-overlap: true;
            }
        }
    }
}
