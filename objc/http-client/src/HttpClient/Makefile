#
# MAKEFILE
#
# Handle Contents Http Client
#

SRCDIR	= .
OBJDIR	= ../../objs

CC		= gcc
CFLAG	= -Wall
INC		= -I .
OBJS	= \
			HCBasicContentsDelegate.o \
			HCDataContentsDelegate.o \
			HCURLConnectionDelegate.o \
			HCBasicMethod.o \
			HCSession.o \
			HCHttpClient.o

all: $(OBJS)

$(OBJS):
	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)

clean:
	-rm $(OBJDIR)/*.o