package codigo;
import static codigo.Tokens.*; //para importar los tokens
%%   //Esta es la sección principal del archivo donde se definen las reglas léxicas utilizando expresiones regulares.
%class Lexer //se genera una clase llamada Lexer para el analizador léxico.
%type Tokens //y que el tipo de tokens que se producirán será del tipo Tokens.
L=[a-zA-Z_]+  
D=[0-9]+ //Se definen expresiones regulares para identificar letras (L), dígitos (D), y espacios en blanco (espacio).
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;   //Sección que contiene que será incluido directamente en el analizador léxico generado. 
    //En este caso, lexeme almacenará el lexema actual que está siendo procesado.
%}
%% //Se definen las reglas de producción para diferentes tokens
int |
float |
char |
bool |
true |
false |
and |
or |
if |
else |
eq |
index |
basic |
le |
real |
break |
ge |
minus |
temp |
do |
id |
ne |
num |
while {lexeme=yytext(); return Reservadas;} //reglas de producción
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=="|"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"**" {return Potencia;}
"/" {return Division;}
"("|")" {return Parentesis;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;} //reglas de producción 
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;} //cuando se encuentre un lexema que coincidad con la regla asigna el lexema a una variable
 . {return ERROR;} //Esta regla maneja cualquier otro carácter que no coincida con ninguna de las reglas anteriores.