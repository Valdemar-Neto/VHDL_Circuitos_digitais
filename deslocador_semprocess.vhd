library ieee;
use ieee.std_logic_1164.all;

entity deslocador_semprocess is
    Port (
        sel_deslocador : in std_logic_vector(2 downto 0); -- seleção de controle
        A_deslocador : in std_logic_vector(7 downto 0);   -- entrada de 8 bits
        Y_deslocador : out std_logic_vector(7 downto 0);  -- saída de 8 bits
        carry_out_deslocador : out std_logic              -- carry (sinal de transporte) de saída
    );
end deslocador_semprocess;

architecture main of deslocador_semprocess is
    signal carry_temp_deslocador : std_logic;  -- Sinal interno para armazenar o carry
begin
    -- Atribuições contínuas para Y
    Y_deslocador <= 
A_deslocador when sel_deslocador = "000" else 
        "0" & A_deslocador(7 downto 1) when sel_deslocador = "001" else
        "00" & A_deslocador(7 downto 2) when sel_deslocador = "010" else
        "000" & A_deslocador(7 downto 3) when sel_deslocador = "011" else
        A_deslocador(6 downto 0) & '0' when sel_deslocador = "100" else
        A_deslocador(5 downto 0) & "00" when sel_deslocador = "101" else
        A_deslocador(4 downto 0) & "000" when sel_deslocador = "110" else
            A_deslocador;  -- caso padrão

    -- Atribuição do carry_temp
carry_temp_deslocador <= (sel_deslocador(2) or sel_deslocador(1) or sel_deslocador(0)) when (sel_deslocador = "100" or sel_deslocador = "101" or sel_deslocador = "110") else '0';

    -- Atribuição final do carry_out
    carry_out_deslocador <= carry_temp_deslocador;  -- Saída do carry

end main;
