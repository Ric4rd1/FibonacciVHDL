library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

LIBRARY lpm;
USE lpm.all;

-- Structure of my ALU

entity ALU is
	port (	A						: in std_logic_vector(7 downto 0);
				B 						: in std_logic_vector(7 downto 0);
				sel 					: in std_logic_vector(3 downto 0);
				sal1 					: out std_logic_vector(7 downto 0); -- cociente
				sal2 					: out std_logic_vector(7 downto 0)); -- residuo
end ALU;


architecture behavioral of ALU is

	-- Component declaration
	
	component Add is
		port(		add1, add2      : in std_logic_vector(7 downto 0);
					res 				 : out std_logic_vector(7 downto 0);
					carry 			 : out std_logic);
	end component Add;
	
	component Subs is
		port(		subs1, subs2 	 : in std_logic_vector(7 downto 0);
					res 				 : out std_logic_vector(7 downto 0));
	end component Subs;
	
	component Mult is
		port(		dataa				 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					datab				 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					result		    : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
	end component Mult;
	
	component Div is
		port(		denom				 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					numer				 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					quotient			 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
					remain			 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	end component Div;
	
	component OOR is
		port(		a_in, b_in 		 : in std_logic_vector(7 downto 0);
					o 					 : out std_logic_vector(7 downto 0));
	end component OOR;
	
	component AAND is
		port(		a_in, b_in 		 : in std_logic_vector(7 downto 0);
					o 					 : out std_logic_vector(7 downto 0));
	end component AAND;
	
	component NNOR is
		port(		a_in, b_in 		 : in std_logic_vector(7 downto 0);
					o 					 : out std_logic_vector(7 downto 0));
	end component NNOR;
	
	component XXOR is
		port(		a_in, b_in 		 : in std_logic_vector(7 downto 0);
					o 					 : out std_logic_vector(7 downto 0));
	end component XXOR;
	
	component NNOT is
		port(		ab_in 			 : in std_logic_vector(7 downto 0);
					o 					 : out std_logic_vector(7 downto 0));
	end component NNOT;

	
	-- Declare all the signals we'll use to divide the ouputs
	 signal sal1Add    : std_logic_vector(7 downto 0);
	 signal sal2Add    : std_logic;
	 signal sal1Subs   : std_logic_vector(7 downto 0);
	 signal sal1Subs2  : std_logic_vector(7 downto 0);
	 signal sal1Mult   : std_logic_vector(7 downto 0);
	 signal sal2Mult   : std_logic_vector(7 downto 0);
	 signal sal1Div    : std_logic_vector(7 downto 0);
	 signal sal2Div    : std_logic_vector(7 downto 0);
	 signal sal1Div2   : std_logic_vector(7 downto 0);
	 signal sal2Div2   : std_logic_vector(7 downto 0);
	 signal sal1And    : std_logic_vector(7 downto 0);
	 signal sal1Or     : std_logic_vector(7 downto 0);
	 signal sal1XOR    : std_logic_vector(7 downto 0);
	 signal sal1NOR    : std_logic_vector(7 downto 0);
	 signal sal1NOTA   : std_logic_vector(7 downto 0);
	 signal sal1NOTB   : std_logic_vector(7 downto 0);

begin
		
	Ad : Add
		port map (add1 						=> A,
					 add2 						=> B,
					 res 							=> sal1Add,
					 carry 						=> sal2Add);
					 
	Sub : Subs
		port map (Subs1 						=> A,
					 Subs2 						=> B,
					 res 							=> sal1Subs);
	
	Sub2 : Subs
		port map (Subs1 						=> B,
					 Subs2 						=> A,
					 res 							=> sal1Subs2);
	
	M : Mult
		port map (dataa						=> A,
					 datab					   => B,
					 result (7 downto 0)    => sal1Mult,
					 result (15 downto 8)   => sal2Mult); 
	
	D : Div
		port map (denom  						=> B,
					 numer 						=> A,
					 quotient 					=> sal1Div,
					 remain 						=> sal2Div);
	
	D2 : Div
		port map (denom 						=> A,
					 numer 						=> B,
					 quotient 					=> sal1Div2,
					 remain 						=> sal2Div2);
	
	AA : AAND
		port map (a_in 						=> A,
					 b_in 						=> B,
					 o 							=> sal1And);
					 
	OO : OOR
		port map (a_in 						=> A,
					 b_in 						=> B,
					 o								=> sal1Or);
					 
	NN : NNOR
		port map (a_in 						=> A,
					 b_in 						=> B,
					 o 							=> sal1Nor);
	
	XX : XXOR
		port map (a_in 						=> A,
					 b_in 						=> B,
					 o 							=> sal1Xor);

	NA : NNOT
		port map (ab_in	 					=> A,
					 o 							=> sal1NOTA);
					 
	NB : NNOT
		port map (ab_in 						=> B,
					 o 							=> sal1NOTB);
	
	process (sel)--, sal1Add, sal2Add, sal1Subs, sal1Subs2, sal1Mult, sal2Mult, sal1Div, sal2Div, sal1Div2, sal2Div2, sal1And, sal1Or, sal1Nor, sal1Xor, sal1NOTA, sal1NOTB
	begin
		
		case sel is
			
			when "0000" =>
				sal1 <= sal1Add;
				sal2 <= "0000000" & sal2Add;
		
			when "0001" =>
				sal1 <= sal1Subs;
				sal2 <= (others=> '0');
			
			when "0010" =>
				sal1 <= sal1Subs2;
				sal2 <= (others=> '0');
			
			when "0011" =>
				sal1 <= sal1Mult;
				sal2 <= sal2Mult;
				
			when "0100" =>
				sal1 <= sal1Div;
				sal2 <= sal2Div;	
			
			when "0101" =>
				sal1 <= sal1Div2;
				sal2 <= sal2Div;	
				
			when "0110" =>
				sal1 <= sal1Or;
				sal2 <= (others=> '0');
			
			when "0111" =>
				sal1 <= sal1And;
				sal2 <= (others=> '0');
				
			when "1000" =>
				sal1 <= sal1Nor;
				sal2 <= (others=> '0');
			
			when "1001" =>
				sal1 <= sal1Xor;
				sal2 <= (others=> '0');
			
			when "1010" =>
				sal1 <= sal1NOTA;
				sal2 <= (others=> '0');
				
			when "1011" =>
				sal1 <= sal1NOTB;
				sal2 <= (others=> '0');
			
			when others =>
				sal1 <= (others=> '0');
				sal2 <= (others=> '0');
				
		end case;
	end process;
	
end behavioral;


-- I N T E N T O 2

--library ieee;
--use ieee.std_logic_1164.all;
--
---- Declaración de componentes
--
--entity ALU is
--    port (
--        A: in std_logic_vector(7 downto 0);
--        B: in std_logic_vector(7 downto 0);
--        sel: in std_logic;
--        sal1: out std_logic_vector(7 downto 0);
--        sal2: out std_logic_vector(7 downto 0)
--    );
--end ALU;
--
--architecture behavioral of ALU is
--
--	component Div is
--		port(		denom		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--					numer		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--					quotient		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--					remain		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
--	end component Div;
--	
--	component Mult is
--		port(		dataa		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--					datab		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--					result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
--	end component Mult;
--
--    -- Declaración de señales para el resultado de Div y Mult
--    signal sal1_div, sal2_div: std_logic_vector(7 downto 0);
--    signal sal1_mult, sal2_mult: std_logic_vector(7 downto 0);
--
--begin
--
--    -- Proceso para seleccionar el componente a instanciar
--    process(sel)
--    begin
--        if sel = '0' then
--            sal1 <= sal1_div;
--            sal2 <= sal2_div;
--        else
--            sal1 <= sal1_mult;
--            sal2 <= sal2_mult;
--        end if;
--    end process;
--
--    -- Instancia de los componentes Div y Mult
--
--    D: Div
--        port map (
--            denom => B,
--            numer => A,
--            quotient => sal1_div,
--            remain => sal2_div
--        );
--
--    M: Mult
--        port map (
--            dataa => A,
--            datab => B,
--            result (7 downto 0) => sal1,
--   			result (15 downto 8) => sal2  -- Concatenación de sal2 para obtener un vector de 16 bits
--        );
--
--end behavioral;
