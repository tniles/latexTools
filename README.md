################################ ################################ ##################
Sample LaTeX functional environment

I used LaTeX for my master's thesis and use it on an ongoing basis for my resume.

################################ ################################ ##################


If anything starts building oddly, check the *.log for errors or warnings.

LaTeX command (output: %.dvi):
    latex -interaction=nonstopmode %.tex

DVI>PDF command (output: %.pdf):
    dvipdfm %.dvi

Try this sometime:
     latex -interaction=nonstopmode %.tex|bibtex %.aux|latex -interaction=nonstopmode %.tex|latex -interaction=nonstopmode %.tex|xdvi %.dvi

The latex engine only supports *.eps images. The easy way to get eps images is to use
    convert image.png image.eps

################################
 Notes On Templates vs Classes
################################
    (From http://tex.stackexchange.com/questions/51204/working-with-templates)
    Many times I see people on this site talking about templates when I think they are really 
    talking about classes. What is the difference? To me, if a LaTeX file provides the look 
    and feel--and macros to facilitate the formatting--of a specific type of document it is a
    class. If it provides boilerplate content to be re-used or changed as necessary then it's
    a template. To put it another way, if the provided file all belongs in the preamble it is 
    a class, and if it it includes document text it's a template.




