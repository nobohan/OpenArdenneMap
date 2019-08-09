/* legend variables */

@black : #333333;
@font_size : 36;
@font_color: @black;
@font: @sans;

/* items definition */
#legend_labels{
    text-face-name: @font;
    text-fill: @font_color;
    text-size: @font_size;
    text-dx: 180;
    text-dy: 0;
    text-character-spacing: 1.5;
    text-allow-overlap: false;
    text-name:"";
    [type='forest'] { text-name:"'Forêt mixte'";}
    [type='forest'][leaf_type='broadleaved']{ text-name:"'Feuillus'";}
    [type='forest'][leaf_type='needleleaved']{ text-name:"'Conifères'";}
    [type='scrub'] { text-name:"'Lande, bruyère'";}
    [type='farmland'] { text-name:"'Terre cultivée'";}
    [type='meadow'] { text-name:"'Prairie'";}
    [type='orchard'] { text-name:"'Verger'";}
    [type='christmas_trees'] { text-name:"'Sapins de Noël'";}
    [type='industrial'] { text-name:"'Zone industrielle'";}
    [type='cemetery'] { text-name:"'Cimetière'";}
    [type='camp_site'] { text-name:"'Camping'";}
    [waterway_legend='river'] {text-name: "'Rivière'";}
    [waterway_legend='stream'] {text-name: "'Ruisseau'";}
    [waterway_legend='drain'] {text-name: "'Fossé'";}
    [type='wetland'] { text-name:"'Zone humide'";}
    [type='water'] { text-name:"'Étang, lac'";}
    [line='hedge'] {text-name:"'Haie'";}
    [line='line'] {text-name:"'Ligne électrique'"; text-allow-overlap: true;}
    [type='embankment'] {text-name:"'Talus'";}
    [type='cliff'] {text-name:"'Falaise, rochers'";}
    [type='motorway'] { text-name: "'Autoroute'"}
    [type='primary'] { text-name: "'Route primaire'"}
    [type='secondary'] { text-name: "'Route secondaire'"}
    [type='tertiary'] { text-name: "'Route mineure'"}
    [type='primary'] { text-name: "'Route primaire'"}
    [tracktype='grade1'] { text-name: "'Bon chemin'"}
    [tracktype='grade3'] { text-name: "'Chemin moyen'"}
    [tracktype='grade5'] { text-name: "'Mauvais chemin'"}
    [stylegroup='noauto'] { text-name: "'Sentier'"}
    [type='cutline'] { text-name: "'Coupe-feu'"}
    [stylegroup='railway'] { text-name: "'Voie ferrée'"}
    [point_features = 'tower'] {
        ['tower_type' = 'communication'] {
            text-name:"'Pylône'";
        }
    }
    [point_features = 'farm'] { text-name:"'Ferme'"; }
    [point_features = 'school'] { text-name:"'École'"; }
    [type = 'church'] { text-name:"'Église'"; }
    [type = 'bridge'] { text-name:"'Passerelle'"; }
    [point_features = 'ruins'] { text-name:"'Ruines, site archéologique'"; }
    [point_features = 'wayside_cross'] { text-name:"'Croix'"; }
    [point_features = 'picnic_table'] { text-name:"'Table de picnic'"; }
    [type = 'fountain'] { text-name:"'Fontaine, lavoir'"; }
    [point_features = 'stop_position'] {
        ['bus' = 'yes'] {
            text-name:"'Arrêt de bus'";
        }
    }
    [type = 'city'] {text-name: "Ville";}
    [type = 'village'] {text-name: "Village";}
    [type = 'hamlet'] {text-name: "Hameau";}
}


/* special style for some stuffs */
#water_legend {
    [type='water'] {
        polygon-fill: @water;
        line-color: @blue;
    }
}


#waterway_legend {
    [waterway_legend='river'] {
        line-color: @darkblue;
        line-width: 16;
    }
    [waterway_legend='stream'] {
        line-color: @darkblue;
        line-width: 4;
    }
    [waterway_legend='ditch'] {
        line-color: @darkblue;
        line-width: 3;
    }
}
#waterway_legend::top {
    [waterway_legend='river'] {
        line-width: 12;
        line-color: @blue;
    }
}


#water_legend{
    [type='water'] {
        polygon-fill: @water;
        line-color: @darkblue;
    }
}

#bridge_symbol_legend{
    [type='bridge']{
        marker-file: url(../img/bridge.svg);
        marker-height: 16;
    }
}

#buildings_legend {
    [type='church'] {
        marker-file: url(../img/church.svg);
        marker-height: 40;
        marker-transform: rotate(180);
    }
}

#line_features {
  [line = 'hedge'] {
    line-color: darken(@green,30%);
    line-dasharray: 3,5;
    line-width: 4;
  }
  [line = 'line'] {
    line-color: @black;
    line-width: 4;
  }
}

#point_features {
    [point_features = 'picnic_table'] {
        marker-file: url(../img/picnic.svg);
        marker-height: 12;
        marker-allow-overlap: true;
    }
    [point_features = 'tower'], [type = 'mast'] {
        marker-file: url(../img/tower.svg);
        marker-height: 4;
        marker-allow-overlap: true;
        text-name: "'Pyl.'";
        text-size: @text_size_xs;
        text-face-name: @font;
        text-fill: @font_color;
        text-dy: 12;
        text-allow-overlap: true;
    }
    [point_features = 'ruins'] {
        marker-file: url(../img/ruins.svg);
        marker-height: 12;
        marker-allow-overlap: true;
    }
    [point_features = 'wayside_cross'] {
        marker-file: url(../img/cross.svg);
        marker-height: 22;
        marker-allow-overlap: true;
    }
    [point_features = 'farm'] {
        text-name: "'Fme'";
        text-size: @font_size;
        text-face-name: @font;
        text-fill: @font_color;
    }
    [point_features = 'school'] {
        text-name: "'Éc.'";
        text-size: @font_size;
        text-face-name: @font;
        text-fill: @font_color;
    }
    [point_features = 'stop_position'] {
        text-name: "'Bus'";
        text-size: @text_size_xs;
        text-face-name: @font;
        text-fill: @font_color;
        text-dy: 12;
        marker-file: url(../img/bus.svg);
        marker-height: 12;
        marker-allow-overlap: true;
    }

}

#place_legend {
    text-placement: point;
    text-allow-overlap: true;
    text-face-name: @sans;
    text-name: "";
    text-character-spacing: 2;
    [type='city'] {
        text-name: "Bastogne";
        text-size: 70;
    }
    [type='village'] {
        text-name: "Wisembach";
        text-size: 52;
    }
    [type='hamlet'] {
        text-name: "'Hoûte-si-Ploût'";
        text-size: 36;
    }
}
