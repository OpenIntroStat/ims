all: isrs.pdf

isrs.pdf: main.tex eoce.bib
	pdflatex main
	bibtex main
	makeindex main
	pdflatex main
	bibtex main
	makeindex main
	pdflatex main

clean: 
	rm *.idx *.ilg *.ind
