CC=cc
CFLAGS= -g -I../../include -Wall -fprofile-arcs  -ftest-coverage
LIBS=  -L../.. -lcrypto -fprofile-arcs -lgcov
EXAMPLES=sign

all: $(EXAMPLES) 

sign: sign.o
	$(CC) -o sign sign.o $(LIBS)

clean:	
	rm -f $(EXAMPLES) *.o

test: all
	./sign
