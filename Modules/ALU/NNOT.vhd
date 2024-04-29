library ieee;
use ieee.std_logic_1164.all;

entity NNOT is
	Port(		ab_in: in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end NNOT;

architecture behavioral of NNOT is
begin
	
	o <= not ab_in;

end behavioral;