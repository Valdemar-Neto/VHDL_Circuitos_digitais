library ieee;
library ieee.std_logic_1164.all;

entity cinext is
    port (
        k : in std_logic_vector(3 downto 0);
        cin: out std_logic
    );
end entity cinext;

architecture structural of cinext is
begin
    cin <= not(k(3)) and not(k(0));
end architecture structural;
