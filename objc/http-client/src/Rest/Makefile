#
# MAKEFILE
#
# Handle Contents Http Client
#

SRCDIR	= .
OBJDIR	= ../../objs

CC		= gcc
CFLAG	= -g -Wall
INC		= -I . -I ../HttpClient
OBJS	= \
			HCBasicXMLDelegate.o \
			HCXMLToDictionaryDelegate.o \
			HCRestSession.o \
			HCRestClient.o

all: $(OBJS)

$(OBJS):
	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)

clean:
	-rm $(OBJDIR)/*.o