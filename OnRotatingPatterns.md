How to effectively rotate patterns?
-------------------------------------


Since the rotation introduces some white space around the pattern, how to seamlessly cope with this bug.


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



# END) Option du pire


* Faire des patterns rotationnés par pas de x degrés, sur un quadrant de 0 à 90°
* choisir ces patterns selon l'angle calculés.
* Ne pas rotationner ces patterns
