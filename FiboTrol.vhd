LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity FiboTrol is
	port ( rst : in STD_LOGIC;
			 enable : in STD_LOGIC;
			 complete : in STD_LOGIC;   
			 clk : in STD_LOGIC;
			 instructions : out STD_LOGIC_VECTOR(17 Downto 0));
end entity;
			 
architecture Behaviour of FiboTrol is
	-- Define states
	type state is (s0, s1, s2, s3, s4, s5);
	-- Declare signal
	signal presentState, nextState : state;
BEGIN

	statereg: process (Clk, Rst)
	begin
    -- Asynchronous Rst
    if rst = '1' then
       presentState <= s0;
     elsif rising_edge(clk) then
       presentState <= nextState;
     end if;
   end process statereg;
  
	-- Define the Next-State Logic Process
	-- Will obtain the next state based on the inputs and current state
	process(presentState, enable)
	begin
		case presentState is 
			
			when s0 =>
				if (enable = '0') then
					nextState <= s0;
				elsif (enable = '1') then 
					nextState <= s1;
				end if; 
			
			when s1 =>
				nextState <= s2;
				
			when s2 =>
				if (complete = '0') then
					nextState <= s3;
				elsif (complete = '1') then 
					nextState <= s5;
				end if;
				
			when s3 =>
				nextState <= s4;
				
			when s4 =>
				nextState <= s2;
				
			when s5 =>
				nextState <= s5;
				
			when others =>
				nextState <= s0;
			
		end case;
	end process;

	-- The output of a Moore Machine is determined by the present_state only
  output: process (presentState)
  begin
    case presentState is
       when s0 =>
          instructions <= "000000000000000000";
       when s1 =>
          instructions <= "000000000100100100";
       when s2 =>
          instructions <= "000000101000000011";
		 when s3 =>
			 instructions <= "000000000000100011";
		 when s4 =>
			 instructions <= "000000000000000111";
		 when s5=>
			 instructions <= "000000000000000000";
      when others =>
          instructions <= "000000000000000000";
    end case;
  end process output;
	
	-- Define Output (MOORE)
	--                ALU reg reg reg reg sel 
	--                 +   3   2   1   0  1 0
--	instructions <= "0000 000 000 000 000 0 0" when M = s0 else
--		  "0000 000 001 001 001 0 0" when M = s1 else 
--		  "0000 001 010 000 000 1 1" when M = s2 else
--		  "0000 000 000 001 000 1 1" when M = s3 else
--		  "0000 000 000 000 001 1 1" when M = s4 else
--		  "0000 000 000 000 000 0 0" when M = s5;
		  
end Behaviour;