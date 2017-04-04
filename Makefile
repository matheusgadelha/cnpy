CC = g++
CFLAGS = -Wall -O3

all: example1.cpp libcnpy.a
	$(CC) $(CFLAGS) example1.cpp -L. -lcnpy -lz -o example1

libcnpy.a: cnpy.o
	ar rvs libcnpy.a cnpy.o
	ranlib libcnpy.a

cnpy.o:
	$(CC) $(CFLAGS) -g -c cnpy.cpp

