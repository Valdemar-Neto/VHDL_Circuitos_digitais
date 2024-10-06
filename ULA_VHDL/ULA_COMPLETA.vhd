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
            A_input, B_input : in std_logic_vector(7 downto 0);
            S_output : out std_logic_vector(7 downto 0);
            Carry_out : out std_logic
        );
    end component;
    component ULA_somador is
        port(
            A, B : in std_logic_vector(7 downto 0);
            cout : in std_logic;
            soma : out std_logic_vector (7 downto 0);
            carry_out : out std_logic
        );
    end component;
    component extensoral is
        port(a,b : in std_logic_vector(7 downto 0); 
        k : in std_logic_vector(3 downto 0);
        cin : out std_logic; 
        ia, ib : out std_logic_vector(7 downto 0));
    end component;
    component deslocador_RL3 is
        Port (
            sel : in std_logic_vector(2 downto 0); -- seleção de controle
            A : in std_logic_vector(7 downto 0);   -- entrada de 8 bits
            Y : out std_logic_vector(7 downto 0);  -- saída de 8 bits
            carry_out : out std_logic              -- carry (sinal de transporte) de saída
        );
    end component;
    -- FALTA : DECREMENTADOR E SWAP // VERIFICAR AS PORTAS
signal saidaSomadorSoma8, saidaExtensorALA8,saidaExtensorALB8,saidaDeslocadorRL38,saidaMultiplicador8 :std_logic_vector(7 downto 0);
signal saidaSomadorCarry, saidaExtensorALCarry,saidaDeslocadorCarry,saidaMultiplicadorCarry : std_logic;

begin
    exAL : extensoral port ap(EntradaPA,EntradaPB,entradaPK,saidaExtensorALCarry,saidaExtensorALA8,saidaExtensorALB8);
    multPC : multiplicador port map(EntradaPA,entradaPB,saidaMultiplicador8, saidaMultiplicadorCarry);
    somaDR : ULA_SOMADOR port map(saidaExtensorALA8,saidaExtensorALB8, saidaExtensorALCarry, saidaSomadorSoma8, saidaSomadorCarry );

end architecture;