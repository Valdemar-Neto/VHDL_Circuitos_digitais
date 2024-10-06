library ieee;
use ieee.std_logic_1164.all;

entity ULA_somador is
	port(
		A_somador, B_somador: in std_logic_vector(7 downto 0);
		cin : in std_logic;
		soma : out std_logic_vector (7 downto 0);
		carry_out : out std_logic
	);
end ULA_somador;

architecture behavior of ULA_somador is
	signal carry: std_logic_vector(8 downto 0);
begin 
	---inicializando o carry com valor de cout
	carry(0) <= cin;
	
	process(A_somador, B_somador)
	begin
		for i in 0 to 7 loop
			carry(i+1) <=( A_somador(i) and B_somador(i)) or (carry(i) and (A_somador(i) xor B_somador(i)));
			soma(i) <= 	A_somador(i) xor B_somador(i) xor carry(i); ----SOMA
		end loop;
		
		carry_out <= carry(8);
	end process;
end behavior;
