PROJECT=report
OUTPUT=output
TEX=pdflatex
TEX_FLAGS=-output-directory ${OUTPUT}
BIBTEX=bibtex
LILLYPOND=/Applications/LilyPond.app/Contents/Resources/bin/lilypond-book
LILLYPOND_FLAGS=--output=${OUTPUT} --pdf

.PHONY: clean view

default:
	mkdir -p ${OUTPUT};
	${LILLYPOND} ${LILLYPOND_FLAGS} ${PROJECT}.tex
	cp -R gfx ${OUTPUT};
	cp *.bib ${OUTPUT};
	cd ${OUTPUT}; ${TEX} ${PROJECT};
	cd ${OUTPUT}; ${BIBTEX} ${PROJECT};
	cd ${OUTPUT}; ${TEX} ${PROJECT};
	cd ${OUTPUT}; ${TEX} ${PROJECT};
	open ${OUTPUT}/${PROJECT}.pdf;

clean:
	rm -rf ${OUTPUT}
