# random-number program

## Installation
- Install stack: https://docs.haskellstack.org/en/stable/

## Build and run 
```shell
stack build
```
This command builds the project to executable file `random-number-exe` in `.stack-work/` directory.

To run the file, for example on macOS M1:
```shell
stack exec ./.stack-work/dist/aarch64-osx/Cabal-3.6.3.0/build/random-number-exe/random-number-exe
```

## Compile & run main Haskell program
```shell
stack runghc app/Main.hs
```

## Helpful commands
* List dependencies: `stack ls dependencies`
