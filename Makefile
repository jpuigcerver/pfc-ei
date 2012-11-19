all: pdf

ps: memoria.ps

pdf: memoria.pdf

2ps: memoria.ps
	pstops -pa4 '1:0@1.4(-1.5cm,-4cm)' memoria.ps > memoria.big.ps 
	psnup -2  memoria.big.ps > memoria.2p.ps

#fig:
#	cd img && gnuplot err.plt && cd ..

CHAPTERS=introduccio.tex segmentacio.tex corpus.tex \
experiments.tex conclusions.tex

quick: memoria.tex $(CHAPTERS)
	latex memoria.tex
	dvi2ps memoria.dvi -o memoria.ps

memoria.ps: memoria.tex $(CHAPTERS)
	latex memoria.tex
	bibtex memoria
	latex memoria.tex
	latex memoria.tex
	dvips memoria.dvi -o memoria.ps

memoria.pdf: memoria.ps
	ps2pdf memoria.ps

clean: 
	rm -f *.lot *.lof *.dvi *.log *.aux *.toc *.bbl *.blg *~

distclean: clean
	rm -f memoria.ps memoria.pdf
