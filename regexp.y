%{
#include <stdio.h>
#include <stdlib.h>
#if YYBISON
int yylex();
int yyerror();
#endif
int count = 0;
%}

%debug
%token PAR_O PAR_F PLUS DOT STAR LETTER EPSILON EMPTY FDL
%nonassoc STAR
%left DOT
%left PLUS

%%
input:
  { printf("from automate import *\n"); }
  regex FDL { printf("a_final = a%d\n", count) ;} words 
  ;

words:
    words FDL { printf("print(reconnait(a_final,\"") ;} word { printf("\"))\n");}
  |  { printf("print(reconnait(a_final,\"");} word { printf("\"))\n");}
  ;

word: 
  | word LETTER { printf("%c", $2); }
  ;

regex:
    EMPTY  
  | EPSILON
  | LETTER { printf("a%d = automate('%c')\n", ++count, $1); $$ = count; }
  | PAR_O regex PAR_F { $$ = $2; }
  | regex DOT regex { printf("a%d = concatenation(a%d, a%d)\n", ++count, $1, $3); $$ = count; }
  | regex PLUS regex { printf("a%d = union(a%d, a%d)\n", ++count, $1, $3); $$ = count; }
  | regex STAR { printf("a%d = etoile(a%d)\n", ++count, $1); $$ = count; }
  ;

%%
