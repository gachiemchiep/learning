CPPFLAGS=-g -pthread -I/usr/include
LDFLAGS=-g
CC=gcc

binary_operations: binary_operations.o
    gcc $(CPPFLAGS) -o binary_operations binary_operations.o

binary_operations.o: binary_operations.cpp
    gcc $(CPPFLAGS) -c binary_operations.cpp
