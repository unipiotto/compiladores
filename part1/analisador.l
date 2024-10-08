identificador   [a-zA-Z]([a-zA-Z0-9])*
numero  [0-9]+
espaco  [ \t]+
novalinha [\n]

%x coment

%{
    int nlin = 1;
%}

%%
programa    printf("%3d|%11s: reservada\n", nlin, yytext);
inicio    printf("%3d|%11s: reservada\n", nlin, yytext);
fimprograma    printf("%3d|%11s: reservada\n", nlin, yytext);

leia    printf("%3d|%11s: reservada\n", nlin, yytext);
escreva    printf("%3d|%11s: reservada\n", nlin, yytext);

se    printf("%3d|%11s: reservada\n", nlin, yytext);
entao    printf("%3d|%11s: reservada\n", nlin, yytext);
senao    printf("%3d|%11s: reservada\n", nlin, yytext);
fimse    printf("%3d|%11s: reservada\n", nlin, yytext);

enquanto    printf("%3d|%11s: reservada\n", nlin, yytext);
faca    printf("%3d|%11s: reservada\n", nlin, yytext);
fimenquanto    printf("%3d|%11s: reservada\n", nlin, yytext);

"+"    printf("%3d|%11s: soma\n", nlin, yytext);
"-"    printf("%3d|%11s: subtracao\n", nlin, yytext);
"*"    printf("%3d|%11s: multiplicacao\n", nlin, yytext);

div    printf("%3d|%11s: divisao\n", nlin, yytext);

">"    printf("%3d|%11s: maior\n", nlin, yytext);
"<"    printf("%3d|%11s: menor\n", nlin, yytext);
"="    printf("%3d|%11s: igual\n", nlin, yytext);

e    printf("%3d|%11s: e logico\n", nlin, yytext);
ou    printf("%3d|%11s: ou logico\n", nlin, yytext);
nao    printf("%3d|%11s: negacao\n", nlin, yytext);

"<-"    printf("%3d|%11s: atribuicao\n", nlin, yytext);
"("    printf("%3d|%11s: abre\n", nlin, yytext);
")"    printf("%3d|%11s: fecha\n", nlin, yytext);

inteiro    printf("%3d|%11s: atributo\n", nlin, yytext);
logico    printf("%3d|%11s: atributo\n", nlin, yytext);
"V"    printf("%3d|%11s: logico\n", nlin, yytext);
"F"    printf("%3d|%11s: logico\n", nlin, yytext);

"//".*  ;
"/*"    BEGIN(coment);
<coment>"*/"    BEGIN(INITIAL);
<coment>.   ;
<coment>\n  nlin++;

{identificador}    printf("%3d|%11s: identificador\n", nlin, yytext);
{numero}    printf("%3d|%11s: numero\n", nlin, yytext);
{espaco}    ;
{novalinha}    nlin++;

%%

int yywrap(void) { return 1; }

int main (int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}