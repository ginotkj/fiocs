##
## Makefile for gates folder
##  
## Made by Facundo
## Login   <facundofaku-laptop>
##
## Started on  Tue Mar 19 18:41:38 2010 Facundo
## Last update Tue Mar 19 22:14:38 2010 Facundo
## 

GNET = qw-gnetlist
RM 	= /bin/rm -f 	

DRCFLAGS = -g drc2
CIRFLAGS = -g spice-sdb

DRCFILES := $(patsubst %.sch,%.drc,$(wildcard *.sch))
CIRFILES := $(patsubst %.sch,%.model,$(wildcard *.sch))

PARTCMD	= /bin/bash make_parts.sh
PART1	= deco64_2inand
QTY1	= 59
PART2	= deco64_4inand
QTY2	= 2
PART3	= deco64_8inand
QTY3	= 7
PART4	= deco64_inv
QTY4	= 8
PART5	= inv
QTY5	= 63

title:
	@echo "####################################"
	@echo "#     Starting compiling GATES     #"
	@echo "####################################"
	@make all

all: $(DRCFILES) $(CIRFILES)
	@echo
	@echo "####################################"
	@echo "#      Finish compiling GATES      #"
	@echo "####################################"

schems:
	@echo
	@echo "*************************************"
	@echo "*         MAKING GATES SCHMES        *"
	@echo "*************************************"
	@echo
	@-$(PARTCMD) $(PART1) $(QTY1)
	@-$(PARTCMD) $(PART2) $(QTY2)
	@-$(PARTCMD) $(PART3) $(QTY3)
	@-$(PARTCMD) $(PART4) $(QTY4)
	@-$(PARTCMD) $(PART5) $(QTY5)

%.model : %.sch
	@echo
	@echo "Generating MODEL file: [$@]"
	@$(GNET) $(CIRFLAGS) -o $@ $< >/dev/null 2>&1
	@echo "Checking for errors in [$@]"
	@grep -l -v 'No valid value attribute found' $@ >/dev/null 2>&1

%.drc : %.sch
	@echo
	@echo "Passing DRC to [$<]"
	@$(GNET) $(DRCFLAGS) -o $@ $< >/dev/null 2>&1
	@echo "Checking for errors in [$@]"
	@grep -l "No errors found" $@ >/dev/null 2>&1

clean-drc:
	@echo "Cleaning drc files..."
	@-$(RM) $(DRCFILES) *~ $(LOG)

clean-model:
	@echo "Cleaning model files..."
	@-$(RM) $(CIRFILES) *~ $(LOG)

clean:
	@echo "Cleaning all files..."
	@-$(RM) $(DRCFILES) $(CIRFILES) *~ $(LOG)
