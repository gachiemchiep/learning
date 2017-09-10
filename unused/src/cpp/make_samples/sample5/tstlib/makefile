TLIB=tlib.a
OBJS=tstlib_a.o tstlib_b.o
CC=cc
INCPATH=.
CFLAGS=-Wall -I$(INCPATH)

.c.o:
	$(CC) $(CFLAGS) -c $<

$(TLIB): $(OBJS)
	ar cr $(TLIB) $(OBJS)

$(OBJS): $(INCPATH)/tstlib.h

cleanall:
	-rm -f *.o *.a
