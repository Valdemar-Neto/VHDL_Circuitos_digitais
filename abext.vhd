library ieee;
use ieee.std_logic_1164.all;

entity abext is
port(a,b : in std_logic_vector(7 downto 0); 
k : in std_logic_vector(3 downto 0);
cin : out std_logic; 
ia, ib : out std_logic_vector(7 downto 0));
end abext;

architecture extensor of abext is

begin


with k select
	ia <= a when "0001",
	a when "0010",
	a when "0100",
	(a and b)when "1100",
	(a or b) when "1101",
	(a xor b) when "1110",
	(not a) when "1111",
a when others;

with k select
	ib <= b when "0001",
	(not b) when "0010", 
	"00000000" when others;
with k select
	cin <= '1' when "0010",
	'1' when "0100",
	'0' when others;
end architecture; 