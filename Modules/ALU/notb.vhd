library ieee;
use ieee.std_logic_1164.all;

entity notb is
	Port(		b_in: in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end notb;

architecture behavioral of notb is
begin
	
	o <= not b_in;

end behavioral;