/* TODO: Add line layer, add lines, point, and polygon in legend.geojson, add label in legend_label.mss */

/* legend variables */

@black : #333333;
@font_size : 36;
@font_color: @black;
@font: @sans;

/* items definition */
#legend_labels{
    text-face-name:@font;
    text-fill:@font_color;
    text-size:@font_size;
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
    [type='residential'] { text-name:"'Bâti'";}
    [type='industrial'] { text-name:"'Zone industrielle'";}
    [type='cemetery'] { text-name:"'Cimetière'";}
    [type='camp_site'] { text-name:"'Camping'";}
    [waterway_legend='river'] {text-name: "'Rivière'";}
    [waterway_legend='stream'] {text-name: "'Ruisseau'";}
    [type='water'] { text-name:"'Étang, lac'";}
    [type='hedge'] {text-name:"'Haie, rangée d\'arbres'";}
    [type='line'] {text-name:"'Ligne électrique'"; text-allow-overlap: true;}
    [type='motorway'] { text-name: "'Autoroute'"}
    [type='primary'] { text-name: "'Route primaire'"}
    [type='secondary'] { text-name: "'Route secondaire'"}
    [type='tertiary'] { text-name: "'Route mineure'"}
    [sidewalk='sidewalk'] { text-name: "'Route avec trottoir'"}
    [tracktype='grade1'] { text-name: "'Chemin carrossable'"}
    [tracktype='grade3'] { text-name: "'Chemin'"}
    [stylegroup='noauto'] { text-name: "'Sentier'"}
    [stylegroup='railway'] { text-name: "'Voie ferrée'"}
    [type = 'tower'], [type = 'mast'] {
        ['tower_type' = 'communication'] {
            text-name:"'Pylône'";
        }
    }
    [point_features = 'school'] { text-name:"'École'"; }
    [buildings_legend = 'church'] { text-name:"'Église'"; }
    [bridge_symbol_legend = 'bridge'] { text-name:"'Passerelle'"; }
    [type = 'ruins'] { text-name:"'Ruines, site archéologique'"; }
    [type = 'wayside_cross'] { text-name:"'Croix'"; }
    [point_features = 'picnic_table'] { text-name:"'Table de picnic'"; }
    [type = 'fountain'] { text-name:"'Fontaine, lavoir'"; }
    [type = 'stop_position'] {
        ['bus' = 'yes'] {
            text-name:"'Arrêt de bus'";
        }
    }
    [type = 'city'] {text-name: "Ville";}
    [type = 'village'] {text-name: "Village";}
    [type = 'hamlet'] {text-name: "Hameau";}
}


/* special style for some stuffs */
#sidewalk [sidewalk="sidewalk"] {
    line-color: darken(@green, 40%);
    line-cap: butt;
    line-width: 8;
    line-offset: 8;
}



#water_legend{
    [type='water'] {
        polygon-fill: @water;
        line-color: @darkblue;
    }
}


#waterway_legend {
    line-color: @darkblue;
    [waterway_legend='river'] {
        line-width: 16;
    }
    [waterway_legend='stream'] {
        line-width: 6;
    }
}
#waterway_legend::top [waterway_legend='river'] {
  line-width: 12;
  line-color: @water;
}


#bridge_symbol_legend {
    [bridge_symbol_legend='bridge']{
        marker-file: url(../img/bridge.svg);
        marker-height: 16;
    }
}

#buildings_legend {
    [buildings_legend='church'] {
        marker-file: url(../img/church.svg);
        marker-height: 40;
        marker-transform: rotate(180);
    }
}

#point_features {
    [point_features = "school"] {
        text-face-name: @sans;
        text-name: "'Éc.'";
        text-size: 40;
    }
    [point_features = 'picnic_table'] {
        marker-file: url(../img/picnic.svg);
        marker-height: 12;
        marker-allow-overlap: true; /* always render */
    }
    [type = 'tower'], [type = 'mast'] {
        marker-file: url(../img/tower.svg);
        marker-height: 4;
        marker-allow-overlap:true;
    }
}
