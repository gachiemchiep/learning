OBJS=main.o mod_a.o mod_b.o
CC=cc
INCLIB=../tstlib
LIBS=$(INCLIB)/tlib.a
CFLAGS=-Wall -I. -I$(INCLIB) 

.c.o:
	$(CC) $(CFLAGS) -c $<

app: $(OBJS) $(LIBS)
	$(CC) $(CFLAGS) -o app $(OBJS) $(LIBS)

$(OBJS): inc_a.h inc_b.h $(INCLIB)/tstlib.h

cleanall:
	-rm -f *.o app
