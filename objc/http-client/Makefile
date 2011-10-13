#
# MAKEFILE
#
# Http Client Sample
#

SRCDIR	= src
OBJDIR	= objs

TARGET	= httpclient
CC		= gcc
CFLAG	= -Wall
INC		= 
OBJS	= GravityClient.o \
		SessionContext.o \
		BasicMethod.o \
		XMLContentsDelegate.o

all: $(OBJS)
	$(CC) $(CFLAG) $(INC) -o ${TARGET} $(SRCDIR)/$(TARGET).m $(addprefix $(OBJDIR)/, $(OBJS)) -framework Foundation

$(OBJS):
	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)


clean:
	-rm $(TARGET) $(SRCDIR)/*.o