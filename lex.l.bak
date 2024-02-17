%{
	#include "machidesktop.tab.h"
	extern YYSTYPE yylval;
    extern int nb_lignes;
    extern int nb_colonne;

%}

chiffre [0-9]

cst [1-9][0-9]*|0

IDF [A-Z]([_]?[a-z0-9])*

INT  [-]?[1-9][0-9]*|0

FLOAT [-]?([1-9][0-9]*|0)\.([0-9]*[1-9])

commentaire "/"[A-Z]*"/"

varint        "INT"
varfloat      "FLOAT"
varbool       "BOOL"


BOOL  "FALSE"|"TRUE" 
const_int "const int"
const_float "const float"
if "if"
for "for"
begin "BEGIN"
end "END"

vide [ \t]+
saut_ligne [\n]

op "*"|"+"|"-"|"/"|"%"
rat "<"|"<="|"<>"|"=="|">"|">="|"!="
incr "++"
decr "--"
pvg ";"
arc "(" 
farc ")"
aff "="	
vg ","
debut "{"
fin "}"

%%

{begin} {printf("l'analyseur trouve un BEGIN \n");nb_colonne+=yyleng;return mc_begin;}

{end} {printf("l'analyseur trouve un END \n");nb_colonne+=yyleng;return mc_end;}

{const_float} {printf("l'analyseur trouve un CONST_FLOAT \n");nb_colonne+=yyleng;return const_float;}
{const_int} {printf("l'analyseur trouve un CONST_INT \n");nb_colonne+=yyleng;return const_int;}



{varint}        {yylval.type=strdup(yytext);nb_colonne+=yyleng;return(mc_varint);}
{varfloat}      {yylval.type=strdup(yytext);nb_colonne+=yyleng;return(mc_varfloat);}
{varbool}      	{yylval.type=strdup(yytext);nb_colonne+=yyleng;return(mc_varbool);}

{INT}           {yylval.entier=atoi(yytext);nb_colonne+=yyleng;return(mc_int);}
{FLOAT}         {yylval.reel=atof(yytext);nb_colonne+=yyleng;return(mc_float);}
{BOOL}         	{yylval.bool=strdup(yytext);nb_colonne+=yyleng;return(mc_bool);} 

{if} {printf("l'analyseur trouve un IF \n");nb_colonne+=yyleng;return mc_if;}

{for} {printf("l'analyseur trouve un FOR \n");nb_colonne+=yyleng;return mc_for;}

{commentaire} {printf ("l'analyseur trouve un commentaire \n"); return commentaire;}

{IDF} {if (yyleng <= 12 ){yylval.str=strdup(yytext);nb_colonne+=yyleng;return(mc_idf);} 
       else{printf("Erreur lexical ( max 12 caracteres)\n");}}


{op} {nb_colonne+=yyleng;return mc_op;}
{rat} {nb_colonne+=yyleng;return mc_rat;}
{pvg} {nb_colonne+=yyleng;return pvg;}
{vide}
{saut_ligne} {nb_lignes++; nb_colonne = 0;}
{aff} {nb_colonne+=yyleng;return aff;}
{vg} {nb_colonne+=yyleng;return vg;}
{arc} {nb_colonne+=yyleng;return arc;}
{farc} {nb_colonne+=yyleng;return farc;}
{debut} {nb_colonne+=yyleng;return debut;}
{fin} {nb_colonne+=yyleng;return fin;}
{incr} {nb_colonne+=yyleng;return incr;}
{decr} {nb_colonne+=yyleng;return decr;}

. printf("erreur à la ligne %d et la colone %d",nb_lignes,nb_colonne) ;
%%