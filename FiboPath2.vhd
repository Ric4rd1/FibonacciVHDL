library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FiboPath2 is
	port(
		--inputs
		clk : in std_logic;
		N : in std_logic_vector(7 Downto 0);
		instructions : in std_logic_vector(2 Downto 0);
		FiboC : in std_logic_vector(7 Downto 0);
		--outputs
		complete : out std_logic
		);
		
end FiboPath2;

architecture arch of FiboPath2 is
begin

end architecture;