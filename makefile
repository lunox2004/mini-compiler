run: output
	@trap 'make clean' SIGINT; ./output; make clean

output: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c -o output

lex.yy.c: lexical.l
	flex lexical.l

y.tab.c: grammer.y
	yacc -d grammer.y

clean:
	rm -rf output lex.yy.c y.tab.c y.tab.h
