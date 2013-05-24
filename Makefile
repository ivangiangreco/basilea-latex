#
#  Thanks to Kevin Urban for providing this makefile.
#  Jul 2012
#

# choose which latex compiler you want to use (xelatex or pdflatex)
TEX = pdflatex


################
# stop editing #
################
latexfile = Thesis

# rerun pdf generation until it doesn't say rerun anymore
$(latexfile).pdf: $(latexfile).bbl
	while ($(TEX) $(latexfile); grep -q "Rerun to get cross" $(latexfile).log); do true; done

$(latexfile).bbl: $(latexfile).aux
	bibtex $(latexfile)

$(latexfile).aux: $(latexfile).tex
	$(TEX) $(latexfile)

clean:
	rm *.aux
	rm *.bbl
