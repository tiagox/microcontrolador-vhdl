library ieee;
use ieee.std_logic_1164.all;

entity regs_tb is
end regs_tb;

architecture tb_beh of regs_tb is
	component regs
		port (
			clk, reset, we : in  std_logic;
			rd, rs         : in  std_logic_vector(3 downto 0);
			din            : in  std_logic_vector(7 downto 0);
			dout           : out std_logic_vector(7 downto 0)
		);
	end component;

	signal clk, reset, we : std_logic                    := '0';
	signal rd, rs         : std_logic_vector(3 downto 0) := (others => '0');
	signal din, dout      : std_logic_vector(7 downto 0) := (others => '0');
begin

		regs_uut : regs port map(
			clk   => clk,
			reset => reset,
			we    => we,
			rd    => rd,
			rs    => rs,
			din   => din,
			dout  => dout
		);

	process
	begin
		rs <= "0111";
		rd <= "0101";
		din   <= "01011010";
		wait for 10 ns;
		assert (dout = "UUUUUUUU") report "The initialization failed." severity ERROR;

		we  <= '1';
		clk <= '1';
		rs  <= "0101";
		wait for 10 ns;
		assert (dout = "01011010") report "The writing failed." severity ERROR;

		reset <= '1';
		wait for 10 ns;
		assert (dout = "00000000") report "The reset failed." severity ERROR;

		wait;
	end process;

end tb_beh;
