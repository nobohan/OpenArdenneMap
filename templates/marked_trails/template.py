#import svgwrite
import datetime
from pyx import canvas, svgfile, trafo


def fill_template(parameters):
    """ Fill a svg template """

    print('fill svg template')

    c = canvas.canvas()

    ### insert map background
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_background.svg"), [trafo.scale(0.18)])
    print(datetime.datetime.now())
    print('inserted map')

    ### insert map labels
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_labels.svg"), [trafo.scale(0.18)])
    print(datetime.datetime.now())
    print('inserted labels') 
    # TODO: remove the white rectangle of the label map, or make it transparent (background transparent dans le mapnik map file? )

    ### insert template
    c.insert(svgfile.svgfile(0, 0, f"../A3-{parameters.ORIENTATION.lower()}.svg"))
    print(datetime.datetime.now())
    print('inserted templates')

    ### insert marked trail list
    c.insert(svgfile.svgfile(0.55, 14, f"marked-trails-{parameters.TITLE}.svg"))
    print(datetime.datetime.now())
    print('inserted marked trails')

    ### Output final file
    c.writeSVGfile(f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}.svg")

    print(datetime.datetime.now())
    # add other svg files
    # image = dwg.add(dwg.image(href=(svgdata), insert=(x,y), height=height, width=width))