# A Makefile with variables and suffix rules
# variaveis
INCLUDES = asm.h
SOURCES = main.c pontuacoes.s aprovacoes.s
OBJFILES = main.o pontuacoes.o aprovacoes.o

EXEC = prog
# Suffix rules
.SUFFIXES : .c .o
.SUFFIXES : .s .o

# How to build an object .o from a code file .c ; $< -- file name
.c.o:
	gcc -Wall -g -c $<
.s.o:
	gcc -Wall -g -c $<

${EXEC}: ${OBJFILES}
	gcc -Wall -g -o ${EXEC} ${OBJFILES}
${OBJFILES}: ${SOURCES} ${INCLUDES}
run: ${EXEC}
	./${EXEC}
clean:
	rm -f ${OBJFILES} ${EXEC}
