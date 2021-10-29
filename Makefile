## This is mac-theobio/effects

current: target
-include target.mk

# -include makestuff/perl.def

Sources += Makefile

######################################################################

Sources += $(wildcard *.R *.md *.Rnw *.rmd *.bib *.css)

######################################################################

%.html.newpages: %.rmd
	echo "library(rmarkdown); render_site(\"$*.rmd\")" | R --slave
	$(MAKE) docs
	cp -a site_libs docs
	rm -rf site_libs
	cp $*.html docs
	cp _site.yml docs
	git add -f docs/$*.html docs/_site.yml docs/site_libs

######################################################################

# _site.yml:_site.yml;
style.css.docs: style.css

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


