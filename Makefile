PROJECT=report
OUTPUT=output
TEX=pdflatex
BB=bibtex
FLAGS=-output-directory ${OUTPUT}

.PHONY: clean view

default:
	mkdir -p ${OUTPUT};
	${TEX} ${FLAGS} ${PROJECT};
	cp *.bib ${OUTPUT};
	cd ${OUTPUT}; ${BB} ${PROJECT};
	${TEX} ${FLAGS} ${PROJECT};
	open ${OUTPUT}/${PROJECT}.pdf;

clean:
	rm -rf ${OUTPUT}
