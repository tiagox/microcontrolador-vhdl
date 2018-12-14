GHDL=ghdl
GHDLFLAGS=
MODULES=\
	alu.o \
	alu_tb \
	rom_prog.o \
	rom_prog_tb \
	decode.o \
	decode_tb \
	regs.o \
	regs_tb \
	proc.o \
	proc_tb

test: $(MODULES)
	./alu_tb --vcd=alu_tb.vcd
	./rom_prog_tb --vcd=rom_prog_tb.vcd
	./decode_tb --vcd=decode_tb.vcd
	./regs_tb --vcd=regs_tb.vcd
	./proc_tb --vcd=proc_tb.vcd

# Binary depends on the object file
%: %.o
	$(GHDL) -e --std=08 --ieee=synopsys $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a --std=08 --ieee=synopsys $(GHDLFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -fv *.o  work*.cf *.vcd alu_tb decode_tb proc_tb regs_tb rom_prog_tb
