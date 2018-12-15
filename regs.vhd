library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity regs is
	port (
		clk, reset, we : in  std_logic;
		rd, rs         : in  std_logic_vector(3 downto 0);
		din            : in  std_logic_vector(7 downto 0);
		dout           : out std_logic_vector(7 downto 0)
	);
end regs;

architecture regs_beh of regs is

	constant REG_TAM : integer := 16;
	type mem is array(REG_TAM-1 downto 0) of std_logic_vector(7 downto 0);
	signal registers : mem;

begin

	process (clk, reset)
	begin
		if reset = '1' then
			for i in 0 to REG_TAM - 1 loop
				registers(i) <= (others => '0');
			end loop;
		elsif (rising_edge(clk) and we = '1') then
			-- report to_string(rd) & ':' & to_string(conv_integer(rd));
			registers(conv_integer(rd)) <= din;
		end if;
	end process;

	dout <= registers(conv_integer(rs));

end regs_beh;
