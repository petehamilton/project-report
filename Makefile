PROJECT=report
OUTPUT=output
TEX=pdflatex
FLAGS=-output-directory ${OUTPUT}
BIBTEX=bibtex
GLOSSARY=makeglossaries

.PHONY: clean

default: default
	mkdir -p ${OUTPUT};
	${TEX} ${FLAGS} ${PROJECT}.tex;
	cp *.bib ${OUTPUT};
	cd ${OUTPUT}; ${BIBTEX} ${PROJECT};
	cd ${OUTPUT}; ${GLOSSARY} ${PROJECT};
	${TEX} ${FLAGS} ${PROJECT}.tex;
	${TEX} ${FLAGS} ${PROJECT}.tex;
	cp output/report.pdf ./;
	open report.pdf;

clean:
	rm -rf ${OUTPUT}
