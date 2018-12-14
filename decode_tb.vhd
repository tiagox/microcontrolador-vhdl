library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decode_tb is
end decode_tb;

architecture tb_beh of decode_tb is
	component decode
		port (
			input                    : in  std_logic_vector(7 downto 0);
			bus_sel                  : out std_logic_vector(1 downto 0);
			alu_op                   : out std_logic_vector(2 downto 0);
			reg_a_we, out_we, reg_we : out std_logic
		);
	end component;

	signal input                    : std_logic_vector(7 downto 0);
	signal bus_sel                  : std_logic_vector(1 downto 0);
	signal alu_op                   : std_logic_vector(2 downto 0);
	signal reg_a_we, out_we, reg_we : std_logic;
begin

		decode_uut : decode port map(
			input    => input,
			bus_sel  => bus_sel,
			alu_op   => alu_op,
			reg_a_we => reg_a_we,
			out_we   => out_we,
			reg_we   => reg_we
		);

	process
	begin
		input <= "00000001";
		wait for 1 ns;
		assert (bus_sel = "10") report "Bus selection failed" severity ERROR;
		assert (alu_op = "000") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00000010";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "000") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '1') report "Output we failed" severity ERROR;
		assert (reg_we = '0') report "Reg we failed" severity ERROR;

		input <= "00000011";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "000") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00000100";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "000") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '1') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '0') report "Reg we failed" severity ERROR;

		input <= "00000101";
		wait for 1 ns;
		assert (bus_sel = "01") report "Bus selection failed" severity ERROR;
		assert (alu_op = "000") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '1') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '0') report "Reg we failed" severity ERROR;

		input <= "00010000";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "010") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00010001";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "011") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00010010";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "100") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00010011";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "101") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00010100";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "110") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00100000";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "001") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg we failed" severity ERROR;

		input <= "00100001";
		wait for 1 ns;
		assert (bus_sel = "00") report "Bus selection failed" severity ERROR;
		assert (alu_op = "111") report "ALU operation failed" severity ERROR;
		assert (reg_a_we = '0') report "Reg A we failed" severity ERROR;
		assert (out_we = '0') report "Output we failed" severity ERROR;
		assert (reg_we = '1') report "Reg A we failed" severity ERROR;

		wait;
	end process;

end tb_beh;
