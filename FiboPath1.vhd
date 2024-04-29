library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FiboPath1 is
	port(
		--inputs
		clk : in std_logic;
		FiboA0 : in std_logic_vector(7 Downto 0);
		FiboB0 : in std_logic_vector(7 Downto 0);
		Instructions : in std_logic_vector(10 DownTo 0);
		--outputs
		F : out std_logic_vector(7 Downto 0)
		);
end FiboPath1;

architecture arch of FiboPath1 is
	-- signal declaration
	signal FiboA1 : std_logic_vector(7 Downto 0) := (others=>'0');

	signal Mux0ToReg0 : std_logic_vector(7 Downto 0) := (others=>'0');
	signal Mux1ToReg1 : std_logic_vector(7 Downto 0) := (others=>'0');
	signal Reg1ToAdd : std_logic_vector(7 Downto 0) := (others=>'0');
	signal Reg0ToAdd : std_logic_vector(7 Downto 0) := (others=>'0');
	signal AddToReg3 : std_logic_vector(7 Downto 0) := (others=>'0');
	
	signal Sel0 : std_logic;
	signal Sel1 : std_logic;
	signal CMDReg0 : std_logic_vector(2 Downto 0);
	signal CMDReg1 : std_logic_vector(2 Downto 0);
	signal CMDReg3 : std_logic_vector(2 Downto 0);
	signal rst : std_logic;
		
	--Component Declaration
	-- MUX
	component MyMux is
		port(
		  input1	: in STD_LOGIC_VECTOR(7 downto 0);
		  input2 : in STD_LOGIC_VECTOR(7 downto 0);
		  sel		: in STD_LOGIC;
		  output	: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
		
	-- Register
	component FiboRegister is
		port(
			Clk: in std_logic;
			reset: in std_logic;
			cmd : in std_logic_vector(2 downto 0);
			DataIn :in  std_logic_vector(7 downto 0);
			DataOut: out std_logic_vector(7 downto 0)
		);
	end component;
		
	-- Adder
	component add8bit is
		port(
			data0x		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data1x		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			result		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
begin
	-- Read Intructions
	Sel0 <= Instructions(0);
	Sel1 <= Instructions(1);
	CMDReg0 <= instructions(4 Downto 2);
	CMDReg1 <= instructions(7 Downto 5);
	CMDReg3 <= instructions(10 Downto 8);
	
	rst <= '0';


	--Component Instantiation
	Mux0 : MyMux
		port map(
		  input1	=> FiboA0,
		  input2 => FiboA1,
		  sel	=>	Sel0,
		  output =>	Mux0ToReg0
		);
		
	Mux1 : MyMux
		port map(
		  input1	=> FiboB0,
		  input2 => Reg0ToAdd,
		  sel	=>	Sel1,
		  output =>	Mux1ToReg1
		);
		
	Reg0 : FiboRegister
		port map(
			Clk => clk,
			reset => rst, 
			cmd => CMDReg0,
			DataIn => Mux0ToReg0,
			DataOut => Reg0ToAdd
		);
		
	Reg1 : FiboRegister
		port map(
			Clk => clk,
			reset => rst, 
			cmd => CMDReg1,
			DataIn => Mux1ToReg1,
			DataOut => Reg1ToAdd
		);
		
	Add : add8bit
		port map(
			data0x => Reg0ToAdd,
			data1x => Reg1ToAdd,
			result => AddToReg3
		);
		
	Reg3 : FiboRegister
		port map(
			Clk => clk,
			reset => rst, 
			cmd => CMDReg3,
			DataIn => AddToReg3,
			DataOut => FiboA1
		);
		
	-- Output
	F <= FiboA1;

end arch;