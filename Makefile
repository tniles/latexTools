# makefile for latex to pdf
#
# Set source file using 'export TEXSRC=filename' on the commandline
#
# USAGE:    
#       make all    - get the pdf output of the tex file
#       make clean  - delete all intermediate files
#
# suggested gui (for reference): texmaker
#
# THREE WAYS TO GO FROM TEX TO PDF:
#
# pdflatex myfile               # TeX → PDF
#   However, I've found pdflatex to have issues with graphics inclusion. Never bothered to debug it.
#
# latex myfile                  # TeX → DVI
# dvipdf myfile                 # DVI → PDF
#
# latex myfile                  # TeX → DVI
# dvips myfile -o myfile.ps     # DVI → PS
# ps2pdf myfile.ps myfile.pdf   # PS  → PDF

# supply tex source file here (via ENV var texsrc)
TEXFILE=$(TEXSRC)

all: finalOut
	@echo "Output generated from file(s):" $(TEXFILE)

finalOut: dviOut.o pdfOut.o

# run twice for tables (toc, figs, bib) to build correctly
dviOut.o:
	latex -interaction=nonstopmode -output-directory=$(AUXDIR) $(TEXFILE) 1> /dev/null
	latex -interaction=nonstopmode -output-directory=$(AUXDIR) $(TEXFILE) 1> /dev/null

pdfOut.o:
	dvipdf $(AUXDIR)/$(TEXFILE:.tex=.dvi) $(PDFDIR)/$(TEXFILE:.tex=.pdf)

# delete all intermediate and output files
clean:
	$(foreach cmd, $(TEXFILE:.tex=), rm -f $(AUXDIR)/$(cmd).aux $(AUXDIR)/$(cmd).dvi $(AUXDIR)/$(cmd).lof $(AUXDIR)/$(cmd).log $(AUXDIR)/$(cmd).lot $(AUXDIR)/$(cmd).toc)
