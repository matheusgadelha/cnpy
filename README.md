# CNPY

Small library to read and write Numpy data with C++ Eigen arrays.
This version includes a Makefile-based build (instead of CMake) and support to Eigen.

## Requirements:
1. zlib
2. eigen

## Building from source

Building from source is straightforward. Just run `make` and it will generate a static
library and a sample binary.

## Using:

To use, #include"cnpy.h" in your source code. Compile the source code mycode.cpp as

g++ -o mycode mycode.cpp -L/path/to/install/dir -lcnpy

## Description:

There are two functions for writing data: `npy_save`, `npz_save`.

There are 3 functions for reading. `npy_load` will load a .npy file. `npz_load(fname)` will load a .npz and return a dictionary of NpyArray structues. `npz_load(fname,varname)` will load and return the `NpyArray` for data varname from the specified .npz file.
Note that NpyArray allocates `char* data` using `new[]` and *will not* delete the data upon the NpyArray destruction. You are responsible for delete the data yourself.

The data structure for loaded data is below. Data is loaded into a a raw byte array. The array shape and word size are read from the npy header. You are responsible for casting/copying the data to its intended data type.
```cpp
struct NpyArray {
    char* data;
    std::vector<unsigned int> shape;
    unsigned int word_size;
};
```
See example1.cpp for examples of how to use the library. example1 will also be build during cmake installation.
