# vim: tabstop=8 shiftwidth=8 noexpandtab
# makefile for pdflatex

INPUT  = thesis
DATE   = $(shell date "+%d%b")
OUTPUT = thesis_draft_$(DATE)

TEX = pdflatex -interaction nonstopmode -jobname $(OUTPUT)
BIB = bibtex
VIEW = mupdf

$(OUTPUT).pdf: $(INPUT).tex chapters/*.tex
	( \
	$(TEX) $(INPUT); \
	$(BIB) $(OUTPUT); \
	while grep -q "Rerun to get cross-references right." $(OUTPUT).log; \
	do \
		$(TEX) $(INPUT); \
	done \
	)
	cp $(OUTPUT).pdf ~/public_html/thesis_drafts/

clean::
	rm -fv *.aux chapters/*.aux *.log *.bbl *.blg *.toc *.fls *.cut *.out *.lot *.lof thesis_*.pdf

show: $(OUTPUT).pdf
	$(VIEW) $(OUTPUT).pdf

test::
	$(TEX) -draftmode $(INPUT)

once::
	$(TEX) $(INPUT)


spell:
	aspell -t check ${INPUT}.tex
