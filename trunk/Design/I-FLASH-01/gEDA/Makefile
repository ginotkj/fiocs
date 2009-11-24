##
## Makefile
##  
## Made by Facundo
## Login   <facundofaku-laptop>
##
## Started on  Thu Nov 19 19:35:47 2009 Facundo
## 
##############################
# Complete this to make it ! #
##############################
NAME 	=	i-flash-01.sch.raw
CIR	=	i-flash-01.sch.cir
DRC	=	i-flash-01.sch.drc
SCH	=	i-flash-01.sch
LOG	=	*.log
BIN	=	i-flash-01.sch.bin
DIRS	=	model sym schem
################
# Optional add #
################
MODELPATH   = ./model/
BATCH	= -b
DRCOPT  = -gdrc2
CIROPT  = -gspice-sdb
OUTOPT	= -o
#####################
# Macro Definitions #
#####################
CC 	= gnetlist
GG	= ngspice
MAKE 	= make
SHELL	= /bin/sh
RM 	= /bin/rm -f 	
COMP	= gzip -9v
UNCOMP	= gzip -df

DRCFLAGS = $(DRCOPT) $(OUTOPT)
CIRFLAGS = $(CIROPT) $(OUTOPT)
RAWFLAGS = $(BATCH) $(OUTOPT)
##############################
# Basic Compile Instructions #
##############################

all:	$(NAME)
$(NAME): cir drc
	$(GG) $(RAWFLAGS) $@ $(CIR)

cir:	$(SCH)
	$(CC) $(CIRFLAGS) $(CIR) $(SCH)
drc:	$(SCH)
	@echo "var una [$<] sera [$@] "
	$(CC) $(DRCFLAGS) $(DRC) $(SCH)

deps:
	for dir in $(DIRS); do make -C $$dirs all; done

clean:
	@echo "Cleaning..."
	@echo "var una [$<] sera [$@] "
	-$(RM) $(NAME) $(CIR) $(DRC) $(LOG) $(BIN) *~

comp: clean
	$(COMP) 

################
# Dependencies #
################
