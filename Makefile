## This is mac-theobio/effects

current: target
-include target.mk

# -include makestuff/perl.def

Sources += Makefile

######################################################################

Sources += $(wildcard *.R *.md *.Rnw *.rmd *.bib)


%.html.newpages: %.rmd
	$(MAKE) docs
	echo "library(rmarkdown); render_site(\"$*.rmd\")" | R --slave
	cp -a site_libs docs
	rm -rf site_libs
	cp $*.html docs
	git add -f docs/$*.html

######################################################################

_site.yml:_site.yml;
style.css: style.css;

index.html.newpages: index.rmd


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

-include makestuff/os.mk

-include makestuff/texi.mk

-include makestuff/pandoc.mk
-include makestuff/git.mk
-include makestuff/visual.mk

-include makestuff/pipeR.mk


