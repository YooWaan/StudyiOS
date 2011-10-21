#
# MAKEFILE
#
# Handle Contents Http Client
#

SRCDIR	= .
OBJDIR	= ../../objs

CC		= gcc
CFLAG	= -g -Wall
INC		= -I .
OBJS	= \
			HCBasicMethodDelegate.o \
			HCDataContentsDelegate.o \
			HCFileContentsDelegate.o \
			HCURLConnectionDelegate.o \
			HCBasicMethod.o \
			HCGetMethod.o \
			HCPostMethod.o \
			HCPutMethod.o \
			HCDeleteMethod.o \
			HCSession.o \
			HCHttpClient.o

all: $(OBJS)

$(OBJS):
	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)

clean:
	-rm $(OBJDIR)/*.o