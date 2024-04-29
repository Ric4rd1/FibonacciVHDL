library ieee;
use ieee.std_logic_1164.all;

entity NNOR is
	Port(		a_in, b_in : in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end NNOR;

architecture behavioral of NNOR is
begin
	
	o <= a_in NOR b_in;

end behavioral;