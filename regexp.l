%{

#include "regexp.tab.h"

%}


%%
"\n"     { return FDL; }
"("      { return PAR_O; }
")"      { return PAR_F; }
"+"      { return PLUS; }
"."      { return DOT; }
"*"      { return STAR; }
"E"      { return EPSILON; }
"O"      { return EMPTY; }
[a-z]    { yylval = yytext[0]; return LETTER; }
%%