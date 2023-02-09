.SILENT:

.PHONY: compile
SOURCE_FOLDER=./src

install:
	git submodule init && git submodule update

update:
	git submodule update

build:
	cargo build

test:
	cargo run --bin cairo-test -- --starknet --path $(SOURCE_FOLDER)

format:
	cargo run --bin cairo-format -- --recursive $(SOURCE_FOLDER) --print-parsing-errors

check-format:
	cargo run --bin cairo-format -- --check --recursive $(SOURCE_FOLDER)

compile:
	mkdir -p out && \
	for file in src/*.cairo; do \
	  filename=$$(basename -- "$$file"); \
	  extension="$${filename##*.}"; \
	  filename="$${filename%.*}"; \
	  cargo run --bin starknet-compile -- "$$file" "out/$${filename}.json"; \
	done