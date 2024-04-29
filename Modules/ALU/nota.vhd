library ieee;
use ieee.std_logic_1164.all;

entity nota is
	Port(		a_in: in std_logic_vector(7 downto 0);
				o : out std_logic_vector(7 downto 0));
end nota;

architecture behavioral of nota is
begin
	
	o <= not a_in;

end behavioral;