library ieee;
use ieee.std_logic_1164.all;

entity ULA_decrementador is
    port(
        A_decrementador : in  std_logic_vector(7 downto 0); 
        S_decrementador : out std_logic_vector(7 downto 0); 
        Cout_decrementador: out std_logic                  
    );
end entity ULA_decrementador;

architecture combinational of ULA_decrementador is
    signal temp : std_logic_vector(7 downto 0); -- Usar 8 bits para o resultado
begin
    
    temp(0) <= not A_decrementador(0);  
    temp(7 downto 1) <= A_decrementador(7 downto 1);

    S_decrementador <= temp;

    
    Cout_decrementador <= A_decrementador(7) and A_decrementador(6) and A_decrementador(5) and 
                          A_decrementador(4) and A_decrementador(3) and A_decrementador(2) and 
                          A_decrementador(1) and not A_decrementador(0);

end architecture combinational;
