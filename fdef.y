%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror();
%}

  // declaring tokens and precedence orders
%token TYPE RETURN ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left '%'

%%

S    : FUN  {
              printf("Correct C++ function definition.\n");
              return 0;
            }
FUN     : TYPE ID '(' PARAM1 ')' '{' BODY '}'                  // float add(float a, int b) { // body }
        ;
PARAM1  : PARAM1 ',' TYPE ID                                   // int a, int b, char c (for function parameter list) [Multiple]
        | TYPE ID                                              // bool val [Single]
        |
        ;
PARAM2  : TYPE ID IDLIST                                       // int a, b; (for function body)
        ;
IDLIST  : ',' ID IDLIST                                        // ,id1,id2,id3 ... (for adding multiple ids)
        |
        ;
BODY    : BODY BODY                                            // To add multiple statements in the body
        | PARAM2 ';'                                           // int a, b, c;
        | E ';'                                                // a = b + c;
        | RETURN E ';'                                         // return a * b;
        |
        ;
E       : ID '=' E                                             // Assignment operator
        | E '+' E                                              // Addition operator
        | E '-' E                                              // Subtraction operator
        | E '*' E                                              // Multiplication operator
        | E '/' E                                              // Division operator
        | E '%' E                                              // Remainder operator
        | ID                                                   // Variable
        | NUM                                                  // Number
        ;

%%

void main()
{
    printf("\nEnter C++ function definition to check: \n");
    yyparse();
 }

 void yyerror()
 {
     printf("\nIncorrect function definition.\n");
     exit(1);
 }
