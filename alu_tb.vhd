library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture tb_beh of alu_tb is
	component alu
		port (
			a,b : in  std_logic_vector(7 downto 0);
			op  : in  std_logic_vector(2 downto 0);
			s   : out std_logic_vector(7 downto 0)
		);
	end component;

	signal a, b, s : std_logic_vector(7 downto 0);
	signal op      : std_logic_vector(2 downto 0);
begin

		alu_uut : alu port map(a => a, b => b, op => op, s => s);

	process
	begin
		a <= "00010110"; b <= "00000111";

		op <= "000";
		wait for 20 ns;
		assert (s = "00010110") report "The operation b000 failed." severity ERROR;

		op <= "001";
		wait for 20 ns;
		assert (s = "00101100") report "The operation b001 failed." severity ERROR;

		op <= "010";
		wait for 20 ns;
		assert (s = "00011101") report "The operation b010 failed." severity ERROR;

		op <= "011";
		wait for 20 ns;
		assert (s = "00001111") report "The operation b011 failed." severity ERROR;

		op <= "100";
		wait for 20 ns;
		assert (s = "00000110") report "The operation b100 failed." severity ERROR;

		op <= "101";
		wait for 20 ns;
		assert (s = "00010111") report "The operation b101 failed." severity ERROR;

		op <= "110";
		wait for 20 ns;
		assert (s = "00010001") report "The operation b110 failed." severity ERROR;

		op <= "111";
		wait for 20 ns;
		assert (s = "00001011") report "The operation b111 failed." severity ERROR;
		wait;
	end process;

end tb_beh;
