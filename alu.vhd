library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity alu is
	port(
		op   : in  std_logic_vector(2 downto 0);
		a, b : in  std_logic_vector(7 downto 0);
		s    : out std_logic_vector(7 downto 0)
	);
end alu;

architecture alu_beh of alu is
begin

	process (a, b, op)
	begin
		case op is
			when "000" => s <= a;
			when "001" => s <= a(6 downto 0) & '0';
			when "010" => s <= a + b;
			when "011" => s <= a - b;
			when "100" => s <= a and b;
			when "101" => s <= a or b;
			when "110" => s <= a xor b;
			when "111" => s <= '0' & a(7 downto 1);
			when others => s <= (others => '0');
		end case;
	end process;

end alu_beh;
