
GNET = qw-gnetlist

DRCFLAGS = -g drc2
CIRFLAGS = -g spice-sdb

DRCFILES := $(patsubst %.sch,%.drc,$(wildcard *.sch))
CIRFILES := $(patsubst %.sch,%.net,$(wildcard *.sch))



all: $(DRCFILES) $(CIRFILES)
	@echo
	@echo "Finish compiling gates"

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
	@grep -l "No errors found" $@ >/dev/null 2>&1

