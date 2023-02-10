# A template to get you started with Cairo 1

Create a repository from this template, clone it locally and run `make install`. Voilà!

## Make commands

- `make install`: Sets up the cairo git submodule
- `make build`: Builds the cairo 1 compiler
- `make test dir=<path>`: Runs the tests in a crate
- `make format`: Formats cairo files under `src/`
- `make check-format`: Checks format for files under `src/`
- `make starknet-compile dir=<path>`: Runs `starknet-compile` on a cairo crate and stores the output under `out/`

### Example

```
make starknet-compile dir=src/erc20
make starknet-compile dir=src/storage
```
