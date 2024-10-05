library ieee;
use ieee.std_logic_1164.all;

entity extensoral is
port(a,b : in std_logic_vector(7 downto 0); 
k : in std_logic_vector(3 downto 0);
cin : out std_logic; 
ia, ib : out std_logic_vector(7 downto 0));
end extensoral;

architecture extensor of extensoral is

begin


with k select
	ia <= a when "0001",
	a when "0010",
	a when "0100",
	(a and b)when "1100",
	(a or b) when "1101",
	(a xor b) when "1110",
	(not a) when "1111",
	a(0)&a(1)&a(2)&a(3)&a(4)&a(5)&a(6)&a(7) when "1011",
	a(3 downto 0) & a(7 downto 4) when "1010",
a when others;

with k select
	ib <= b when "0001",
	(not b) when "0010", 
	"00000000" when others;

cin <= not(k(3)) and not(k(0));
end architecture; 