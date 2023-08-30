%{
#include<stdio.h>
#include<string.h>
#include<bits/stdc++.h>

//Token types
#define N 1
#define PLUS 2
#define MUL 3
char yychar;
%}

%%
"n"         { yychar='n';    return(N);}
"+"         { yychar='+';    return(PLUS);}
"x"         { yychar='x';    return(MUL);}
.           { printf("ERROR: unknown token %s\n", yytext); return -1;}
%%

int yywrap(){return(1);}

int get_string(char *filename, string &res) {
    int token;
    int i = 0;
    yyin = fopen(filename, "r");
    while ((token = yylex()) != 0)
    {
        if (token == -1) {
            res = "ERROR$";
            return -1;
        }
        
        res += yychar;
    }
    res+='$';
    
    return 0;

    
}
