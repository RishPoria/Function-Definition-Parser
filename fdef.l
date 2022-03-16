%{
    #include <stdio.h>
    #include "y.tab.h"
%}
  /* Alphabets and digits */
alpha                                     [A-Za-z_]
digit                                     [0-9]

%%
  /* Returning tokens for matching patterns */
[\t \n]                                   ;
void|bool|char|int|float|double           return TYPE;
return                                    return RETURN;
[-+]?({digit}+\.{digit}+|{digit}+)        return NUM;
{alpha}({alpha}|{digit})*                 return ID;
.                                         return yytext[0];

%%

int yywrap()
{
    return 1;
}
