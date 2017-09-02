all: boost_spirit

CPPFLAGS=-g -pthread -I/usr/include
CPPFLAGS+=-I/home/gachiemchiep/Tools/boost_1_62_0/boost/
LDFLAGS=-g
CPP=g++

#binary_operations: binary_operations.o
#    gcc $(CPPFLAGS) -o binary_operations binary_operations.o

#binary_operations.o: binary_operations.cpp
#    gcc $(CPPFLAGS) -c binary_operations.cpp

%: %.cpp
	${CPP} $(CPPFLAGS) $< -o $@
