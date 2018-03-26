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
            text-dy: -5;
            text-dx: 12;
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
}
