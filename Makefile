## https://github.com/CYGUBICKO/aphrc-training.git
## git remote set-url origin git@github.com:CYGUBICKO/aphrc-training.git

current: target
-include target.mk

# -include makestuff/perl.def

Sources += Makefile

######################################################################

Sources += $(wildcard *.R *.md *.Rnw *.rmd *.bib *.css)
Sources += docs/admin/schedule.csv

######################################################################

%.html.newpages: %.rmd
	echo "library(rmarkdown); render_site(\"$*.rmd\")" | R --slave
	$(MAKE) docs
	cp -a site_libs docs
	rm -rf site_libs
	cp $*.html docs
	cp _site.yml docs
	git add -f docs/$*.html docs/_site.yml docs/site_libs
	touch Makefile

%.pdf: %.rmd
	$(knitpdf)

## Extract R codes

%.R: %.rmd
	echo "library("knitr"); purl(\"$*.rmd\")" | R --slave

%: %.pdf ;

######################################################################

# _site.yml:_site.yml;
style.css.docs: style.css

index.html.newpages: index.rmd
training_outline.html.newpages: training_outline.rmd
useful_links.html.newpages: useful_links.rmd
your_turn.html.newpages: your_turn.rmd
about_me.html.newpages: about_me.rmd

######################################################################
## datasets
contraseptive.Rout: contraseptive.R
	$(pipeR)

######################################################################
## materials
### Introduction
introduction.pdf.docs: introduction.rmd
introduction.Rout: introduction.R
	$(pipeR)
introduction.R.docs: introduction.R

### Data manipulation
data_manipulation.pdf: data_manipulation.rmd
data_manipulation.R: data_manipulation.pdf

######################################################################
## Task sets
task_set1.html.newpages: task_set1.rmd
task_set2.html.newpages: task_set2.rmd


######################################################################
all:
	$(MAKE) style.css.docs
	$(MAKE) index.html.newpages
	$(MAKE) training_outline.html.newpages
	$(MAKE) useful_links.html.newpages
	$(MAKE) your_turn.html.newpages
	$(MAKE) about_me.html.newpages
	$(MAKE) introduction.pdf.docs
	$(MAKE) introduction.R.docs
	$(MAKE) task_set1.html.newpages
	$(MAKE) task_set2.html.newpages
	$(MAKE) contraseptive.R.docs
	$(MAKE) data_manipulation.R.docs
	$(MAKE) data_manipulation.pdf.docs

######################################################################

alldirs += data

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


