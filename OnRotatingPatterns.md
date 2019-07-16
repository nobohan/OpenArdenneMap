How to effectively rotate patterns?
-------------------------------------


Since the rotation introduces some white space around the pattern, how to seamlessly cope with this bug?


# 1) Using a translation of the pattern

/!\ When the pattern is the same with the same angle, it does not repeat at all. Hack: change the rotation angle of a tiny value or change the file name.


#landuse::top2 {
    [type='farmland'] {
        polygon-pattern-file: url(../img/farmland-red.svg);
        polygon-pattern-transform:"translate(500, 500) rotate(35)";
    }
}

#landuse::top3 {
    [type='farmland'] {
        polygon-pattern-file: url(../img/farmland-green.svg);
        polygon-pattern-transform:"translate(-500, -500) rotate(35)";
    }
}

# 2) Using the scaling

#landuse::top2 {
    [type='farmland'] {
        polygon-pattern-file: url(../img/pattern-red.svg);
        polygon-pattern-transform:"scale(3) rotate(36)";
    }
}

#landuse::top3 {
    [type='farmland'] {
        polygon-pattern-file: url(../img/pattern-green.svg);
        polygon-pattern-transform:"scale(2) rotate(36.5)";
    }
}

#landuse::top4 {
    [type='farmland'] {
        polygon-pattern-file: url(../img/pattern-green.svg);
        polygon-pattern-transform:"scale(4) rotate(36.5)";
    }
}

This should work, but actually not as expected...

# END) Option du pire, mais qui marche

* Faire des patterns carrés rotationnés par pas de x degrés, sur un quadrant de 0 à 90°. Ne pas rotationer ces patterns avec Mapnik mais avec Inkscape, sauf une rotation de 90° lorsque c'est nécessaire, étant donné qu'une rotation de 90° sur un pattern carré est bien géré par Mapnik.

  - Dans Inkscape, faire un pattern horizontal qui est le modèle et qui dépasse de la taille du document (100 x 100) afin que les rotations ne fassent pas apparaitre de zones blanches.
  - Utiliser la fonctionnalité Object>Transform>Rotate pour rotationner les patterns et faire des fichiers rotationnés par un certain pas d'angle (5 ou 10°).
  - Lorsque la rotation est faite dans Inkscape, cela ajoute une matrice de transformation dans le fichier SVG que Mapnik interpréte mal (il l'interprete exactement comme les instructions de `polygon-pattern-transform`). On peut appliquer ces matrices de transformation directement sur les SVG avec un plugin de Inkscape: https://github.com/Klowner/inkscape-applytransforms
  - Une fois ces transformations appliquées, il faut enfin découper le pattern par la taille du document Inkscape. Comme Mapnik ne peut pas interpréter le flag 'clip' du SVG, nous découpons chaque morceau du pattern par Path>Cut path. C'est un peu fastidieux mais avec un raccourci clavier, ça va assez vite.
  - Les patterns doivent être "continus" entre eux: les lignes démarrant sur une tuile doivent suivre sur une autre. Je n'ai pas trouvé de formules  / méthode mathématiques pour le faire automatiquement, mais les patterns ont été édités à la main dans Inkscape.

* Choisir ces patterns selon l'angle calculé dans cartoCSS

```css
      [orientation > 20 ] { polygon-pattern-file: url(../img/pattern-20.svg); }
```

Pour des angles entre 90° et 180°, on peut réutiliser les fichiers et leur appliquer une rotation de 90°.
Pour des angles > 180°, on peut également réutiliser les règles de la même façon que de 0 à 180°.
