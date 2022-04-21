
/* ================================================================== */
/* LABEL
/* ================================================================== */

@pink: #ff9703;
@labelKm: 130;

#label18km {
    text-name:"'18 km'";
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

#label28km {
    text-name:"'28 km'";
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

#label34km {
    text-name:"'34 km'";
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

#label48km {
    text-name:"'48 km'";
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

#label57km {
    text-name:"'57 km'";
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
    text-name:"'Marche 11 km'";
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
    text-name:"'7 km (raccourci)'";
    text-face-name:@sans;
    text-placement:point;
    text-fill:@black;
    text-size: 75;
    text-character-spacing: 2;
    text-allow-overlap: true;
    text-halo-fill: @pink;
    text-halo-radius: 3;
    text-dy: -1250;
    text-dx: -600;
}

#ravitos {
    marker-file: url(../img/tourism.svg);
    marker-allow-overlap: true;
    marker-height: 26;
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
#profil18km {
    [id = 1] {
        marker-file: url(../img/profil18km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
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
#profil28km {
    [id = 1] {
        marker-file: url(../img/profil28km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size*0.7;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -280;
        text-dx: 80;
        text-allow-overlap: true;
    }
}
#profil34km {
    [id = 1] {
        marker-file: url(../img/profil34km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size*0.7;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -280;
        text-dx: 80;
        text-allow-overlap: true;
    }
}
#profil48km {
    [id = 2] {
        marker-file: url(../img/profil48km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size*0.8;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -400;
        text-dx: 300;
        text-allow-overlap: true;
    }
}
#profil57km {
    [id = 2] {
        marker-file: url(../img/profil57km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size*0.8;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
        text-face-name: @sans;
        text-placement: point;
        text-fill: @black;
        text-character-spacing: 2;
        text-line-spacing: 2;
        text-wrap-width: 2000;
        text-halo-fill: @other_halo;
        text-halo-radius: 10;
        text-size: @profile_font_size;
        text-dy: -400;
        text-dx: 300;
        text-allow-overlap: true;
    }
}
#profil78km {
    [id = 3] {
        marker-file: url(../img/profil78km.png);
        marker-allow-overlap: true;
        marker-height: @profile_size;
        marker-opacity: 0.75;
        text-name:"'(c) Contributeurs OpenStreetMap - style OpenArdenneMap - Julien Minet (2022)'";
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

@vtt18km: #d95f02;
@vtt28km: #7570b3;
@vtt34km: #e7298a;
@vtt48km: #FFBF00;
@vtt57km: #2E2E2E;
@vtt78km: #2E2E2E;

@pink: #fc16e9;
@lo: 18;
@lop: 0.8;
@mk: 20;

#vtt18km {
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
#vtt34km {
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
#vtt48km {
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
#vtt57km {
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
