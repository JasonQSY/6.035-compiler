# 6.035 - Compiler

[MIT 6.035: Computer Language Engineering](http://6.035.scripts.mit.edu/sp16/index.html)

## Projects

- Project 1: Scanner and Parser
- Project 2: Semantic Checker
- Project 3: Code Generator
- Project 4: Dataflow Analysis
- Project 5: Optimizer


### Scanner

- [Lexer Rules](https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md)

### Parser

- TODO


## Environment

- Java
- ant

### Ubuntu

Assume basic components like `git` has been installed.

```bash
sudo apt install ant
sudo apt install openjdk-8-jdk
```

### OS X

Assume basic components like `homebrew` have been installed.

```bash
brew install ant
```

## Usage

To compile the compiler,

```bash
ant
```

To test all the testcases of one component,

```bash
# or something like that
ant test_scanner
```

To test a single testcase,

```bash
./run.sh --target=scan tests/scanner/input/char1
```

## Reference

- Compilers: Principles, Techniques and Tools (Dragon book)
- <http://6.035.scripts.mit.edu/sp16/schedule.html>
- [ANTLR (Another Tool for Language Recognition)](http://antlr2.org/doc/index.html)
- [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
