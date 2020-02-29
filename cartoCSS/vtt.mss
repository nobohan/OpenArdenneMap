
/* ================================================================== */
/* LABEL
/* ================================================================== */

@pink: #ff9703;


#label27km {
    text-name:"'27 km'";
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

#label35km {
    text-name:"'35 km'";
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

#label45km {
    text-name:"'45 km'";
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

#label55km {
    text-name:"'55 km'";
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

#label78km {
    text-name:"'78 km'";
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
    text-dy: 550;
    text-dx: 550;
}

#ravitos {
    marker-file: url(../img/star.png);
    text-name:"'Ravitaillement'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 45;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
}

@profile_size: 450;
#profil27km {
    marker-file: url(../img/profil27km.png);
    marker-allow-overlap: true;
    marker-height: @profile_size;
    text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap'";
    text-face-name: @sans;
    text-placement: point;
    text-fill: @black;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-wrap-width: 1000;
    text-halo-fill: @other_halo;
    text-halo-radius: 10;
    text-size: 35;
    text-dy: 1000;
    text-dx: 950;
    text-allow-overlap: true;
}
#profil35km {
    marker-file: url(../img/profil35km.png);
    marker-allow-overlap: true;
    marker-height: @profile_size;
    text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap'";
    text-face-name: @sans;
    text-placement: point;
    text-fill: @black;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-wrap-width: 1000;
    text-halo-fill: @other_halo;
    text-halo-radius: 10;
    text-size: 35;
    text-dy: 1000;
    text-dx: 950;
    text-allow-overlap: true;
}
#profil45km {
    marker-file: url(../img/profil45km.png);
    marker-allow-overlap: true;
    marker-height: @profile_size;
    text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap'";
    text-face-name: @sans;
    text-placement: point;
    text-fill: @black;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-wrap-width: 1000;
    text-halo-fill: @other_halo;
    text-halo-radius: 10;
    text-size: 35;
    text-dy: 1000;
    text-dx: 950;
    text-allow-overlap: true;
}
#profil55km {
    marker-file: url(../img/profil55km.png);
    marker-allow-overlap: true;
    marker-height: @profile_size;
    text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap'";
    text-face-name: @sans;
    text-placement: point;
    text-fill: @black;
    text-character-spacing: 2;
    text-line-spacing: 2;
    text-wrap-width: 1000;
    text-halo-fill: @other_halo;
    text-halo-radius: 10;
    text-size: 35;
    text-dy: -250;
    text-dx: 940;
    text-allow-overlap: true;
}


/* ================================================================== */
/* VTT
/* ================================================================== */

@vtt27km: #d95f02;
@vtt35km: #7570b3;
@vtt41km: #e7298a;
@vtt45km: #FFBF00;
@vtt55km: #2E2E2E;

@pink: #fc16e9;
@lo: 15;
@lop: 0.8;
@mk: 16;

#vtt27km {
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
#vtt35km {
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
#vtt45km {
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
#vtt55km {
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
