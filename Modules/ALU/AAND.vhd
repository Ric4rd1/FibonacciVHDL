library ieee;
use ieee.std_logic_1164.all;

entity AAND is
	Port(		a_in, b_in : in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end AAND;

architecture behavioral of AAND is
begin
	
	o <= a_in and b_in;

end behavioral;