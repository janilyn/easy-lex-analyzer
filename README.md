# Simple Lexical Analyzer for EASY Language
by: Janilyn G. Malimban (2019-05768)
For CS 155 A.Y. 2022-2023 Second Semester

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
* Comments are not handled by this program.
* Whitespace will be disregarded by this program.
* This lexical analyzer uses `=` as the assignment operator (token class: SPECIALCHAR) and `==` as relational operator for equality (token class: OP).
* Arithmetic, logical, relational, and mathematical operations fall under the token class `OP`. Here are the possible operations for each operation type:
    - __Arithmetic__: addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), power (`^`)
    - __Logical__: Logical AND (`and`), Logical OR (`or`), Logical NOT (`not`)
    - __Relational__: greater than (`<`), less than (`>`), greater than or equal (`<=`), less than or equal (`>=`), equal (`==`), not equal (`!=`)
    - __Mathematical__: modulo (`mod`), logarithm (`log`), log base 2 (`log_2`), floor function (`floor`), ceiling function (`ceil`)
* Strings, boolean variables, and numbers make up the token class `LITERAL`. 
    - Only strings enclosed by single quotation marks (`'`) will be recognized by the program as strings. Using double quotation marks (`"`) will trigger an error.
    - Boolean variables should be written in lowercase (`true` or `false`)
    - Numbers can be signed or unsigned integers or floats.
    - Plus signs (`+`) and minus signs (`-`) preceding a number will be considered as part of the number literal if there is no space between. Otherwise, it will be considered as an operation.
* Errors will cause the program to exit.
* The files in `sample_input` folder contains EASY code you can use as an input. All files except `input.easy` are the test cases given by the instructor and were edited to follow the rules set in the lexical analyzer. You may see their outputs in the `sample_output` folder.
