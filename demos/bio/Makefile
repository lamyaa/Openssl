CC=cc
CFLAGS= -g -I../../include -fprofile-arcs  -ftest-coverage
LIBS= -L../.. ../../libssl.a ../../libcrypto.a -fprofile-arcs -lgcov
EXAMPLES=saccept sconnect

all: $(EXAMPLES) 

saccept: saccept.o
	$(CC) -o saccept saccept.o $(LIBS)

sconnect: sconnect.o
	$(CC) -o sconnect sconnect.o $(LIBS)

clean:	
	rm -f $(EXAMPLES) *.o

