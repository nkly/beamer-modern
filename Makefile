.PHONY: all

PRESENTATION := presentation
BIN_DIR := bin
FLAGS := -halt-on-error

all: before $(PRESENTATION).pdf

before:
	mkdir -p $(BIN_DIR)

$(PRESENTATION).pdf: $(PRESENTATION).tex
	# Two times to generate TOC properly
	xelatex -output-directory=$(BIN_DIR) $(FLAGS) $?
	xelatex -output-directory=$(BIN_DIR) $(FLAGS) $?

clean:
	rm -rf $(BIN_DIR)
