@default_files = ('tikzexternalpageref.dtx');

$pdflatex = 'pdflatex -recorder -synctex=-1 %O %S';
$pdf_mode = 1;

$makeindex = 'makeindex -s gind.ist %S'

# set vim: ft=perl tw=0
