GHDL=ghdl
GHDLFLAGS=
MODULES=\
	alu.o \
	alu_tb

test: $(MODULES)
	./alu_tb --vcd=alu_tb.vcd

# Binary depends on the object file
%: %.o
	$(GHDL) -e --std=08 --ieee=synopsys $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a --std=08 --ieee=synopsys $(GHDLFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -fv *.o  work*.cf *.vcd alu alu_tb
