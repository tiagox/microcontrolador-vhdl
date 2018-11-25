GHDL=ghdl
GHDLFLAGS=
MODULES=\
	alu.o \
	alu_tb \
	rom_prog.o \
	rom_prog_tb

test: $(MODULES)
	./alu_tb --vcd=alu_tb.vcd
	./rom_prog_tb --vcd=rom_prog_tb.vcd

# Binary depends on the object file
%: %.o
	$(GHDL) -e --std=08 --ieee=synopsys $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a --std=08 --ieee=synopsys $(GHDLFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -fv *.o  work*.cf *.vcd alu_tb rom_prog_tb
