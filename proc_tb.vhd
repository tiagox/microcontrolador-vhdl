library ieee;
use ieee.std_logic_1164.all;

entity proc_tb is
end proc_tb;

architecture tb_beh of proc_tb is
	component proc
		port (
			clk, reset : in  std_logic;
			input      : in  std_logic_vector(7 downto 0);
			output     : out std_logic_vector(7 downto 0)
		);
	end component;

	signal clk, reset    : std_logic;
	signal input, output : std_logic_vector(7 downto 0);
begin

		proc_uut : proc port map(clk => clk, reset => reset, input => input, output => output);

	process
		variable contador : integer := 0;
	begin
		if (contador = 0) then
			reset <= '1';
		else
			reset <= '0';
		end if;

		input <= "00000101";
		clk   <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		contador := contador + 1;

		if contador = 20 then
			wait;
		end if;
	end process;

end tb_beh;
