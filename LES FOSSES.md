LES FOSSES
===========


# Format 

A0 = 841 x 1 189 mm ou bien 1 m x ... ? 

# Special map features:

haies plus détaillées si échelle < 1:15000

# Special map composition 

??

- map belgique: ajouter foret!
- autres élements, logo osm
- grille km: ok
- age des données

# Carte

- déplacement des labels? 
- export en jpg ou svg? 
- trouver un truc pour prendre le fichier jpg et le cropper (par ex. un crop bien déterminé dans GIMP)
        slice using guides!

        X1: 30 mm
        X2: 811 mm
        Ytop: 50 mm
        Y bottom: 990 + 50 = 1040 mm

GIMP

1) Créer un fichier blanc au format AO (en rentrant les mm ): 841 x 1 189 mm, 300 dpi (1.3Go!)
2) Ajouter comme Layer l'image en jpg (File > Open as Layer)
3) Aller dans Layer > Scale layer et scaler au format A0 (en rentrant les mm)
4) Slices with guides






Super qualité: faire le fond en jpeg puis y superposer une couche de labels en svg: mauvais import du svg: labels noir non visibles...

Q1: utiliser un fond en pdf??? (car le svg ne veut pas se créer > A3...) ? pas possible d'en importer

Q2: comment importer proprement les labels en svg (ils sont "tout blancs". ) ? 

Autre solution: faire la compo finale dans inkscape: 

- ajouter tous les elements QGIS de mise en page, en SVG
- ajouter un fond raster, ~~ou pdf importé~~
- ajouter les labels en svg
- exporter le tout en pdf!





Age des données

BBOX = 601164.4436215056,6393231.844132286,620635.5563784944,6420768.155867714

BBOX = 601164, 6393231, 620635, 6420768


SELECT to_timestamp(avg(extract(epoch from osm_timestamp::timestamp)))
    FROM planet_osm_line
    WHERE
        highway IN ('track', 'path', 'footway', 'cycleway', 'bridleway')
        AND ST_Contains(ST_SetSRID(ST_MakeBox2D(ST_Point(601164, 6393231), ST_Point(620635, 6420768)), 3857 ), way)

