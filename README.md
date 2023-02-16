# A template to get you started with Cairo 1

Create a repository from this template, clone it locally and run `make install`. Voilà!

## Make commands

- `make install`: Sets up the cairo git submodule
- `make update`: Updates the cairo submodule
- `make build`: Builds the cairo 1 compiler
- `make test dir=<path>`: Runs the tests in a crate
- `make format`: Formats cairo files under `src/`
- `make check-format`: Checks format for files under `src/`
- `make starknet-compile dir=<path>`: Runs `starknet-compile` on a cairo crate and stores the output under `out/`
- `make language-server`: Builds the Cairo 1 Language Server

### Example

```
make starknet-compile dir=src/erc20
make starknet-compile dir=src/storage
```

## Language server

To get proper syntax highlighting and code navigation in your editor, you will need the Cairo 1 extension.
You can find instructions on how to install the vscode extension [here](https://github.com/starkware-libs/cairo/blob/main/vscode-cairo/README.md).
You can build the language server manually by running `make language-server`, and then edit the configuration file of the extension to point to full path of the executable under `target/release/language-server`.
The language server needs the corelib/ directory to be present in the root directory of the project, hence it is copied from the cairo submodule when running `make install`.
