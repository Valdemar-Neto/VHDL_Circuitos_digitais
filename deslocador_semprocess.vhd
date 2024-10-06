library ieee;
use ieee.std_logic_1164.all;

entity deslocador_semprocess is
    Port (
        sel : in std_logic_vector(2 downto 0); -- seleção de controle
        A : in std_logic_vector(7 downto 0);   -- entrada de 8 bits
        Y : out std_logic_vector(7 downto 0);  -- saída de 8 bits
        carry_out : out std_logic              -- carry (sinal de transporte) de saída
    );
end deslocador_semprocess;

architecture main of deslocador_semprocess is
    signal carry_temp : std_logic;  -- Sinal interno para armazenar o carry
begin
    -- Atribuições contínuas para Y
    Y <= 
        A when sel = "000" else 
        "0" & A(7 downto 1) when sel = "001" else
        "00" & A(7 downto 2) when sel = "010" else
        "000" & A(7 downto 3) when sel = "011" else
        A(6 downto 0) & '0' when sel = "100" else
        A(5 downto 0) & "00" when sel = "101" else
        A(4 downto 0) & "000" when sel = "110" else
        A;  -- caso padrão

    -- Atribuição do carry_temp
    carry_temp <= (sel(2) or sel(1) or sel(0)) when (sel = "100" or sel = "101" or sel = "110") else '0';

    -- Atribuição final do carry_out
    carry_out <= carry_temp;  -- Saída do carry

end main;
