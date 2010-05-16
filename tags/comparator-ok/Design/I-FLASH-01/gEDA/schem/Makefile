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
NAME 	=	flash.sch.raw
CIR	=	flash.sch.cir
DRC	=	flash.sch.drc
SCH	=	flash.sch
LOG	=	*.log
BIN	=	flash.sch.bin
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
$(NAME): cir
	@echo "y parece q muy bien"
	$(GG) $(RAWFLAGS) $(NAME) $(CIR)

cir:	$(SCH)
	@echo "funca esta mierda"
	$(CC) $(CIRFLAGS) $(CIR) $(SCH)

drc:	$(SCH)
	$(CC) $(DRCFLAGS) $(DRC) $(SCH)

clean:
	-$(RM) $(NAME) $(CIR) $(DRC) $(LOG) $(BIN) *~

comp: clean
	$(COMP) 

################
# Dependencies #
################
