import svgwrite
import datetime
from pyx import canvas, svgfile, trafo


def fill_template(parameters):
    """ Fill a svg template """

    print('fill svg template')

    c = canvas.canvas()

    title_svg = svgwrite.Drawing('title.svg', size=('6cm', '2cm'), profile='full')
    title_svg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    title_svg.embed_stylesheet("""
    .alfphabetTitle {
        font-family: "Alfphabet";
        font-size: 38;
    }
    """)
    paragraph = title_svg.add(title_svg.g(class_="alfphabetTitle", ))
    paragraph.add(title_svg.text(parameters.TITLE.upper(), insert=(1, 1), fill='black'))
    title_svg.save()

    ### insert map background
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_background.svg"), [trafo.scale(0.18)])
    print(datetime.datetime.now())
    print('inserted map')

    ### insert map labels
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_labels.svg"), [trafo.scale(0.18)])
    print(datetime.datetime.now())
    print('inserted labels') 
    # TODO: add svg layers for better handling of the label layer see https://pyx-project.org/manual/canvas.html?highlight=group

    ### insert template
    c.insert(svgfile.svgfile(0, 0, f"../A3-{parameters.ORIENTATION.lower()}.svg"))
    print(datetime.datetime.now())
    print('inserted templates')

    ### insert marked trail list
    c.insert(svgfile.svgfile(0.55, 14, f"marked-trails-{parameters.TITLE}.svg"))
    print(datetime.datetime.now())
    print('inserted marked trails')

    ### insert title
    c.insert(svgfile.svgfile(0.7, 26.5, "title.svg"))

    ### Output final file
    c.writeSVGfile(f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}.svg")

    print(datetime.datetime.now())
