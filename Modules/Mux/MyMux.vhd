library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MyMux is
	port(input1	: in STD_LOGIC_VECTOR(7 downto 0);
		  input2 : in STD_LOGIC_VECTOR(7 downto 0);
		  sel		: in STD_LOGIC;
		  output	: out STD_LOGIC_VECTOR(7 downto 0)
		  );
end MyMux;

architecture Behavioral of MyMux is
begin

-----------------------------------------------------------------------------
-- Uncoment or comment according to the desired implementation!
-----------------------------------------------------------------------------

-------- With / Select --------

	with sel select output <=
		input1 when '0',
		input2 when '1';


-------- When / Else --------	

--	output <= input1 when sel = '0' else 
--				 input2 when sel = '1';
-----------------------------------------------------------------------------
-- Uncoment the begin and end proccess in order to use the other statements!
-----------------------------------------------------------------------------

--selection: process(sel,input1, input2)
--	begin
	
-------- If  / else --------

--		if(sel = '0') then
--			output <= input1;
--		else
--			output <= input2;
--		end if;


-------- Case --------

--		case sel is
--			when '0' =>
--				output <= input1;
--			when '1' =>
--				output <= input2;
--		end case:
		
--end process selection;

end Behavioral;

			
	