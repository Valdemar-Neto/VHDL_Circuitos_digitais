library ieee;
use ieee.std_logic_1164.all;

entity ULA_decrementador is
	port(
			A_decrementador : in std_logic_vector(7 downto 0);
			result_decrementador: out std_logic_vector (7 downto 0)
	);
end ULA_decrementador;


architecture behavior of ULA_decrementador is
    signal carry : std_logic := '1';  -- Inicializamos o carry com '1' para subtrair 1
begin
    process(A_decrementador)
    begin
        carry <= '1'; 

        for i in 0 to 7 loop -- BITWISE
            result_decrementador(i) <= A_decrementador(i) xor carry; 
            carry <= (not A_decrementador(i)) and carry; 
        end loop;
    end process;
end behavior;