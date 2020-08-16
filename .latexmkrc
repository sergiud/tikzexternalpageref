@default_files = ('pagetest', 'tikzexternalpageref.dtx');

$pdflatex = 'pdflatex -recorder -synctex=-1 -shell-escape %O %S';
$pdf_mode = 1;

$makeindex = 'makeindex -s gind.ist %S'

# set vim: ft=perl tw=0
