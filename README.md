# Simple Lexical Analyzer for EASY Language
by: Janilyn G. Malimban (2019-05768)

## How to run the program
The flex code for the lexical analyzer is saved in the file `main.lex`. Run the following commands on the terminal to compile:
```
lex main.lex
gcc lex.yy.c
```
The program accepts two types of input: (1) manual input in the terminal and (2) file. After compiling, run the program using the following commands based on how you want to provide your input:
### Option 1: Manual input in the terminal
Run the command `./a.out` and enter your EASY code in the terminal. Press `Ctrl+D` to stop taking inputs from the user.
### Option 2: Saved file
Locate the file containing your EASY code then run the command `./a.out <path/to/file>`.


## Output
The output of the program will be the tokens identified by the analyzer. Each token will be printed in the following format:
`<[token], [token class], lineo: [line number]>`

## Notes
* This lexical analyzer uses `=` as the assignment operator (token class: SPECIALCHAR) and `==` as relational operator for equality (token class: OP).
* Only strings enclosed by single quotation marks (`'`) will be recognized by the program as strings. Using double quotation marks (`"`) will trigger an error.
* Errors will cause the program to exit.
