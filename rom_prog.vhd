library ieee;
use ieee.std_logic_1164.all;

entity rom_prog is
	port (
		addr   : in  std_logic_vector(6 downto 0);
		output : out std_logic_vector(15 downto 0)
	);
end rom_prog;

architecture rom_prog_beh of rom_prog is
begin

	process (addr)
	begin
		case addr is
			when "0000000" => output <= "0000000100110000"; -- IN	0x3
			when "0000001" => output <= "0000010000000011"; -- LDA	0x3
			when "0000010" => output <= "0001000001000011"; -- ADD	0x4, 0x3
			when "0000011" => output <= "0001000101010100"; -- SUB	0x5, 0x4
			when "0000100" => output <= "0001001101100100"; -- OR	0x6, 0x4
			when "0000101" => output <= "0001001001110000"; -- AND	0x7, 0x0
			when "0000110" => output <= "0000001111100100"; -- MOV	0xE, 0x4
			when "0000111" => output <= "0000001000000011"; -- OUT	0x3
			when "0001000" => output <= "0000001000000100"; -- OUT	0x4
			when "0001001" => output <= "0000001000000101"; -- OUT	0x5
			when "0001010" => output <= "0000001000000110"; -- OUT	0x6
			when "0001011" => output <= "0000001000000111"; -- OUT	0x7
			when "0001100" => output <= "0000001000001000"; -- OUT	0x8
			when "0001101" => output <= "0000001000001101"; -- OUT	0xD
			when "0001110" => output <= "0000001000001110"; -- OUT	0xE
			when others => output <= (others => '0');
		end case;
	end process;

end rom_prog_beh;
