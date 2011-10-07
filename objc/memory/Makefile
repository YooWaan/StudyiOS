#
# MAKEFILE : memory check
#

SRCDIR	= src
OBJDIR	= objs

TARGET	= mem
CC		= gcc
CFLAG	= -Wall -lobjc -lgnustep-base -fconstant-string-class=NSConstantString
INC		= -I/usr/include/GNUstep
OBJS	= Data.o DataCollection.o GCArray.o

all: $(OBJS)
	$(CC) $(CFLAG) $(INC) -o ${TARGET} $(SRCDIR)/$(TARGET).m $(addprefix $(OBJDIR)/, $(OBJS))

$(OBJS):
	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)

clean:
	-rm $(TARGET) $(OBJDIR)/*.o