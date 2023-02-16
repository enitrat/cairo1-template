.SILENT:

.PHONY: compile
SOURCE_FOLDER=./src
last_folder=$(basename $(dirname $(dir)))

install:
	git submodule init && git submodule update --remote && cp -rf cairo/corelib .

update:
	git submodule update --remote && cp -rf cairo/corelib .

build:
	cargo build

test:
	cargo run --bin cairo-test -- --starknet --path $(dir)

format:
	cargo run --bin cairo-format -- --recursive $(SOURCE_FOLDER) --print-parsing-errors

check-format:
	cargo run --bin cairo-format -- --check --recursive $(SOURCE_FOLDER)

starknet-compile:
	mkdir -p out && \
	  cargo run --bin starknet-compile -- ${dir} out/$(shell basename $(dir)).json

language-server:
	cargo build --bin cairo-language-server --release
