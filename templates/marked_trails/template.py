#import svgwrite

from pyx import canvas, svgfile, trafo


def fill_template(parameters):
    """ Fill a svg template """

    print('fill svg template')

    c = canvas.canvas()

    #TODO: insert the map and scale it, or scale it and insert it, and lower to bottom
    ### insert maps
    # TODO first insert the map before other elements
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_background.svg"), [trafo.scale(0.18)])

    ### insert template
    c.insert(svgfile.svgfile(0, 0, f"../A3-{parameters.ORIENTATION.lower()}.svg"))

    ### insert marked trail list
    c.insert(svgfile.svgfile(0.55, 14, f"marked-trails-{parameters.TITLE}.svg"))


    #c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_labels.svg"))


    ### Output final file
    c.writeSVGfile(f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}.svg")



    # add other svg files
    # image = dwg.add(dwg.image(href=(svgdata), insert=(x,y), height=height, width=width))