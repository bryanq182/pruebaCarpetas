package org.compi2.codigo3d.parser;

import java_cup.runtime.Symbol;

//Scanner para generar C3D
%%
%{
    //Código de usuario
    

%}

%cup
%class scanner
%public
%line
%char
%column
%full


ID              = [A-Za-z][_0-9A-Za-z]*
ENTERO          = [0-9]+
DECIMAL         = [0-9]+"."[0-9]+

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {ID}            { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
<YYINITIAL> {ENTERO}        { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
<YYINITIAL> {DECIMAL}       { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }
"+"	       		{ return new Symbol(sym.MAS, yyline, yycolumn, null); }
"-"	         	{ return new Symbol(sym.MENOS, yyline, yycolumn, null); }
"*"	        	{ return new Symbol(sym.MULT, yyline, yycolumn, null); }
"/"	    		{ return new Symbol(sym.DIV, yyline, yycolumn, null); }
"^"		    	{ return new Symbol(sym.POT, yyline, yycolumn, null); }
"("	    		{ return new Symbol(sym.PAR_IZQ, yyline, yycolumn, null); }
")"		    	{ return new Symbol(sym.PAR_DER, yyline, yycolumn, null); }

/* OPERADORES  RELACIONALES*/

">"				{return new Symbol(simbolo.MAYOR, yychar, yyline,null); }
"<"				{return new Symbol(simbolo.MENOR, yychar, yyline, null); }
">="			{return new Symbol(simbolo.MAYORIGUAL, yychar, yyline, null); }
"<="			{return new Symbol(simbolo.MENORIGUAL, yychar, yyline,null); }
"=="			{return new Symbol(simbolo.IGUAL, yychar, yyline, null); }
"!="			{return new Symbol(simbolo.DIFERENTE, yychar, yyline, null); }

/* OPERADORES  LOGICOS*/

"||"			{return new Symbol(simbolo.OR, yychar, yyline, null); }

"&&"			{return new Symbol(simbolo.AND, yychar, yyline, null); }

"!"                 {return new Symbol(simbolo.NOT, yychar, yyline, null); }

<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}

<YYINITIAL>. {
        String errLex = "Error léxico, caracter irreconocible: '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+yycolumn;
        System.err.println(errLex);
}