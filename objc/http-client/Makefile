#
# MAKEFILE
#
# Http Client Sample
#

SRCDIR	= src
OBJDIR	= objs

TARGET	= http
CC		= clang
CFLAG	= -g -Wall
INC		= -I ./$(SRCDIR)/HttpClient -I ./$(SRCDIR)/Rest 
OBJS	= $(OBJDIR)/*.o
#OBJS	= HttpClient.o \
#		SessionContext.o \
#		BasicMethod.o \
#		XMLContentsDelegate.o

MODULES = HttpClient Rest

#.PHONY=all $(MODULES)
#	$(CC) $(CFLAG) $(INC) -o ${TARGET} $(SRCDIR)/$(TARGET).m $(addprefix $(OBJDIR)/, $(OBJS)) -framework Foundation

all: module
	$(CC) $(CFLAG) $(INC) -o ${TARGET} $(SRCDIR)/$(TARGET).m $(OBJS) -framework Foundation

module: $(MODULES)

$(MODULES):
	-cd $(addprefix $(SRCDIR)/, $@); make


#$(OBJS):
#	$(CC) $(CFLAG) $(INC) -o $(OBJDIR)/$@ -c $(SRCDIR)/$(@:.o=.m)

clean:
	-rm $(TARGET) $(OBJDIR)/*.o
