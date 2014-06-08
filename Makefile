PROJECT=report
OUTPUT=output
TEX=pdflatex
FLAGS=-output-directory ${OUTPUT}
BIBTEX=bibtex

.PHONY: clean

default: default
	mkdir -p ${OUTPUT};
	${TEX} ${FLAGS} ${PROJECT}.tex;
	cp *.bib ${OUTPUT};
	cd ${OUTPUT}; ${BIBTEX} ${PROJECT};
	${TEX} ${FLAGS} ${PROJECT}.tex;
	${TEX} ${FLAGS} ${PROJECT}.tex;
	open output/report.pdf;

clean:
	rm -rf ${OUTPUT}
