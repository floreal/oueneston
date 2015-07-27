PANDOC=pandoc

CONTENT=content
LAYOUT=layout
HEADER=$(LAYOUT)/header.html
FOOTER=$(LAYOUT)/footer.html

PAGE=site/index.html

SRC=$(wildcard content/*.md)
HTML=$(addsuffix .html,$(basename ${SRC}))

all: $(PAGE)

$(PAGE): $(HTML) $(HEADER) $(FOOTER)
	cat $(HEADER) $(HTML) $(FOOTER) > $(PAGE)

%.html: %.md
	$(PANDOC) -o $@ $<

clean:
	$(RM) $(HTML) $(PAGE)

.PHONY: clean all
