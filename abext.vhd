library ieee;
use ieee.std_logic_1164.all;

entity abext is
port(a,b : in std_logic_vector(7 downto 0); 
k : in std_logic_vector(3 downto 0);
cin : out std_logic; 
ia, ib : out std_logic_vector(7 downto 0));
end abext;

architecture extensor of abext is
signal nota : std_logic_vector(7 downto 0);
signal notb : std_logic_vector(7 downto 0);
signal saidaxor : std_logic_vector(7 downto 0);
component xor8bits is
	port(a,b : in std_logic_vector(7 downto 0); z : out std_logic_vector(7 downto 0));
end component xor8bits;
begin
nota <= not a;
notb <= not b;
xorgate: xor8bits port map(a,b, saidaxor);
with k select
	ia <= a when "0001",
	a when "0010",
	a when "0100",
	(a and b)when "1100",
	(a or b) when "1101",
	saidaxor when "1110",
	nota when "1111",
a when others;

with k select
	ib <= b when "0001",
	notb when "0010", 
	"00000000" when others;
with k select
	cin <= '1' when "0010",
	'1' when "0100",
	'0' when others;
end architecture; 