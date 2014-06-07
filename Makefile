PROJECT=report
OUTPUT=output
TEX=pdflatex
FLAGS=-output-directory ${OUTPUT}
BIBTEX=bibtex

.PHONY: clean view

default:
	${TEX} ${PROJECT};
	${BIBTEX} ${PROJECT};
	${TEX} ${PROJECT};
	${TEX} ${PROJECT};
	open${PROJECT}.pdf;

default:
	mkdir -p ${OUTPUT};
	${TEX} ${FLAGS} ${PROJECT}.tex;

full: default
	cp *.bib ${OUTPUT};
	cd ${OUTPUT}; ${BIBTEX} ${PROJECT};
	${TEX} ${FLAGS} ${PROJECT}.tex;
	${TEX} ${FLAGS} ${PROJECT}.tex;

clean:
	rm -rf ${OUTPUT}
