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
NAME 	=	flash.raw
CIR	=	flash.cir
DRC	=	flash.drc
SCH	=	flash.sch
LOG	=	*.log
BIN	=	flash.bin
CNAME	=	flash.
DIRS	=
################
# Optional add #
################
BATCH	= -b
DRCOPT  = -q -gdrc2
CIROPT  = -q -gspice-sdb
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
$(NAME): $(DRC) $(CIR)
	@echo "========================================"
	@echo "= Building [$@] from [$(CIR)]:"
	@echo "========================================"
	@echo
	-$(GG) $(RAWFLAGS) $@ $(CIR)
	@echo

cir:
$(CIR):	$(SCH)
	@echo "========================================"
	@echo "= Building [$@] from [$<]:"
	@echo "========================================"
	@echo
	$(CC) $(CIRFLAGS) $(CIR) $(SCH)
	sed -e 's/S[123456789]\{1\}\/GND/0/g' $(CIR) | sed -e 's,/,_,' > $(CIR)
	@echo

drc:	$(DRC)

$(DRC):	$(SCH)
	@echo "========================================"
	@echo "= Building [$@] from [$<]:"
	@echo "========================================"
	@echo
	$(CC) $(DRCFLAGS) $(DRC) $(SCH)
	@echo

deps:
	for dir in $(DIRS); do make -C $$dirs all; done

clean:
	@echo "================"
	@echo "= Cleaning...  ="
	@echo "================"
	@echo
	-$(RM) $(NAME) $(CIR) $(DRC) $(LOG) $(BIN) *~
	@echo

comp: clean
	$(COMP) 

################
# Dependencies #
################
