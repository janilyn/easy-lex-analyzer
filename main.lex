%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

DIGIT               [0-9]+
STRING              '[^']*'
BOOL                (true|false)
NUMBER              [+-]?({DIGIT}+([.]{DIGIT}*)?|[.]{DIGIT}+)
KEY                 (go" "to|exit|if|then|else" "if|else|case|endcase|while|do|endwhile|loop|forever|repeat|until|for|to|by|do|endfor|input|output|array|node|call|return|stop|end|procedure)
SPECIAL_CHAR        ([\(\)\[\],;:]|=)
ARITHMETIC_OPS      [\+\-\/*\^]
LOGICAL_OPS         (and|or|not)
RELATIONAL_OPS      [<>=!]=?
MATHEMATICAL_OPS    (mod|log|log_2|floor|ceil)
OPERATION           ({ARITHMETIC_OPS}|{LOGICAL_OPS}|{RELATIONAL_OPS}|{MATHEMATICAL_OPS})
LITERAL             ({STRING}|{NUMBER}|{BOOL})
WHITESPACE          [ \t\r\f]+
ID                  [a-zA-Z_][a-zA-Z0-9_]*

%%
"\n"            { lineno++; }
{WHITESPACE}    /* eat up whitespace */
{LITERAL}       { ret_print("LITERAL"); }
{KEY}           { ret_print("KEY"); }
{SPECIAL_CHAR}  { ret_print("SPECIALCHAR"); }
{OPERATION}     { ret_print("OP"); }
{ID}            { ret_print("ID"); }
.               { yyerror("Unrecognized character"); }
%%

void ret_print(char *token_type){
    printf("<%s, %s, lineno: %d>\n", yytext, token_type, lineno);
}

void yyerror(char *message){
    printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}