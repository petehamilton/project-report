PROJECT=report
OUTPUT=output
TEX=pdflatex
BB=bibtex
FLAGS=-output-directory ${OUTPUT}

.PHONY: clean view

default:
	mkdir -p ${OUTPUT}
	${TEX} ${FLAGS} ${PROJECT}
	${BB} ${OUTPUT}/${PROJECT}
	${TEX} ${FLAGS} ${PROJECT}
	${TEX} ${FLAGS} ${PROJECT}
	open ${OUTPUT}/${PROJECT}.pdf

clean:
	rm -rf ${OUTPUT}
