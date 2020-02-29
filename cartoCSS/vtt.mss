
/* ================================================================== */
/* LABEL
/* ================================================================== */

@pink: #ff9703;
@labelKm: 130;

#label27km {
    text-name:"'27 km'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: @labelKm;
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
    text-size: @labelKm;
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
    text-size: @labelKm;
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
    text-size: @labelKm;
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
    text-size: @labelKm;
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
    text-size: @labelKm;
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
    text-size: 65;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
}

@profile_size: 600;
@profile_font_size: 52;
#profil27km {
    [id = 1] {
        marker-file: url(../img/profil27km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2020)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -300;
        text-dx: 760;
        text-allow-overlap: true;
    }
}
#profil35km {
    [id = 1] {
        marker-file: url(../img/profil35km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2020)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -300;
        text-dx: 760;
        text-allow-overlap: true;
    }
}
#profil45km {
    [id = 2] {
        marker-file: url(../img/profil45km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2020)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -300;
        text-dx: 760;
        text-allow-overlap: true;
    }
}
#profil55km {
    [id = 2] {
        marker-file: url(../img/profil55km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2020)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -300;
        text-dx: 760;
        text-allow-overlap: true;
    }
}
#profil78km {
    [id = 3] {
        marker-file: url(../img/profil78km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        marker-opacity: 0.75;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2020)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -300;
        text-dx: 830;
        text-allow-overlap: true;
    }
}

/* ================================================================== */
/* VTT
/* ================================================================== */

@vtt27km: #d95f02;
@vtt35km: #7570b3;
@vtt41km: #e7298a;
@vtt45km: #FFBF00;
@vtt55km: #2E2E2E;
@vtt78km: #2E2E2E;

@pink: #fc16e9;
@lo: 18;
@lop: 0.8;
@mk: 20;

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
#vtt78km {
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
