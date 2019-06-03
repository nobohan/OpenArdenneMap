import subprocess

FACTOR = 5.46
PTS2MM = 0.3528

# get pdf size
file = 'cambron'
pdffile = file + '.pdf'
#txt = subprocess.check_output('pdfinfo ' + file + ' | grep "Page size"' )
txt = str(subprocess.check_output(['pdfinfo', pdffile]))
i = txt.find('Page size')
w = txt[i+16:i+20]
print(w)
h = txt[i+23:i+27]
print(h)

# set pdf to the A4 format
width = str(int(int(w)/FACTOR*PTS2MM))
height = str(int(int(h)/FACTOR*PTS2MM))
orientation = 'no-landscape' if h > w else 'landscape'
print(orientation)
subprocess.call(
    'pdfjam --outfile ' + file + '_small.pdf --' + orientation + ' --papersize \'{' + width + 'mm,' + height + 'mm}\' ' + pdffile,
    shell=True
)

subprocess.call(
    'pdfjam --outfile ' + file + '_A4.pdf --' + orientation + ' --paper a4paper ' + file + '_small.pdf',
    shell=True
)
