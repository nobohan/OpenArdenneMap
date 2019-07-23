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
    [buildings_legend_name = 'building'] { text-name:"'Bâti'"; }
    [bridge_symbol_legend = 'bridge'] { text-name:"'Passerelle'"; }
    [type = 'ruins'] { text-name:"'Ruines, site archéologique'"; }
    [type = 'wayside_cross'] { text-name:"'Croix'"; }
    [point_features = 'picnic_table'] { text-name:"'Table de picnic'"; }
    [point_features = 'fountain'] { text-name:"'Fontaine, lavoir'"; }
    [point_features = 'bench'] { text-name:"'Banc'"; }
    [point_features = 'parking'] { text-name:"'Parking'"; }
    [point_features = 'waste_basket'] { text-name:"'Poubelle'"; }
    [point_features = 'recycling'] { text-name:"'Bulle à verres'"; }
    [type = 'stop_position'] {
        ['bus' = 'yes'] {
            text-name:"'Arrêt de bus'";
        }
    }
    [type = 'city'] {text-name: "Ville";}
    [type = 'village'] {text-name: "Village";}
    [type = 'hamlet'] {text-name: "Hameau";}
    [type = 'level_crossing'] {
       text-name:"'Passage à niveau'";
       text-allow-overlap:true;
       text-halo-fill: @rose;
       text-halo-radius: 20;
    }
}


/* special style for some stuffs */
#sidewalk
    { [sidewalk="sidewalk"] {
        line-color: @vertpale;
        line-cap: butt;
        line-width: 8;
        line-offset: 8;
    }
}

#water_legend {
    [type='water'] {
        polygon-fill: @water;
        line-color: @blue;
    }
}


#waterway_legend {
    [waterway_legend='river'] {
        line-color: @blue;
        line-width: 16;
    }
    [waterway_legend='stream'] {
        line-color: @blue;
        line-width: 6;
    }
}
#waterway_legend::top {
    [waterway_legend='river'] {
        line-width: 12;
        line-color: @water;
    }
}


#bridge_symbol_legend {
    [bridge_symbol_legend='bridge']{
        marker-file: url(../img/bridge.svg);
        marker-height: 16;
    }
}

#buildings_legend {
    [buildings_legend='building']{
        polygon-fill: @building;
        line-width: 2;
        line-color: @black;
    }
    [buildings_legend='church'] {
        polygon-fill: @building;
        line-width: 2;
        line-color: @black;
    }
}
#buildings_legend::top {
    [buildings_legend='church'] {
        marker-file: url(../img/cross.svg);
        marker-height: 40;
        marker-transform: rotate(90);
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
        marker-allow-overlap: true;
    }
    [type = 'tower'], [type = 'mast'] {
        marker-file: url(../img/tower.svg);
        marker-height: 4;
        marker-allow-overlap:true;
    }
    [point_features = 'fountain'] {
        marker-file: url(../img/fountain.svg);
        marker-height: 25;
        marker-allow-overlap:true;
    }
    [point_features = 'parking'] {
        marker-file: url(../img/parking-fill.svg);
        marker-height: 25;
        marker-allow-overlap:true;
    }
    [point_features = 'recycling'] {
        marker-file: url(../img/glass-recycling.svg);
        marker-height: 25;
        marker-allow-overlap:true;
    }
    [point_features = 'bench'] {
        marker-file: url(../img/bench.svg);
        marker-height: 25;
        marker-allow-overlap:true;
    }
    [point_features = 'waste_basket'] {
        marker-file: url(../img/trashbin.svg);
        marker-height: 25;
        marker-allow-overlap:true;
    }
}

#train_elements_legend {
  [type='level_crossing'] {
    marker-file: url(../img/level-crossing.svg);
    marker-height: 30;
  }
}
