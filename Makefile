all: Figs JS

.PHONY: all tar Figs JS web weball

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

Figs: Figs/intercross.png Figs/lodcurve_insulin.png Figs/qtl_data.png Figs/Mtb/mcmc01.png Figs/Mtb/mut1.png Figs/permtest.png

JS: JS/lod_and_effect.js JS/lod_onetime_random.js JS/handle_stickies.js JS/em_alg.js JS/scatterplot.js JS/panelutil.js JS/corr_w_scatter.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH ${R_OPTS} $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

Figs/Mtb/mcmc01.png: R/Mtb/mcmc_example.R R/Mtb/gyanu_results_nov02.RData R/Mtb/mtb_analysis.R
	cd $(<D);R CMD BATCH ${R_OPTS} $(<F)

Figs/Mtb/mut1.png: R/Mtb/mut_figs.R
	cd $(<D);R CMD BATCH ${R_OPTS} $(<F)

web:
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching

weball: JS Figs
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/
	scp JS/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/JS/
	scp Coffee/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Coffee/
	scp CSS/* broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/CSS/
	scp Figs/*.png broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Figs/
	scp Figs/*.jpg broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Figs/
	scp Figs/Mtb/*.png broman-9.biostat.wisc.edu:public_html/presentations/iGraphs4Teaching/Figs/Mtb/

tar: all
	cd ..;tar czhf iGraphs4Teaching.tgz iGraphs4Teaching/[A-Za-z]*
