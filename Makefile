local: ctran.pp PsionOOParser.pas
	fpc -gl ctran.pp

all: local go32v2

go32v2: ctran.pp PsionOOParser.pas
	fpc -Pi386 -Tgo32v2 ctran.pp

