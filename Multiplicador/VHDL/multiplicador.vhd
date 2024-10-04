-- Autor: Rutileno Gabriel Camilo da Silva

-- Descrição: Este arquivo contém a implementação de um multiplicador de 8 bits utilizando somente portas lógicas. 
-- O multiplicador é feito de forma sequencial, ou seja, a multiplicação é feita bit a bit, e o resultado é armazenado em um vetor de 16 bits. 
-- O resultado final é truncado para 8 bits, e o resto do truncamento é armazenado em um bit de carry out.

-- Importando as bibliotecas permitidas
library ieee;
use ieee.std_logic_1164.all;

-- Definindo a entidade multiplicador
entity multiplicador is 
    port (
        -- Definindo as entradas e saídas do multiplicador
        A_input, B_input : in std_logic_vector(7 downto 0);
        S_output : out std_logic_vector(7 downto 0);
        Carry_out : out std_logic
    );
end multiplicador;

-- Definindo a arquitetura do multiplicador
architecture ckt of multiplicador is

    -- Definindo os componentes halfadder e fulladder

    -- Definindo o componente halfadder
    component halfadder is
        port (
            -- Definindo as entradas e saídas do halfadder
            A_input, B_input : in std_logic;
            S_output, Carry_out : out std_logic
        );
    end component;

    -- Definindo o componente fulladder
    component fulladder is
        port (
            -- Definindo as entradas e saídas do fulladder
            A_input, B_input, Carry_in : in std_logic;
            S_output, Carry_out : out std_logic
        );
    end component;

    -- Definindo os sinais que serão utilizados
    signal a0, a1, a2, a3, a4, a5, a6, a7 : std_logic;
    signal b0, b1, b2, b3, b4, b5, b6, b7 : std_logic;
    signal c : std_logic_vector(15 downto 0);
    signal cout : std_logic_vector(55 downto 0);
    signal sum : std_logic_vector(55 downto 0);
    signal temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8 : std_logic;
    signal temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16 : std_logic;
    signal temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24 : std_logic;
    signal temp25, temp26, temp27, temp28, temp29, temp30, temp31, temp32 : std_logic;
    signal temp33, temp34, temp35, temp36, temp37, temp38, temp39, temp40 : std_logic;
    signal temp41, temp42, temp43, temp44, temp45, temp46, temp47, temp48 : std_logic;
    signal temp49, temp50, temp51, temp52, temp53, temp54, temp55, temp56 : std_logic;
    signal temp57, temp58, temp59, temp60, temp61, temp62, temp63 : std_logic;

begin
    -- Atribuindo os valores de A_input e B_input para as variáveis a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7
    a0 <= A_input(0); a1 <= A_input(1); a2 <= A_input(2); a3 <= A_input(3); a4 <= A_input(4); a5 <= A_input(5); a6 <= A_input(6); a7 <= A_input(7);
    b0 <= B_input(0); b1 <= B_input(1); b2 <= B_input(2); b3 <= B_input(3); b4 <= B_input(4); b5 <= B_input(5); b6 <= B_input(6); b7 <= B_input(7);

    -- Primeira coluna do multiplicador
    c(0) <= (a0 and b0);

    -- Segunda coluna do multiplicador
    temp1 <= a0 and b1;
    temp2 <= a1 and b0;
    halfadder0: halfadder port map (A_input => temp1, B_input => temp2, S_output => sum(0), Carry_out => cout(0));
    c(1) <= sum(0);

    -- Terceira coluna do multiplicador
    temp3 <= a0 and b2;
    temp4 <= a1 and b1;
    fulladder0: fulladder port map (A_input => temp3, B_input => temp4, Carry_in => cout(0), S_output => sum(1), Carry_out => cout(1));
    temp5 <= a2 and b0;
    halfadder1: halfadder port map (A_input => sum(1), B_input => temp5, S_output => sum(2), Carry_out => cout(2));
    c(2) <= sum(2);

    -- Quarta coluna do multiplicador
    temp6 <= a0 and b3;
    temp7 <= a1 and b2;
    fulladder1: fulladder port map (A_input => temp6, B_input => temp7, Carry_in => cout(1), S_output => sum(3), Carry_out => cout(3));
    temp8 <= a2 and b1;
    fulladder2: fulladder port map (A_input => sum(3), B_input => temp8, Carry_in => cout(2), S_output => sum(4), Carry_out => cout(4));
    temp63 <= a3 and b0;
    halfadder210: halfadder port map (A_input => sum(4), B_input => temp63, S_output => sum(5), Carry_out => cout(5));
    c(3) <= sum(5);
    
    -- Quinta coluna do multiplicador
    temp9 <= a0 and b4;
    temp10 <= a1 and b3;
    fulladder220: fulladder port map (A_input => temp9, B_input => temp10, Carry_in => cout(3), S_output => sum(6), Carry_out => cout(6));
    temp11 <= a2 and b2;
    fulladder4: fulladder port map (A_input => sum(6), B_input => temp11, Carry_in => cout(4), S_output => sum(7), Carry_out => cout(7));
    temp12 <= a3 and b1;
    fulladder5: fulladder port map (A_input => sum(7), B_input => temp12, Carry_in => cout(5), S_output => sum(8), Carry_out => cout(8));
    temp13 <= a4 and b0;
    halfadder3: halfadder port map (A_input => sum(8), B_input => temp13, S_output => sum(9), Carry_out => cout(9));
    c(4) <= sum(9);

    -- Sexta coluna do multiplicador
    temp14 <= a0 and b5;
    temp15 <= a1 and b4;
    fulladder6: fulladder port map (A_input => temp14, B_input => temp15, Carry_in => cout(6), S_output => sum(10), Carry_out => cout(10));
    temp16 <= a2 and b3;
    fulladder7: fulladder port map (A_input => sum(10), B_input => temp16, Carry_in => cout(7), S_output => sum(11), Carry_out => cout(11));
    temp17 <= a3 and b2;
    fulladder8: fulladder port map (A_input => sum(11), B_input => temp17, Carry_in => cout(8), S_output => sum(12), Carry_out => cout(12));
    temp18 <= a4 and b1;
    fulladder9: fulladder port map (A_input => sum(12), B_input => temp18, Carry_in => cout(9), S_output => sum(13), Carry_out => cout(13));
    temp19 <= a5 and b0;
    halfadder4: halfadder port map (A_input => sum(13), B_input => temp19, S_output => sum(14), Carry_out => cout(14));
    c(5) <= sum(14);

    -- Sétima coluna do multiplicador
    temp20 <= a0 and b6;
    temp21 <= a1 and b5;
    fulladder10: fulladder port map (A_input => temp20, B_input => temp21, Carry_in => cout(10), S_output => sum(15), Carry_out => cout(15));
    temp22 <= a2 and b4;
    fulladder11: fulladder port map (A_input => sum(15), B_input => temp22, Carry_in => cout(11), S_output => sum(16), Carry_out => cout(16));
    temp23 <= a3 and b3;
    fulladder12: fulladder port map (A_input => sum(16), B_input => temp23, Carry_in => cout(12), S_output => sum(17), Carry_out => cout(17));
    temp24 <= a4 and b2;
    fulladder13: fulladder port map (A_input => sum(17), B_input => temp24, Carry_in => cout(13), S_output => sum(18), Carry_out => cout(18));
    temp25 <= a5 and b1;
    fulladder14: fulladder port map (A_input => sum(18), B_input => temp25, Carry_in => cout(14), S_output => sum(19), Carry_out => cout(19));
    temp26 <= a6 and b0;
    halfadder5: halfadder port map (A_input => sum(19), B_input => temp26, S_output => sum(20), Carry_out => cout(20));
    c(6) <= sum(20);

    -- Oitava coluna do multiplicador
    temp27 <= a0 and b7;
    temp28 <= a1 and b6;
    fulladder15: fulladder port map (A_input => temp27, B_input => temp28, Carry_in => cout(15), S_output => sum(21), Carry_out => cout(21));
    temp29 <= a2 and b5;
    fulladder16: fulladder port map (A_input => sum(21), B_input => temp29, Carry_in => cout(16), S_output => sum(22), Carry_out => cout(22));
    temp30 <= a3 and b4;
    fulladder17: fulladder port map (A_input => sum(22), B_input => temp30, Carry_in => cout(17), S_output => sum(23), Carry_out => cout(23));
    temp31 <= a4 and b3;
    fulladder18: fulladder port map (A_input => sum(23), B_input => temp31, Carry_in => cout(18), S_output => sum(24), Carry_out => cout(24));
    temp32 <= a5 and b2;
    fulladder19: fulladder port map (A_input => sum(24), B_input => temp32, Carry_in => cout(19), S_output => sum(25), Carry_out => cout(25));
    temp33 <= a6 and b1;
    fulladder20: fulladder port map (A_input => sum(25), B_input => temp33, Carry_in => cout(20), S_output => sum(26), Carry_out => cout(26));
    temp34 <= a7 and b0;
    halfadder6: halfadder port map (A_input => sum(26), B_input => temp34, S_output => sum(27), Carry_out => cout(27));
    c(7) <= sum(27);

    -- Nona coluna do multiplicador
    temp35 <= a1 and b7;
    fulladder21: fulladder port map (A_input => temp35, B_input => cout(21), Carry_in => cout(22), S_output => sum(28), Carry_out => cout(28));
    temp36 <= a2 and b6;
    fulladder22: fulladder port map (A_input => sum(28), B_input => temp36, Carry_in => cout(23), S_output => sum(29), Carry_out => cout(29));
    temp37 <= a3 and b5;
    fulladder23: fulladder port map (A_input => sum(29), B_input => temp37, Carry_in => cout(24), S_output => sum(30), Carry_out => cout(30));
    temp38 <= a4 and b4;
    fulladder24: fulladder port map (A_input => sum(30), B_input => temp38, Carry_in => cout(25), S_output => sum(31), Carry_out => cout(31));
    temp39 <= a5 and b3;
    fulladder25: fulladder port map (A_input => sum(31), B_input => temp39, Carry_in => cout(26), S_output => sum(32), Carry_out => cout(32));
    temp40 <= a6 and b2;
    fulladder26: fulladder port map (A_input => sum(32), B_input => temp40, Carry_in => cout(27), S_output => sum(33), Carry_out => cout(33));
    temp41 <= a7 and b1;
    halfadder7: halfadder port map (A_input => sum(33), B_input => temp41, S_output => sum(34), Carry_out => cout(34));
    c(8) <= sum(34);

    -- Décima coluna do multiplicador
    temp42 <= a2 and b7;
    fulladder27: fulladder port map (A_input => temp42, B_input => cout(28), Carry_in => cout(29), S_output => sum(35), Carry_out => cout(35));
    temp43 <= a3 and b6;
    fulladder28: fulladder port map (A_input => sum(35), B_input => temp43, Carry_in => cout(30), S_output => sum(36), Carry_out => cout(36));
    temp44 <= a4 and b5;
    fulladder29: fulladder port map (A_input => sum(36), B_input => temp44, Carry_in => cout(31), S_output => sum(37), Carry_out => cout(37));
    temp45 <= a5 and b4;
    fulladder30: fulladder port map (A_input => sum(37), B_input => temp45, Carry_in => cout(32), S_output => sum(38), Carry_out => cout(38));
    temp46 <= a6 and b3;
    fulladder31: fulladder port map (A_input => sum(38), B_input => temp46, Carry_in => cout(33), S_output => sum(39), Carry_out => cout(39));
    temp47 <= a7 and b2;
    fulladder32: fulladder port map (A_input => sum(39), B_input => temp47, Carry_in => cout(34), S_output => sum(40), Carry_out => cout(40));
    c(9) <= sum(40);

    -- Décima primeira coluna do multiplicador
    temp48 <= a3 and b7;
    fulladder33: fulladder port map (A_input => temp48, B_input => cout(35), Carry_in => cout(36), S_output => sum(41), Carry_out => cout(41));
    temp49 <= a4 and b6;
    fulladder34: fulladder port map (A_input => sum(41), B_input => temp49, Carry_in => cout(37), S_output => sum(42), Carry_out => cout(42));
    temp50 <= a5 and b5;
    fulladder35: fulladder port map (A_input => sum(42), B_input => temp50, Carry_in => cout(38), S_output => sum(43), Carry_out => cout(43));
    temp51 <= a6 and b4;
    fulladder36: fulladder port map (A_input => sum(43), B_input => temp51, Carry_in => cout(39), S_output => sum(44), Carry_out => cout(44));
    temp52 <= a7 and b3;
    fulladder37: fulladder port map (A_input => sum(44), B_input => temp52, Carry_in => cout(40), S_output => sum(45), Carry_out => cout(45));
    c(10) <= sum(45);

    -- Décima segunda coluna do multiplicador
    temp53 <= a4 and b7;
    fulladder38: fulladder port map (A_input => temp53, B_input => cout(41), Carry_in => cout(42), S_output => sum(46), Carry_out => cout(46));
    temp54 <= a5 and b6;
    fulladder39: fulladder port map (A_input => sum(46), B_input => temp54, Carry_in => cout(43), S_output => sum(47), Carry_out => cout(47));
    temp55 <= a6 and b5;
    fulladder40: fulladder port map (A_input => sum(47), B_input => temp55, Carry_in => cout(44), S_output => sum(48), Carry_out => cout(48));
    temp56 <= a7 and b4;
    fulladder41: fulladder port map (A_input => sum(48), B_input => temp56, Carry_in => cout(45), S_output => sum(49), Carry_out => cout(49));
    c(11) <= sum(49);

    -- Décima terceira coluna do multiplicador
    temp57 <= a5 and b7;
    fulladder42: fulladder port map (A_input => temp57, B_input => cout(46), Carry_in => cout(47), S_output => sum(50), Carry_out => cout(50));
    temp58 <= a6 and b6;
    fulladder43: fulladder port map (A_input => sum(50), B_input => temp58, Carry_in => cout(48), S_output => sum(51), Carry_out => cout(51));
    temp59 <= a7 and b5;
    fulladder44: fulladder port map (A_input => sum(51), B_input => temp59, Carry_in => cout(49), S_output => sum(52), Carry_out => cout(52));
    c(12) <= sum(52);

    -- Décima quarta coluna do multiplicador
    temp60 <= a6 and b7;
    fulladder45: fulladder port map (A_input => temp60, B_input => cout(50), Carry_in => cout(51), S_output => sum(53), Carry_out => cout(53));
    temp61 <= a7 and b6;
    fulladder46: fulladder port map (A_input => sum(53), B_input => temp61, Carry_in => cout(52), S_output => sum(54), Carry_out => cout(54));
    c(13) <= sum(54);

    -- Décima quinta coluna do multiplicador
    temp62 <= a7 and b7;
    fulladder47: fulladder port map (A_input => temp62, B_input => cout(53), Carry_in => cout(54), S_output => sum(55), Carry_out => cout(55));
    c(14) <= sum(55);

    -- Décima sexta coluna do multiplicador
    c(15) <= cout(55);

    -- A saída, nesse projeto, tem que ter 8 bits, portanto, pegamos os 8 bits menos significativos de c
    S_output <= c(7 downto 0);

    -- O resto do truncamento é o carry out
    Carry_out <= (c(15) or c(14) or c(13) or c(12) or c(11) or c(10) or c(9) or c(8));

end architecture ckt;
