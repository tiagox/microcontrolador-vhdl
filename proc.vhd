----------------------------------------------------------------------------------
-- Realizado por la catedra  Diseño Lógico (UNTREF) en 2015
-- Tiene como objeto brindarle a los alumnos un template del procesador requerido
-- Profesores: Martín Vázquez - Lucas Leiva
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity proc is
	port (
		clk, reset : in  std_logic;
		input      : in  std_logic_vector(7 downto 0);
		output     : out std_logic_vector(7 downto 0)
	);
end proc;

architecture beh_proc of proc is

	----------------------------------------------------------------------------
	-- Declaración de los componentes a utilizar.
	----------------------------------------------------------------------------

	component alu
		port (
			op   : in  std_logic_vector(2 downto 0);
			a, b : in  std_logic_vector(7 downto 0);
			s    : out std_logic_vector(7 downto 0)
		);
	end component;

	component decode
		port (
			input                    : in  std_logic_vector(7 downto 0);
			reg_we, out_we, reg_a_we : out std_logic;
			alu_op                   : out std_logic_vector(2 downto 0);
			bus_sel                  : out std_logic_vector(1 downto 0)
		);
	end component;

	component regs
		port (
			clk, reset, we : in  std_logic;
			rd, rs         : in  std_logic_vector(3 downto 0);
			din            : in  std_logic_vector(7 downto 0);
			dout           : out std_logic_vector(7 downto 0)
		);
	end component;

	component rom_prog
		port (
			addr   : in  std_logic_vector(6 downto 0);
			output : out std_logic_vector(15 downto 0)
		);
	end component;

	----------------------------------------------------------------------------
	-- Declaración de señales.
	----------------------------------------------------------------------------

	signal alu_op                                    : std_logic_vector(2 downto 0)  := (others => '0');
	signal bus_in, bus_out, data_out, reg_a, reg_out : std_logic_vector(7 downto 0)  := (others => '0');
	signal reg_we, reg_a_we, out_we                  : std_logic                     := '0';
	signal rd, rs                                    : std_logic_vector(3 downto 0)  := (others => '0');
	signal bus_sel                                   : std_logic_vector(1 downto 0)  := (others => '0');
	signal pc                                        : std_logic_vector(6 downto 0)  := (others => '0');
	signal rom_output, ir                            : std_logic_vector(15 downto 0) := (others => '0');
begin

	----------------------------------------------------------------------------
	-- Instanciación de componentes.
	----------------------------------------------------------------------------

		e_alu : alu port map (
			op => alu_op,
			a  => bus_in,
			b  => reg_a,
			s  => bus_out
		);

		e_regs : regs port map (
			clk   => clk,
			reset => reset,
			we    => reg_we,
			rd    => ir(7 downto 4),
			rs    => ir(3 downto 0),
			din   => bus_out,
			dout  => data_out
		);

		e_rom_prog : rom_prog port map (
			addr   => pc,
			output => rom_output
		);

		e_decode : decode port map (
			input    => ir(15 downto 8),
			bus_sel  => bus_sel,
			alu_op   => alu_op,
			reg_a_we => reg_a_we,
			out_we   => out_we,
			reg_we   => reg_we
		);

	----------------------------------------------------------------------------
	-- Descripción de mux que funciona como "bus" controlado por `bus_sel`
	----------------------------------------------------------------------------

	e_mux_sel : process(bus_sel, data_out, ir, input)
	begin
		case (bus_sel) is
			when "00" => bus_in <= data_out;
			when "01" => bus_in <= ir(7 downto 0);
			when "10" => bus_in <= input;
			when others => bus_in <= (others => '0');
		end case;
	end process;

	----------------------------------------------------------------------------
	-- Descripción de los almacenamientos
	-- Los almacenamientos que se deben decribir aquí son:
	--     * <reg_a> 8 bits
	--     * <reg_out> de 8 bits
	--     * <pc> de 8 bits
	--     * <ir> de 16 bits
	----------------------------------------------------------------------------

	process(clk, reset)
	begin
		if (reset = '1') then
			pc <= (others => '0');
		elsif (rising_edge(clk)) then
			pc <= pc + 1;

			ir <= rom_output;

			if (reg_a_we = '1') then
				reg_a <= bus_in;
			end if;

			if (out_we = '1') then
				reg_out <= bus_out;
			end if;
		end if;
	end process;

end beh_proc;

