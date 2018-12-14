library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom_prog_tb is
end rom_prog_tb;

architecture tb_beh of rom_prog_tb is
	component rom_prog
		port (
			addr   : in  std_logic_vector(6 downto 0);
			output : out std_logic_vector(15 downto 0)
		);
	end component;

	signal addr   : std_logic_vector(6 downto 0);
	signal output : std_logic_vector(15 downto 0);
begin

		rom_prog_uut : rom_prog port map(addr => addr, output => output);

	process
	begin
		addr <= "0000000";
		wait for 1 ns;
		assert (output = "0000000100110000") report "Instruction 0 failed" severity ERROR;

		addr <= "0000001";
		wait for 1 ns;
		assert (output = "0000010000000011") report "Instruction 1 failed" severity ERROR;

		addr <= "0000010";
		wait for 1 ns;
		assert (output = "0001000001000011") report "Instruction 2 failed" severity ERROR;

		addr <= "0000011";
		wait for 1 ns;
		assert (output = "0001000101010100") report "Instruction 3 failed" severity ERROR;

		addr <= "0000100";
		wait for 1 ns;
		assert (output = "0001001101100100") report "Instruction 4 failed" severity ERROR;

		addr <= "0000101";
		wait for 1 ns;
		assert (output = "0001001001110000") report "Instruction 5 failed" severity ERROR;

		addr <= "0000110";
		wait for 1 ns;
		assert (output = "0000001111100100") report "Instruction 6 failed" severity ERROR;

		addr <= "0000111";
		wait for 1 ns;
		assert (output = "0000001000000011") report "Instruction 7 failed" severity ERROR;

		addr <= "0001000";
		wait for 1 ns;
		assert (output = "0000001000000100") report "Instruction 8 failed" severity ERROR;

		addr <= "0001001";
		wait for 1 ns;
		assert (output = "0000001000000101") report "Instruction 9 failed" severity ERROR;

		addr <= "0001010";
		wait for 1 ns;
		assert (output = "0000001000000110") report "Instruction 10 failed" severity ERROR;

		addr <= "0001011";
		wait for 1 ns;
		assert (output = "0000001000000111") report "Instruction 11 failed" severity ERROR;

		addr <= "0001100";
		wait for 1 ns;
		assert (output = "0000001000001000") report "Instruction 12 failed" severity ERROR;

		addr <= "0001101";
		wait for 1 ns;
		assert (output = "0000001000001101") report "Instruction 13 failed" severity ERROR;

		addr <= "0001110";
		wait for 1 ns;
		assert (output = "0000001000001110") report "Instruction 14 failed" severity ERROR;

		wait;
	end process;

end tb_beh;
