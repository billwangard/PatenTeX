TEX=pdflatex -shell-excape -interaction=nonstopmode -file-line-error

NAME=PatApp

all: $(NAME).pdf

FILES=sections/*.tex *.tex *.cls

$(NAME).pdf: $(FILES) patentex.cls
	$(TEX) $(NAME).tex
	$(TEX) $(NAME).tex
	$(TEX) $(NAME).tex

clean:
	rm -f *.out *.aux *.log

realclean:
	rm -f *.out *.aux *.log *.pdf
