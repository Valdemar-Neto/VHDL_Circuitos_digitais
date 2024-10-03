---testemaluco
library ieee;
use ieee.std_logic_1164.all;

entity xor8bits is
	port(a,b : in std_logic_vector(7 downto 0); z : out std_logic_vector(7 downto 0));
end xor8bits;

architecture xor8 of xor8bits is
begin
z <= (a and not b) or (not a and b);
end architecture;