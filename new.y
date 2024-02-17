%{
#include <stdio.h>  
int yylex();
int yyerror(char *s);
   int nb_lignes = 1;
   int nb_colonne = 1;
%}

%token <entier>mc_int  <reel>mc_float <bool>mc_bool <type>mc_varbool <idf>mc_idf <type>mc_varint <type>mc_varfloat mc_begin mc_for mc_if mc_end mc_rat mc_op <symbol>pvg <symbol>vg <symbol>aff debut fin <symbol>arc <symbol>farc <str>incr <str>decr const_int const_float commentaire

%start S 
%union {
int entier; 
float reel; 
char* str; 
char oper; 
char* type;
char* idf;
char symbol;
char* bool;
}

%%
   S: Declarations mc_begin list_inst mc_end {printf ("programme correcte syntaxiquement");
                                                YYACCEPT;}
                                                ;
  type:
    mc_varfloat|mc_varint|mc_varbool
  ;
  declarationidf: |declarationidf type mc_idf  pvg   
                  |declarationidf const_int mc_idf aff mc_int pvg 
                  |declarationidf const_float mc_idf aff mc_float pvg 
                  |declarationidf mc_bool mc_idf aff mc_bool pvg 
        
;
Declarations:
              declarationidf 
             |commentaire 
 ;
 operationarr:
        mc_idf mc_op mc_idf pvg|
        mc_idf mc_op mc_int pvg|
        mc_idf mc_op mc_float pvg|
        mc_int mc_op mc_int pvg 
 ; 

condition:
        mc_idf  mc_rat mc_idf |
        mc_idf  mc_rat mc_int 

;
affectation :
         mc_idf aff mc_int |
         mc_idf aff mc_idf |
         mc_idf aff operationarr 
;
compteur:
 mc_idf incr|
 mc_idf decr 
 ;
  

list_inst:|affectation list_inst
          |mc_if arc condition farc debut list_inst fin list_inst
          |mc_for arc affectation pvg condition pvg compteur farc debut list_inst fin list_inst
          |commentaire list_inst
;

    %%

int yyerror(char *msg) {
    printf("ERREUR syntaxique a la ligne %d colonne %d\n",nb_lignes,nb_colonne);
    return 0;
}

main ()
{
}
