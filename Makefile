TEX=pdflatex -recorder -shell-escape

all: pagetest.pdf

package:
	pp tikzlibrarypageref-protect.pl -o tikzlibrarypageref-protect

generate: tikzexternalpageref.ins
	pdflatex $<

doc: tikzexternalpageref.dtx
	latexmk -pdf $<

%.tex: generate ;

%.pdf: %.tex
	$(TEX) $<
	$(MAKE) -f $(basename $<).makefile
	$(TEX) $<
	$(TEX) $<
	$(MAKE) -f $(basename $<).makefile
	$(TEX) $<

test: pagetest.pdf
	@tests/simple.sh
