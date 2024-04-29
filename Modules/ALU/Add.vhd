--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--
--entity Add is
--	Port(		add1, add2 : in std_logic_vector(7 downto 0);
--				res : out std_logic_vector(7 downto 0);
--				carry : out std_logic);
--end Add;
--
--architecture behavioral of ADD is
--	signal sum : signed(8 downto 0);
--
--begin
--	
--	sum <= signed('0' & add1) + signed('0' & add2);
--	res <= std_logic_vector(sum(7 downto 0));
--	carry <= sum(8);
--
--end behavioral;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Add is
	Port(		add1, add2 : in std_logic_vector(7 downto 0);
				res : out std_logic_vector(7 downto 0);
				carry : out std_logic);
end Add;

architecture behavioral of ADD is
	signal sum : std_logic_vector(8 downto 0);

begin
	
	sum <= ('0' & add1) + ('0' & add2);
	res <= sum(7 downto 0);
	carry <= sum(8);

end behavioral;