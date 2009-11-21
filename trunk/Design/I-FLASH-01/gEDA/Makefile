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
	$(GG) $(RAWFLAGS) $(NAME) $(CIR)

cir:	$(SCH)
	$(CC) $(CIRFLAGS) $(CIR) $(SCH)
drc:	$(SCH)
	$(CC) $(DRCFLAGS) $(DRC) $(SCH)

clean:
	-$(RM) $(NAME) $(CIR) $(DRC) $(LOG) *~

comp: clean
	$(COMP) 

################
# Dependencies #
################
