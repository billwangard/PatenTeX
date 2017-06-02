TEX=pdflatex -shell-excape -interaction=nonstopmode -file-line-error

all: PatApp.pdf

PatApp.pdf: PatApp.tex patentex.cls
	$(TEX) PatApp.tex
	$(TEX) PatApp.tex
	$(TEX) PatApp.tex

clean:
	rm -f *.out *.aux *.log

realclean:
	rm -f *.out *.aux *.log *.pdf
