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
	./alu_tb --wave=alu_tb.ghw
	./rom_prog_tb --wave=rom_prog_tb.ghw
	./decode_tb --wave=decode_tb.ghw
	./regs_tb --wave=regs_tb.ghw
	./proc_tb --wave=proc_tb.ghw

# Binary depends on the object file
%: %.o
	$(GHDL) -e --std=08 --ieee=synopsys $(GHDLFLAGS) $@

# Object file depends on source
%.o: %.vhd
	$(GHDL) -a --std=08 --ieee=synopsys $(GHDLFLAGS) $<

clean:
	@echo "Cleaning up..."
	rm -fv *.o  work*.cf *.vcd *.ghw alu_tb decode_tb proc_tb regs_tb rom_prog_tb
