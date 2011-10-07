#
# MAKEFILE
#
# Http Client Sample
#

SRCDIR	= src

TARGET	= http
CC		= gcc
#CFLAG	= -Wall -lobjc -lgnustep-base -fobjc-exceptions 
#CFLAG	= -Wall -lobjc -lgnustep-base -fobjc-std=objc1
CFLAG	= -Wall -lobjc -lgnustep-base -fconstant-string-class=NSConstantString
INC		= -I/usr/include/GNUstep
OBJS	= $(SRCDIR)/GravityClient.o \
		$(SRCDIR)/SessionContext.o \
		$(SRCDIR)/BasicMethod.o \
		$(SRCDIR)/XMLContentsDelegate.o

all: $(OBJS)
	$(CC) $(CFLAG) $(INC) -o ${TARGET} $(SRCDIR)/$(TARGET).m $(OBJS)

.SUFFIXES: .o .m
.m.o:
	$(CC) $(CFLAG) $(INC) -o $@ -c $<

clean:
	-rm $(TARGET) $(SRCDIR)/*.o