%{

#include "exo01.tab.h"

%}


%%
[0-9]+ 	{ yylval = atoi(yytext); return NOMBRE;}
"-"		{ return MOINS;}
"+"		{ return PLUS; }
"*"		{ return MULT; }
"/"		{ return DIV;  }
"("		{ return PAR_O;}
")"		{ return PAR_F;}
"|"		{ return VABS; }
[ \t]	{;} /* Ignore les espaces */
\n		{ return 0; } /* fin de traitement par yylex */
. 		{return yytext[0];}
%%