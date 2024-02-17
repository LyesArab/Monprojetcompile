%{
	#include<stdio.h>
}%

%token int op bool rat incr decr vrg pvg afct 

%% 
s : LIST_DEC begin end {printf("programme syntaxiquement correcte");}

LIST_DEC:     LIST_DEC TYPE idf pvg;
     |  LIST_DEC const int pvg;
     |  LIST_DEC const float pvg;

;
TYPE: FLOAT|
      INT|
      BOOL
|
%%

main(){
yyparse();
}
yywrap();




