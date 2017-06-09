TEX=pdflatex -shell-excape -interaction=nonstopmode -file-line-error

all: PatApp.pdf

FILES=*.tex *.cls

PatApp.pdf: $(FILES) patentex.cls
	$(TEX) PatApp.tex
	$(TEX) PatApp.tex
	$(TEX) PatApp.tex

clean:
	rm -f *.out *.aux *.log

realclean:
	rm -f *.out *.aux *.log *.pdf
