import svgwrite

from pyx import *


def fill_template():
    """ Fill a svg template """

    print('fill svg template')

    #TODO start with a template
    c = canvas.canvas()
    c.insert(svgfile.svgfile(0, 0, "../A3-landscape.svg"))
    c.writeSVGfile("output")



    # add other svg files
    # image = dwg.add(dwg.image(href=(svgdata), insert=(x,y), height=height, width=width))