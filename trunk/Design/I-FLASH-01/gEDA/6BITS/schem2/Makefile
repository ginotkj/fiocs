
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
SRC	= flash.sch # List of *.c
DRC	= flash.drc
RAW	= flash.raw
BIN	= flash.bin
LOG	= *log
################
# Optional add #
################
SOURCEDIR = sources2
GATES-DIR = $(SOURCEDIR)/gates
COMPS-DIR = $(SOURCEDIR)/comp
REGIS-DIR = $(SOURCEDIR)/register
DECOS-DIR = $(SOURCEDIR)/deco
SUBDIRS = $(GATES-DIR) $(COMPS-DIR) $(REGIS-DIR) $(DECOS-DIR)
#####################
# Macro Definitions #
#####################
MAKE 	= make
SHELL	= /bin/sh
RM 	= /bin/rm -f 	
COMP	= gzip -9v
UNCOMP	= gzip -df
GNET	= gnetlist
NGSIM	= ngspice

DRCFLAGS = -g drc2
CIRFLAGS = -g spice-sdb
SIMFLAGS = -b -o $(RAW)
##############################
# Basic Compile Instructions #
##############################

all: $(NAME)

sim: $(NAME)
	@echo 
	@echo "#####################################"
	@echo "#             SIMULATING            #"
	@echo "#####################################"
	@echo
	$(NGSIM) $(SIMFLAGS) $< >/dev/null 2>&1
	@echo "Finish!"

$(NAME) : parts $(DRC)
	@echo
	@echo "#####################################"
	@echo "#            MAKING FLASH           #"
	@echo "#####################################"
	@echo
	@echo "Generating CIR file: [$@]"
	@$(GNET) $(CIRFLAGS) -o $@ $(SRC) >/dev/null 2>&1
	@echo "Checking for errors in [$@]"
	@grep -l -v 'No valid value attribute found' $@ >/dev/null 2>&1
	@echo
	@echo "#####################################"
	@echo "#             FLASH DONE            #"
	@echo "#####################################"
	@echo


parts:
	@echo
	@echo "*************************************"
	@echo "*         MAKING FLASH PARTS        *"
	@echo "*************************************"
	@echo
	for i in $(SUBDIRS) ; do \
	( cd $$i ; make ) ; \
	done

gates:
	@cd $(GATES-DIR) ; make

comp:
	@cd $(COMPS-DIR) ; make

register:
	@cd $(REGIS-DIR) ; make

deco:
	@cd $(DECOS-DIR) ; make

%.model : %.sch
	@echo
	@echo "Generating CIR file: [$@]"
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
	@-$(RM) $(DRC) $(NAME) $(RAW) $(BIN) *~ $(LOG)

clean-all:
	@echo
	@echo "*************************************"
	@echo "*            CLEANING ALL           *"
	@echo "*************************************"
	@echo
	for i in $(SUBDIRS) ; do \
	( cd $$i ; make clean) ; \
	done
	@echo "Cleaning all files..."
	@-$(RM) $(DRC) $(BIN) $(RAW) $(NAME) *~ $(LOG)

clean-drc:
	@echo "Cleaning drc files..."
	@-$(RM) $(DRC) *~ $(LOG)

clean-model:
	@echo "Cleaning model files..."
	@-$(RM) $(NAME) *~ $(LOG)

clean-gates-drc:
	@cd $(GATES-DIR) ; make clean-drc

clean-comp-drc:
	@cd $(COMPS-DIR) ; make clean-drc

clean-register-drc:
	@cd $(REGIS-DIR) ; make clean-drc

clean-deco-drc:
	@cd $(DECOS-DIR) ; make clean-drc

################
# Dependencies #
################
