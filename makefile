SRC = anhang.tex anleitung.tex doku.tex kurzanleitung.tex parameter.tex

MAIN = doku

JPG = 	jpg/einstieg.jpg jpg/frauenauswahl.jpg jpg/krankenkassen.jpg \
	jpg/leistungsarten.jpg \
	jpg/parameterauswahl.jpg jpg/parameter_HEB.jpg \
	jpg/parameterpflege.jpg jpg/rechgen2.jpg \
	jpg/rechnungsbearbeitung.jpg jpg/rechnungserfassung.jpg \
	jpg/stammdaten.jpg \
	jpg/wartungsmenue.jpg jpg/angaben_zur_hebamme.jpg \
	jpg/parameter_datenannahmestellen.jpg \
	jpg/xauftrag.jpg jpg/certreq2.jpg jpg/certreq.jpg \
	jpg/xauftrag_bearbeiten.jpg \
	jpg/xauftrag_einstellungen.jpg jpg/xkey.jpg


doku.pdf: $(SRC) $(JPG) doku.bbl bib index
	echo Baue PDF
	pdflatex doku.tex

all: doku.pdf bib index doku.pdf

doku.bbl:
	pdflatex doku.tex
	bibtex $(MAIN)

index: doku.idx
	texindy -g doku.idx

doku.idx: doku.tex
	pdflatex doku.tex

bib: doku.aux
	echo Baue BIB
	pdflatex doku.tex
	bibtex $(MAIN)

clean:
	rm *.aux *.bbl *.log *.out *.toc *.blg *.pdf *.idx *.ind *.sta *.ilg \
	*.raw