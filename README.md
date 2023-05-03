# Simple Lexical Analyzer for EASY Language
by: Janilyn G. Malimban (2019-05768)

For CS 155 A.Y. 2022-2023 Second Semester

## Running the program
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
```
<[token], [token class], lineno: [line number]>
```

## Token Classes
1. __Whitespace__: The following symbols will only be eaten up by the analyzer: `space`, `\n`, `\t`, `\r`, `\f`

2. __Literals__: Strings, boolean variables, and numbers make up the token class `LITERAL`. 
    * ___Strings___: enclosed by single quotation marks (`'`)
    * ___Boolean variables___: should be written in lowercase (`true` or `false`)
    * ___Numbers___: signed or unsigned integers or floats.
3. __Keywords__: The following will have `KEY` as token class:
    |     |     |     |     |     |
    | --- | --- | --- | --- | --- |
    | `go to` | `exit` | `if` | `then` | `else if` | 
    | `else` | `case` | `endcase` | `while` | `do` |
    |`endwhile` | `loop` | `forever` | `repeat` | `until` | 
    | `for` | `to` | `by` | `do` | `endfor` | `input` | 
    | `output` | `array` | `node` | `call` | `return` | `stop` |
    | `end` | `procedure` | | | |
4. __Special Characters__: The following symbols will have `SPECIALCHAR` as token class: *brackets* (`[]`), *paretheses* (`()`), *comma* (`,`), *semicolon* (`;`), *colon* (`:`), *equal* (`=`)
5. __Operations__: Arithmetic, logical, relational, and mathematical operations fall under the token class `OP`. Here are the possible operations for each operation type:
    * __Arithmetic__: addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), power (`^`)
    * __Logical__: Logical AND (`and`), Logical OR (`or`), Logical NOT (`not`)
    * __Relational__: greater than (`<`), less than (`>`), greater than or equal (`<=`), less than or equal (`>=`), equal (`==`), not equal (`!=`)
    * __Mathematical__: modulo (`mod`), logarithm (`log`), log base 2 (`log_2`), floor function (`floor`), ceiling function (`ceil`)
6. __Identifiers__: These are words will have `ID` as token class. It is characterized by the following rules:
    * must begin with an alphabet or an underscore
    * if length > 1, suceeding characters are either an alphanumeric character or an underscore
## Notes
* Comments are not handled by this program.
* Whitespace will be disregarded by this program.
* Plus signs (`+`) and minus signs (`-`) preceding a number will be considered as part of the number literal if there is no whitespace in between. Otherwise, it will be considered as an operation.
* Enclosing a string using double quotation marks (`"`) will trigger an error.
* This lexical analyzer uses `=` as the assignment operator (token class: `SPECIALCHAR`) and `==` as relational operator for equality (token class: `OP`).
* Errors will cause the program to exit.
* The files in `sample_input` folder contains EASY code you can use as an input. All files except `input.easy` are the test cases given by the instructor and were edited to follow the rules set by the lexical analyzer. You may see their outputs in the `sample_output` folder.
