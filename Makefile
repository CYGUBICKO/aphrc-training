## This is mac-theobio/effects

current: target
-include target.mk

# -include makestuff/perl.def

Sources += Makefile

######################################################################

Sources += $(wildcard *.R *.md *.Rnw *.rmd *.bib)

######################################################################

# index.html: index.rmd
#	$(knithtml)

index.html.pages: index.rmd


######################################################################

### Makestuff

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls makestuff/Makefile

#-include makestuff/os.mk
#
#-include makestuff/texi.mk
#
#-include makestuff/pandoc.mk
#-include makestuff/git.mk
#-include makestuff/visual.mk
#
#-include makestuff/pipeR.mk


-include makestuff/os.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
-include makestuff/texdeps.mk
-include makestuff/pandoc.mk
## makestuff/stepR.md
-include makestuff/stepR.mk
-include makestuff/git.mk

