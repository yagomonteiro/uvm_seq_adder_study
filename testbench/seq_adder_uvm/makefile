TB?= tb


#compiler 

XRUN=xrun
COMP_FLAGS= -sysv -debug -LINEDEBUG
COVERAGE_FLAGS = -coverage functional -sv -covoverwrite
UVM_FLAGS= -uvm +UVM_NO_RELNOTES
SV_FILES = 

test:
	@echo This is a makefile test
run:	
	$(XRUN) $(COMP_FLAGS) $(UVM_FLAGS) $(SV_FILES) $(TB).sv
gui:	
	$(XRUN) $(COMP_FLAGS) $(UVM_FLAGS) $(SV_FILES) $(TB).sv -gui
clean:
	@rm -rf xcelium.d x* .simv* simv* dump* waves* mdv.* imc*
	@rm -rf cov_work report
cov:	
	$(XRUN) $(COMP_FLAGS) $(COVERAGE_FLAGS) $(UVM_FLAGS) $(SV_FILES) $(TB).sv	
	@imc -exec report_gen.sh
	@cat report/coverage.rpt