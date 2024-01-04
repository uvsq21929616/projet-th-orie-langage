%{
#include <stdio.h>
#include <stdlib.h>
#if YYBISON
int yylex();
int yyerror();
#endif
struct retour {
	char code[1024];
	int val;
	};
int cpt = 0;
%}

%token NOMBRE

%token PAR_O PAR_F
%token VABS

%left PLUS MOINS
%left MULT DIV
