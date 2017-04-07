CC = g++
CFLAGS = -Wall -ggdb
EIGEN_INCLUDE = -I eigen/

all: example1.cpp libcnpy.a
	$(CC) $(CFLAGS) $(EIGEN_INCLUDE) example1.cpp -L. -lcnpy -lz -o example1

libcnpy.a: cnpy.o
	ar rvs libcnpy.a cnpy.o
	ranlib libcnpy.a

cnpy.o:
	$(CC) $(CFLAGS) $(EIGEN_INCLUDE) -g -c cnpy.cpp

clean:
	rm -f *.o
