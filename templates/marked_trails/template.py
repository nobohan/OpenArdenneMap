import svgwrite
import datetime
from pyx import canvas, svgfile, trafo


def make_title_svg(title):
    """Make a dummy svg file with the title of the map written in Alfphabet 38pt """

    title_svg = svgwrite.Drawing('title.svg', size=('6cm', '1cm'), profile='full')
    title_svg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    title_svg.embed_stylesheet("""
    .alfphabetTitle {
        font-family: "Alfphabet";
        font-size: 38;
    }
    """)
    paragraph = title_svg.add(title_svg.g(class_="alfphabetTitle", ))
    paragraph.add(title_svg.text(title, insert=(1, 1), fill='black'))
    title_svg.save()


def make_date_svg():
    """Make a dummy svg file with the current date written in Alfphabet 12pt """

    today_str = f"Carte éditée le {datetime.date.today().strftime('%d/%m/%Y')}"
    date_svg = svgwrite.Drawing('date.svg', size=('6cm', '1cm'), profile='full')
    date_svg.embed_font(name="Alfphabet", filename='../../fonts/Alfphabet-III.otf')
    date_svg.embed_stylesheet("""
    .alfphabetTitle {
        font-family: "Alfphabet";
        font-size: 12;
    }
    """)
    paragraph = date_svg.add(date_svg.g(class_="alfphabetTitle", ))
    paragraph.add(date_svg.text(today_str, insert=(1, 1), fill='black'))
    date_svg.save()

def fill_template(parameters):
    """ Fill a svg template """

    print(datetime.datetime.now())
    print('fill svg template')

    c = canvas.canvas()

    # TODO: factorise insertion dimensions numbers + manage Landscape/portrait
    # TODO: add svg layers for better handling of the label layer see https://pyx-project.org/manual/canvas.html?highlight=group

    ### insert map background
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_background.svg"), [trafo.scale(0.18)])
    print('inserted map')

    ### insert map labels
    c.insert(svgfile.svgfile(3, 3, f"OAM_20000_{parameters.TITLE}_{parameters.ORIENTATION}_labels.svg"), [trafo.scale(0.18)])
    print('inserted labels')

    ### insert template
    c.insert(svgfile.svgfile(0, 0, f"../src/A3-{parameters.ORIENTATION.lower()}.svg"))
    print('inserted templates')

    ### insert marked trail list
    c.insert(svgfile.svgfile(0.55, 14, f"marked-trails-{parameters.TITLE}.svg"))
    print('inserted marked trails')

    X_MARGIN = 0.75

    ### insert title
    make_title_svg(parameters.TITLE.upper())
    c.insert(svgfile.svgfile(X_MARGIN, 27.4, "title.svg"))

    ### insert date annotation
    make_date_svg()
    c.insert(svgfile.svgfile(X_MARGIN, -0.25, "date.svg"))

    ### insert timestamp annotations
    c.insert(svgfile.svgfile(8.9, 26.8, "timestamp_track.svg"))
    c.insert(svgfile.svgfile(8.9, 26.4, "timestamp_marked.svg"))

    ### insert distance annotations
    c.insert(svgfile.svgfile(37.1, 26.8, "distance_track.svg"))
    c.insert(svgfile.svgfile(37.3, 26.4, "distance_marked.svg"))
    print('inserted title, date, annotations')

    ### insert count trail annotations
    c.insert(svgfile.svgfile(X_MARGIN, 26, "count_trails.svg"))
    print('inserted count trails')
    print('start saving the SVG file, it does take a while...')


    ### Output final file
    c.writeSVGfile(f"A3-{parameters.ORIENTATION.lower()}-{parameters.TITLE.upper()}.svg")

    print(datetime.datetime.now())
