.PHONY: all

IN := presentation.tex
BIN_DIR := bin
OUT := $(BIN_DIR)/presentation.pdf
FLAGS := -halt-on-error

all: before $(OUT)

before:
	mkdir -p $(BIN_DIR)

$(OUT): $(IN)
	# Two times to generate TOC properly
	xelatex -output-directory=$(BIN_DIR) $(FLAGS) $?
	xelatex -output-directory=$(BIN_DIR) $(FLAGS) $?

clean:
	rm -rf $(BIN_DIR)

run: before $(OUT)
	open $(OUT)
