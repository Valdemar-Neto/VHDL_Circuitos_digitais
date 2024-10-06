library ieee;
use ieee.std_logic_1164.all;

entity ULA_somador is
	port(
		A, B : in std_logic_vector(7 downto 0);
		cout : in std_logic;
		soma : out std_logic_vector (7 downto 0);
		carry_out : out std_logic
	);
end ULA_somador;

architecture behavior of ULA_somador is
	signal carry: std_logic_vector(8 downto 0);
begin 
	---inicializando o carry com valor de cout
	carry(0) <= cout;
	
	process(A, B)
	begin
		for i in 0 to 7 loop
			carry(i+1) <=( A(i) and B(i)) or (carry(i) and (A(i) xor B(i)));
			soma(i) <= 	A(i) xor B(i) xor carry(i); ----SOMA
		end loop;
		
		carry_out <= carry(8);
	end process;
end behavior;
