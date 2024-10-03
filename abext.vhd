library ieee;
use ieee.std_logic_1164.all;
----- entidade abext: entradas a e b de 8 bits, k de 4 bits; saidas: ia e ib de 8 bits, cin de 1 bit;
----- componente principal do extensor AL
entity abext is
port(a,b : in std_logic_vector(7 downto 0); 
k : in std_logic_vector(3 downto 0);
cin : out std_logic; 
ia, ib : out std_logic_vector(7 downto 0));
end abext;

architecture extensor of abext is
signal tempa : std_logic_vector(7 downto 0);
signal tempb : std_logic_vector(7 downto 0);
signal saidaxor : std_logic_vector(7 downto 0);
component xor8bits is
	port(a,b : in std_logic_vector(7 downto 0); z : out std_logic_vector(7 downto 0));
end component xor8bits;
begin
xorgate: xor8bits port map(a,b, saidaxor);
with k select
	ia <= saidaxor when "1110", 
a when others;

with k select
	ib <= "00000000" when "1110", 
b when others;
with k select
	cin <= '1' when "0010",
	'0' when others;
end architecture; 
