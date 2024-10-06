library ieee;
use ieee.std_logic_1164.all;

entity extensoral is
port(a_extensoral,b_extensoral : in std_logic_vector(7 downto 0); 
k_extensoral : in std_logic_vector(3 downto 0);
cout_extensoral : out std_logic; 
ia_extensoral, ib_extensoral : out std_logic_vector(7 downto 0));
end extensoral;

architecture extensor of extensoral is

begin


with k_extensoral select
	ia_extensoral <= a_extensoral when "0001",
	a_extensoral when "0010",
	a_extensoral when "0100",
	(a_extensoral and b_extensoral)when "1100",
	(a_extensoral or b_extensoral) when "1101",
	(a_extensoral xor b_extensoral) when "1110",
	(not a_extensoral) when "1111",
	a_extensoral(0)&a_extensoral(1)&a_extensoral(2)&a_extensoral(3)&a_extensoral(4)&a_extensoral(5)&a_extensoral(6)&a_extensoral(7) when "1011",
	a_extensoral(3 downto 0) & a_extensoral(7 downto 4) when "1010",
	a_extensoral when others;

with k_extensoral select
ib_extensoral <= b_extensoral when "0001",
	(not b_extensoral) when "0010", 
	"00000000" when others;

	cout_extensoral <= not(k_extensoral(3)) and not(k_extensoral(0));
end architecture; 