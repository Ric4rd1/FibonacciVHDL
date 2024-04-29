library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FiboRegister is
	port(
		Clk: in std_logic;
		reset: in std_logic;
		cmd : in std_logic_vector(2 downto 0);
		DataIn :in  std_logic_vector(7 downto 0);
		DataOut: out std_logic_vector(7 downto 0));
end FiboRegister;

architecture Behavioral of FiboRegister is
	signal aux : std_logic_vector(7 downto 0);
  
begin
	
	FiboReg: process(Clk) is
	begin
		if(rising_edge(Clk)) then
			if(reset = '0') then
				case cmd is
					-- LOAD
					when "001" => aux <= DataIn;
					-- INCREMENT
					when "010" => aux <= aux + 1;
					-- DECREMENT
					when "011" => aux <= aux - 1;
					-- SHIFT TO THE LEFT
					when "100" => aux <= aux(6 downto 0) & '0';
									--DataOut(7) <= DataIn(6);
		--								  DataOut(6) <= DataIn(5);
		--								  Dataout(5) <= DataIn(4);
		--								  DataOut(4) <= DataIn(3);
		--								  DataOut(3) <= DataIn(2);
		--								  DataOut(2) <= DataIn(1);
		--								  DataOut(1) <= DataIn(0);
		--								  DataOut(0) <= '0';
					-- SHIFT TO THE RIGHT
					when "101" => aux <= '0' & aux(7 downto 1);
		--								DataOut(0) <= DataIn(1);
		--								  DataOut(1) <= DataIn(2);
		--								  DataOut(2) <= DataIn(3);
		--								  DataOut(3) <= DataIn(4);
		--								  DataOut(4) <= DataIn(5);
		--								  DataOut(5) <= DataIn(6);
		--								  DataOut(6) <= DataIn(7);
		--								  DataOut(7) <= '0';
					-- ROTATE TO THE LEFT
					when "110" => aux <= aux(6 downto 0) & aux(7);
		--								DataOut(7) <= DataIn(6);
		--								  DataOut(6) <= DataIn(5);
		--								  Dataout(5) <= DataIn(4);
		--								  DataOut(4) <= DataIn(3);
		--								  DataOut(3) <= DataIn(2);
		--								  DataOut(2) <= DataIn(1);
		--								  DataOut(1) <= DataIn(0);
		--								  DataOut(0) <= DataIn(7);
					-- ROTATE TO THE RIGHT
					when "111" => aux <= aux(0) & aux(7 downto 1);
		--								DataOut(0) <= DataIn(1);
		--								  DataOut(1) <= DataIn(2);
		--								  DataOut(2) <= DataIn(3);
		--								  DataOut(3) <= DataIn(4);
		--								  DataOut(4) <= DataIn(5);
		--								  DataOut(5) <= DataIn(6);
		--								  DataOut(6) <= DataIn(7);
		--								  DataOut(7) <= DataIn(0);
					-- KEEP ("000")
					when others => null;
				end case;
				DataOut <= aux;
			else
				DataOut <= "00000000";
			end if;
		end if;
	end process;
	
end Behavioral;