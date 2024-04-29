library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Subs is
	Port(		subs1, subs2 : in std_logic_vector(7 downto 0);
				res 			 : out std_logic_vector(7 downto 0));
end Subs;

architecture behavioral of Subs is

begin
	res <= subs1 - subs2;

end behavioral;