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

DRCFLAGS = -g drc2
CIRFLAGS = -g spice-sdb
##############################
# Basic Compile Instructions #
##############################

all: $(NAME)

$(NAME) : parts
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

%.net : %.sch
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
	@-$(RM) $(DRCFILES) $(CIRFILES) *~ $(LOG)

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
	@-$(RM) $(DRCFILES) $(CIRFILES) *~ $(LOG)

clean-drc:
	@echo "Cleaning drc files..."
	@-$(RM) $(DRCFILES) *~ $(LOG)

clean-model:
	@echo "Cleaning model files..."
	@-$(RM) $(CIRFILES) *~ $(LOG)

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
