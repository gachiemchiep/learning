#
# makefile sample that uses phony targets and macros 
#

# *** MACROS

INSTPATH=./bin/myapp
INCPATH=./include
OBJPATH=./obj
CC=cc
CFLAGS=-g -Wall -I$(INCPATH)
COND1=`stat app 2>/dev/null | grep Modify`
COND2=`stat $(INSTPATH) 2>/dev/null | grep Modify`

# *** Targets 

all: getobj app install putobj 

app: main.o mod_a.o mod_b.o 
	$(CC) $(CFLAGS) -o app main.o mod_a.o mod_b.o

main.o: main.c $(INCPATH)/inc_a.h $(INCPATH)/inc_b.h
	$(CC) $(CFLAGS) -c main.c 

mod_a.o: mod_a.c $(INCPATH)/inc_a.h
	$(CC) $(CFLAGS) -c mod_a.c

mod_b.o: mod_b.c $(INCPATH)/inc_b.h 
	$(CC) $(CFLAGS) -c mod_b.c

getobj:
	-mv $(OBJPATH)/*.o . 2>/dev/null

putobj:
	-mv *.o $(OBJPATH) 2>/dev/null

# Process only when app timestamp is changed
install: 
	@if [ "$(COND1)" != "$(COND2)" ];\
	then\
		cp -p ./app $(INSTPATH) 2>/dev/null;\
		chmod 700 $(INSTPATH);\
		echo "Installed in" $(INSTPATH);\
	fi
 
# This one is used for housekepping
cleanall:
	-rm -f app
	-rm -f $(OBJPATH)/*.o
	-rm -f $(INSTPATH)
 
