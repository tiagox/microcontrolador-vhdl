----------------------------------------------------------------------------------
-- Realizado por la catedra  Diseño Lógico (UNTREF) en 2015
-- Tiene como objeto brindarle a los alumnos un template del procesador requerido
-- Profesores Martín Vázquez - Lucas Leiva
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity proc is
	port (
		clk    : in  std_logic;
		rst    : in  std_logic;
		input  : in  std_logic_vector(7 downto 0);
		output : out std_logic_vector(7 downto 0)
	);
end proc;

architecture beh_proc of proc is

	-- Declaración de los componentes utilziados

	component regs
		port (
			clk  : in  std_logic;
			rst  : in  std_logic;
			we   : in  std_logic;
			rd   : in  std_logic_vector(3 downto 0);
			rs   : in  std_logic_vector(3 downto 0);
			din  : in  std_logic_vector(7 downto 0);
			dout : out std_logic_vector(7 downto 0)
		);
	end component;

	component alu
		port (
			op   : in  std_logic_vector(2 downto 0);
			a, b : in  std_logic_vector(7 downto 0);
			s    : out std_logic_vector(7 downto 0)
		);
	end component;

	component rom_prog
		port (
			addr   : in  std_logic_vector(6 downto 0);
			output : out std_logic_vector(15 downto 0)
		);
	end component;

	component decode
		port (
			input    : in  std_logic_vector(8 downto 0);
			reg_we   : out std_logic;
			out_we   : out std_logic;
			reg_a_we : out std_logic;
			alu_op   : out std_logic_vector(2 downto 0);
			bus_sel  : out std_logic_vector(1 downto 0)
		);
	end component;

	-- ================
	-- ================
	-- declaración de señales usadas

	-- Banco de registros
	signal we     : std_logic; -- senal para escribir en el banco de registro
	signal rd, rs : std_logic_vector(3 downto 0);
	-- signal ....

	-- ================

begin

	-- Instaciacion de componentes utilziados

	-- Banco de registros
		eregs : regs port map (
			clk  => clk,
			rst  => rst,
			we   => we,
			rd   => rd,
			rs   => rs,
			din  => rs, -- hay que cpmpletar esta instanciación
			dout => rs  -- hay que cpmpletar esta instanciación
		);
	--
	-- La ALU
		ealu : alu port map ();

	-- La ROM de programa
		erom_prog : rom_prog port map ();

	-- El decodificador de la instrucción
		edecode : decode port map ();

	-- ================
	-- Descripción de mux que funciona como "bus"
	-- controlado por bus_sel

	-- ================


	-- ================
	-- Descripción de los almacenamientos
	-- Los almacenamientos que se deben decribir aca son:
	-- <reg_a> 8 bits
	-- <reg_out> de 8 bits
	-- <pc> de 8 bits
	-- <ir> de 16 bits

	process(clk, rst)
	begin
		if (rst='1') then

		elsif (rising_edge(clk)) then

		end if;
	end process;

end beh_proc;

