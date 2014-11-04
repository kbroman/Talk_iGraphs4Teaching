all: Figs JS

.PHONY: all tar Figs JS web weball


Figs: Figs/intercross.png Figs/lodcurve_insulin.png Figs/qtl_data.png

JS: JS/lod_and_effect.js JS/lod_onetime_random.js JS/handle_stickies.js JS/em_alg.js JS/scatterplot.js JS/panelutil.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web:
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching

weball: JS Figs
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/
	scp JS/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/JS/
	scp Coffee/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Coffee/
	scp CSS/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/CSS/
	scp Figs/*.png broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Figs/
	scp Figs/*.jpg broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Figs/

tar: all
	cd ..;tar czhf iGraphs4Teaching.tgz iGraphs4Teaching/[A-Za-z]*
