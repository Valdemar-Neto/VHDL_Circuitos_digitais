library ieee;
use ieee.std_logic_1164.all;

entity abext is
	port (
		a, b   : in std_logic;
		k      : in std_logic_vector(3 downto 0);
		ia, ib : out std_logic
	);
end entity abext;

architecture structural of abext is
begin
    
    ia <= (not(k(3)) and a) or (not(k(1)) and a and b) or (not(k(1)) and k(0) and a) or (k(1) and k(0) and not(a)) or
          (k(1) and not(k(0)) and a and not(b)) or (k(2)and k(1) and not(a) and b) or (k(3) and not(k(1)) and k(0) and b);

    ib <= (not(k(2))and not(k(0)) and not(b)) or (not(k(2)) and not(k(1)) and b) or
          (not(k(3)) and k(2) and k(0));
end architecture structural;
