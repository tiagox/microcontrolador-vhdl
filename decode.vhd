-------------------------------------------------------------------------------
-- || Instrucción |   code   | bus_sel | alu_op | reg_a_we | out_we | reg_we ||
-- |  IN  (0x01)  | 00000001 |      10 |    000 |        0 |      0 |      1  |
-- |  OUT (0x02)  | 00000010 |      00 |    000 |        0 |      1 |      0  |
-- |  MOV (0x03)  | 00000011 |      00 |    000 |        0 |      0 |      1  |
-- |  LDA (0x04)  | 00000100 |      00 |    000 |        1 |      0 |      0  |
-- |  LDI (0x05)  | 00000101 |      01 |    000 |        1 |      0 |      0  |
-- |  ADD (0x10)  | 00010000 |      00 |    010 |        0 |      0 |      1  |
-- |  SUB (0x11)  | 00010001 |      00 |    011 |        0 |      0 |      1  |
-- |  AND (0x12)  | 00010010 |      00 |    100 |        0 |      0 |      1  |
-- |  OR  (0x13)  | 00010011 |      00 |    101 |        0 |      0 |      1  |
-- |  XOR (0x14)  | 00010100 |      00 |    110 |        0 |      0 |      1  |
-- |  SHL (0x20)  | 00100000 |      00 |    001 |        0 |      0 |      1  |
-- |  SHR (0x21)  | 00100001 |      00 |    111 |        0 |      0 |      1  |
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity decode is
	port (
		input                    : in  std_logic_vector(7 downto 0);
		bus_sel                  : out std_logic_vector(1 downto 0);
		alu_op                   : out std_logic_vector(2 downto 0);
		reg_a_we, out_we, reg_we : out std_logic
	);
end decode;

architecture decode_beh of decode is
begin

	process (input)
	begin
		case input is
			when "00000001" => bus_sel <= "10"; alu_op <= "000"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00000010" => bus_sel <= "00"; alu_op <= "000"; reg_a_we <= '0'; out_we <= '1'; reg_we <= '0';
			when "00000011" => bus_sel <= "00"; alu_op <= "000"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00000100" => bus_sel <= "00"; alu_op <= "000"; reg_a_we <= '1'; out_we <= '0'; reg_we <= '0';
			when "00000101" => bus_sel <= "01"; alu_op <= "000"; reg_a_we <= '1'; out_we <= '0'; reg_we <= '0';
			when "00010000" => bus_sel <= "00"; alu_op <= "010"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00010001" => bus_sel <= "00"; alu_op <= "011"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00010010" => bus_sel <= "00"; alu_op <= "100"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00010011" => bus_sel <= "00"; alu_op <= "101"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00010100" => bus_sel <= "00"; alu_op <= "110"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00100000" => bus_sel <= "00"; alu_op <= "001"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when "00100001" => bus_sel <= "00"; alu_op <= "111"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '1';
			when others => bus_sel <= "00"; alu_op <= "000"; reg_a_we <= '0'; out_we <= '0'; reg_we <= '0';
		end case;
	end process;

end decode_beh;
