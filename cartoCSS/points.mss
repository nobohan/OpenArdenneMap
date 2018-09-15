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
     marker-file: url(img/level-crossing.svg);
     marker-height: 16;
   }
 }

/* ================================================================== */
/* VARIOUS POINT FEATURES
/* ================================================================== */

#point_features {
    [type = 'tower'], [type = 'mast'] {
        marker-file: url(img/tower.svg);
        marker-height: 4;
        ['tower_type' = 'communication'] {
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
    [type = 'fountain'] {
        marker-file: url(img/fountain.svg);
        marker-height: 10;
        marker-allow-overlap: true; /* always render */
        text-name:"'Font.'";
        text-face-name:@sans;
        text-placement:point;
        text-fill:@darkblue;
        text-size:@text_size_s;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-dy: -16;
        text-dx: -5;
    }
    [type = 'wayside_cross'] {
        marker-file: url(img/cross.svg);
        marker-height: 25;
        marker-allow-overlap: true; /* always render */
    }
    [type = 'picnic_table'], [type = 'picnic_site'] {
        marker-file: url(img/picnic.svg);
        marker-height: 12;
    }
    [type = 'archaeological_site'], [type = 'ruins'] {
        marker-file: url(img/ruins.svg);
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
    [type = 'stop_position'] {
        ['bus' = 'yes'] {
            marker-file: url(img/bus.svg);
            marker-height: 8;
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
