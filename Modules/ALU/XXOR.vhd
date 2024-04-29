library ieee;
use ieee.std_logic_1164.all;

entity XXOR is
	Port(		a_in, b_in : in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end XXOR;

architecture behavioral of XXOR is
begin
	
	o <= a_in XOR b_in;

end behavioral;