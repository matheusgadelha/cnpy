CC = g++
CFLAGS = -Wall -O3
EIGEN_INCLUDE = -I eigen/

all: example1.cpp libcnpy.a
	$(CC) $(CFLAGS) $(EIGEN_INCLUDE) example1.cpp -L. -lcnpy -lz -o example1

libcnpy.a: cnpy.o
	ar rvs libcnpy.a cnpy.o
	ranlib libcnpy.a

cnpy.o:
	$(CC) $(CFLAGS) -g -c cnpy.cpp

