##
## Makefile
##  
## Made by Facundo
## Login   <facundofaku-laptop>
##
## Started on  Tue Mar 16 08:41:38 2010 Facundo
## Last update Tue Mar 16 08:41:38 2010 Facundo
## 
##############################
# Complete this to make it ! #
##############################
NAME 	= flash.cir # Name of executable file
SRC	= comp reg # List of *.c
LOG	= *log
DIR	= sources2
################
# Optional add #
################
SCH	= $(addsuffix .sch,$(SRC))
DRC	= $(addsuffix .drc,$(SRC))
NET	= $(addsuffix .net,$(SRC))
#####################
# Macro Definitions #
#####################
MAKE 	= make
SHELL	= /bin/sh
RM 	= /bin/rm -f 	
COMP	= gzip -9v
UNCOMP	= gzip -df
GNET	= gnetlist

DRCFLAGS = -g drc2
CIRFLAGS = -g spice-sdb
##############################
# Basic Compile Instructions #
##############################

all: $(NAME)

$(NAME) : $(NET)
	@echo

$(NET) : $(DRC)

%.net : %.sch
	@echo
	@echo "Generating NET file: [$@]"
	@$(GNET) $(CIRFLAGS) -o $@ $< >/dev/null 2>&1
	@echo "Checking for errors in [$@]"
	@grep -l -v 'No valid value attribute found' $@ >/dev/null 2>&1

%.drc : %.sch
	@echo
	@echo "Passing DRC to [$<]"
	@$(GNET) $(DRCFLAGS) -o $@ $< >/dev/null 2>&1
	@echo "Checking for errors in [$@]"
	@grep -l -v ERROR $@ >/dev/null 2>&1

clean:
	@echo "Cleaning all files..."
	@-$(RM) $(NAME) $(DRC) $(NET) *~ $(LOG)

fclean:
	@echo "Cleaning [$(NAME)]"
	@-$(RM) $(NAME)

################
# Dependencies #
################
