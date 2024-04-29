Library IEEE;
Use IEEE.std_logic_1164.all;

Entity Comparador8bits is
	Port(A, B: in std_logic_vector(7 downto 0);
			myrQue, mnrQue, igualQue: out std_logic);
End Comparador8bits;

Architecture compArch of Comparador8bits is
	Begin 
	
	myrQue <= '1' when (A>B)else '0';
	mnrQue <= '1' when (A<B)else '0';
	igualQue <= '1' when (A=B)else '0';
	
End compArch;
