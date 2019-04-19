
/* ================================================================== */
/* LABEL
/* ================================================================== */

@pink: #ff9703;


#label28km {
    text-name:"'28 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 120;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -60;
    text-dx: -50;
}

#label32km {
    text-name:"'32 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 120;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -60;
    text-dx: -50;
}

#label42km {
    text-name:"'42 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 120;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -60;
    text-dx: -50;
}

#label56km {
    text-name:"'56 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 120;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -60;
    text-dx: -50;
}

#label_marche1 {
    text-name:"'Marche 12 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 120;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -60;
    text-dx: -50;
}
#label_marche2 {
    text-name:"'Marche 6 km (pointillé)'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 75;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: 560;
    text-dx: 550;
}


/* ================================================================== */
/* VTT
/* ================================================================== */

@vtt28km: #d95f02;
@vtt32km: #7570b3;
@vtt41km: #e7298a;
@vtt42km: #FFBF00;
@vtt56km: #2E2E2E;

@pink: #fc16e9;
@lo: 15;
@lop: 0.8;
@mk: 16;

#vtt28km {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: @lop;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}
#vtt32km {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: @lop;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}
#vtt42km {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: @lop;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}
#vtt56km {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: @lop;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}

#marche12km_planB {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: 1;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}

#marche8km_planB {
  line-color: @pink;
  line-width: @lo;
  line-offset: -@lo+1;
  line-opacity: 1;
  line-dasharray: 12,6;
  marker-file: url(../img/arrow.png);
  marker-height: @mk;
  marker-placement: line;
  marker-spacing: 400;
  marker-offset: -@lo+1;
}
