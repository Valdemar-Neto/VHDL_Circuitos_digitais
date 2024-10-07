library ieee;
use ieee.std_logic_1164.all;

entity ULA_COMPLETA is
    port(EntradaPA,EntradaPB : in std_logic_vector(7 downto 0);
    ENtradaPk : in std_logic_vector(3 downto 0);
    SaidapC,SaidaPz : out std_logic;
    SaidaPo : out std_logic_vector(7 downto 0)
    );
end entity ULA_COMPLETA;

architecture rtl of ULA_COMPLETA is
    component multiplicador is 
        port (
            -- Definindo as entradas e saídas do multiplicador
            A_mult_input, B_mult_input : in std_logic_vector(7 downto 0);
            S_mult_output : out std_logic_vector(7 downto 0);
            Carry_mult_out : out std_logic
        );
    end component;
    component ULA_somador is
        port(
            A_somador, B_somador: in std_logic_vector(7 downto 0);
            Cin_somador : in std_logic;
            S_somador : out std_logic_vector (7 downto 0);
            Cout_somador : out std_logic
        );
    end component;
    
    component extensoral is
        port(a_extensoral,b_extensoral : in std_logic_vector(7 downto 0); 
        k_extensoral : in std_logic_vector(3 downto 0);
        cout_extensoral : out std_logic; 
        ia_extensoral, ib_extensoral : out std_logic_vector(7 downto 0));
        end component;
        component deslocador_semprocess is
            Port (
                sel_deslocador : in std_logic_vector(2 downto 0); -- seleção de controle
                A_deslocador : in std_logic_vector(7 downto 0);   -- entrada de 8 bits
                Y_deslocador : out std_logic_vector(7 downto 0);  -- saída de 8 bits
                carry_out_deslocador : out std_logic              -- carry (sinal de transporte) de saída
            );
        end component;
        component ULA_decrementador is
            port(
                A_decrementador : in  std_logic_vector(7 downto 0); 
                S_decrementador : out std_logic_vector(7 downto 0); 
                Cout_decrementador: out std_logic                  
            );
        end component;
signal saidaSomadorSoma8, saidaExtensorALA8,saidaExtensorALB8,saidaDeslocadorRL38,saidaMultiplicador8, saidaDecrementador8 :std_logic_vector(7 downto 0);
signal saidaSomadorCarry, saidaExtensorALCarry,saidaDeslocadorCarry,saidaMultiplicadorCarry,saidaDecrementadorCarry : std_logic;
signal SaidaFinal : std_logic_vector(7 downto 0);
begin
    exAL : extensoral port map(EntradaPA,EntradaPB,entradaPK,saidaExtensorALCarry,saidaExtensorALA8,saidaExtensorALB8);
    multPC : multiplicador port map(EntradaPA,entradaPB,saidaMultiplicador8, saidaMultiplicadorCarry);
    somaDR : ULA_SOMADOR port map(saidaExtensorALA8,saidaExtensorALB8, saidaExtensorALCarry, saidaSomadorSoma8, saidaSomadorCarry );
    deslocdr : deslocador_semprocess port map(EntradaPB(2 downto 0),EntradaPA, saidaDeslocadorRL38, saidaDeslocadorCarry);
    decremt : ULA_decrementador port map(EntradaPA, SaidaDecrementador8,saidaDecrementadorCarry);

    with entradaPK select
    saidaFinal <= saidaMultiplicador8 when "0011",
    saidaDeslocadorRL38 when "1000", 
    saidaDeslocadorRL38 when "1001",
    saidaDecrementador8 when "0101",
    saidaSomadorSoma8 when others;

    with entradaPK select 
        saidapC <= saidaMultiplicadorCarry when "0011",
        saidaDeslocadorCarry when "1001",
        saidaDeslocadorCarry when "1000",
        saidaDecrementadorCarry when "0101",
        saidaSomadorCarry when others;
    with saidaFinal select
        saidaPz <= '1' when "00000000",
        '0' when others;
    saidaPO <= saidaFinal;
end architecture;