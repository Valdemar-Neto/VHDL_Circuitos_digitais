
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
        Carry_out : out std_logic;
    );

-- Fim da entidade multiplicador
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
    
    -- Fim do componente halfadder
    end component;


    -- Definindo o componente fulladder
    component fulladder is
        port (

            -- Definindo as entradas e saídas do fulladder
            A_input, B_input, Carry_in : in std_logic;
            S_output, Carry_out : out std_logic
        );

    -- Fim do componente fulladder
    end component;

    -- Definindo os sinais que serão utilizados
    signal a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7 : std_logic;
    signal c : std_logic_vector(15 downto 0);
    signal cout : std_logic_vector(53 downto 0);
    signal sum : std_logic_vector(54 downto 0);

    begin
        -- Atribuindo os valores de A_input e B_input para as variáveis a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7
        a0 <= A_input(0); a1 <= A_input(1); a2 <= A_input(2); a3 <= A_input(3); a4 <= A_input(4); a5 <= A_input(5); a6 <= A_input(6); a7 <= A_input(7);
        b0 <= B_input(0); b1 <= B_input(1); b2 <= B_input(2); b3 <= B_input(3); b4 <= B_input(4); b5 <= B_input(5); b6 <= B_input(6); b7 <= B_input(7);

        -- Primeira coluna do multiplicador
        c(0) <= (ao and b0);

        -- Segunda coluna do multiplicador
        halfadder0: halfadder port map ((a0 and b1), (a1 and b0), sum(0), cout(0));
        c(1) <= sum(0);

        -- Terceira coluna do multiplicador
        fulladder0: fulladder port map ((a0 and b2), (a1 and b1), cout(0), sum(1), cout(1));
        halfadder1: halfadder port map (sum(1), (a2 and b0), sum(2), cout(2));
        c(2) <= sum(2);

        -- Quarta coluna do multiplicador
        fulladder1: fulladder port map ((a0 and b3), (a1 and b2), cout(1), sum(3), cout(3));
        fulladder2: fulladder port map (sum(3), (a2 and b1), cout(2), sum(4), cout(4));
        halfadder2: halfadder port map (sum(4), (a3 and b0), sum(5), cout(5));
        c(3) <= sum(5);
        
        -- Quinta coluna do multiplicador
        fulladder3: fulladder port map ((a0 and b4), (a1 and b3), cout(3), sum(6), cout(6));
        fulladder4: fulladder port map (sum(6), (a2 and b2), cout(4), sum(7), cout(7));
        fulladder5: fulladder port map (sum(7), (a3 and b1), cout(5), sum(8), cout(8));
        halfadder3: halfadder port map (sum(8), (a4 and b0), sum(9), cout(9));
        c(4) <= sum(9);

        -- Sexta coluna do multiplicador
        fulladder6: fulladder port map ((a0 and b5), (a1 and b4), cout(6), sum(10), cout(10));
        fulladder7: fulladder port map (sum(10), (a2 and b3), cout(7), sum(11), cout(11));
        fulladder8: fulladder port map (sum(11), (a3 and b2), cout(8), sum(12), cout(12));
        fulladder9: fulladder port map (sum(12), (a4 and b1), cout(9), sum(13), cout(13));
        halfadder4: halfadder port map (sum(13), (a5 and b0), sum(14), cout(14));
        c(5) <= sum(14);

        -- Sétima coluna do multiplicador
        fulladder10: fulladder port map ((a0 and b6), (a1 and b5), cout(10), sum(15), cout(15));
        fulladder11: fulladder port map (sum(15), (a2 and b4), cout(11), sum(16), cout(16));
        fulladder12: fulladder port map (sum(16), (a3 and b3), cout(12), sum(17), cout(17));
        fulladder13: fulladder port map (sum(17), (a4 and b2), cout(13), sum(18), cout(18));
        fulladder14: fulladder port map (sum(18), (a5 and b1), cout(14), sum(19), cout(19));
        halfadder5: halfadder port map (sum(19), (a6 and b0), sum(20), cout(20));
        c(6) <= sum(20);

        -- Oitava coluna do multiplicador
        fulladder15: fulladder port map ((a0 and b7), (a1 and b6), cout(15), sum(21), cout(21));
        fulladder16: fulladder port map (sum(21), (a2 and b5), cout(16), sum(22), cout(22));
        fulladder17: fulladder port map (sum(22), (a3 and b4), cout(17), sum(23), cout(23));
        fulladder18: fulladder port map (sum(23), (a4 and b3), cout(18), sum(24), cout(24));
        fulladder19: fulladder port map (sum(24), (a5 and b2), cout(19), sum(25), cout(25));
        fulladder20: fulladder port map (sum(25), (a6 and b1), cout(20), sum(26), cout(26));
        halfadder6: halfadder port map (sum(26), (a7 and b0), sum(27), cout(27));
        c(7) <= sum(27);

        -- Nona coluna do multiplicador
        fulladder21: fulladder port map ((a1 and b7), cout(21), cout(22), sum(28), cout(28));
        fulladder22: fulladder port map (sum(28), (a2 and b6), cout(23), sum(29), cout(29));
        fulladder23: fulladder port map (sum(29), (a3 and b5), cout(24), sum(30), cout(30));
        fulladder24: fulladder port map (sum(30), (a4 and b4), cout(25), sum(31), cout(31));
        fulladder25: fulladder port map (sum(31), (a5 and b3), cout(26), sum(32), cout(32));
        fulladder26: fulladder port map (sum(32), (a6 and b2), cout(27), sum(33), cout(33));
        halfadder7: halfadder port map (sum(33), (a7 and b1), sum(34), cout(34));
        c(8) <= sum(34);

        -- Décima coluna do multiplicador
        fulladder27: fulladder port map ((a2 and b7), cout(28), cout(29), sum(35), cout(35));
        fulladder28: fulladder port map (sum(35), (a3 and b6), cout(30), sum(36), cout(36));
        fulladder29: fulladder port map (sum(36), (a4 and b5), cout(31), sum(37), cout(37));
        fulladder30: fulladder port map (sum(37), (a5 and b4), cout(32), sum(38), cout(38));
        fulladder31: fulladder port map (sum(38), (a6 and b3), cout(33), sum(39), cout(39));
        fulladder32: fulladder port map (sum(39), (a7 and b2), cout(34), sum(40), cout(40));
        c(9) <= sum(40);

        -- Décima primeira coluna do multiplicador
        fulladder33: fulladder port map ((a3 and b7), cout(35), cout(36), sum(41), cout(41));
        fulladder34: fulladder port map (sum(41), (a4 and b6), cout(37), sum(42), cout(42));
        fulladder35: fulladder port map (sum(42), (a5 and b5), cout(38), sum(43), cout(43));
        fulladder36: fulladder port map (sum(43), (a6 and b4), cout(39), sum(44), cout(44));
        fulladder37: fulladder port map (sum(44), (a7 and b3), cout(40), sum(45), cout(45));
        c(10) <= sum(45);

        -- Décima segunda coluna do multiplicador
        fulladder38: fulladder port map ((a4 and b7), cout(41), cout(42), sum(46), cout(46));
        fulladder39: fulladder port map (sum(46), (a5 and b6), cout(43), sum(47), cout(47));
        fulladder40: fulladder port map (sum(47), (a6 and b5), cout(44), sum(48), cout(48));
        fulladder41: fulladder port map (sum(48), (a7 and b4), cout(45), sum(49), cout(49));
        c(11) <= sum(49);

        -- Décima terceira coluna do multiplicador
        fulladder42: fulladder port map ((a5 and b7), cout(46), cout(47), sum(50), cout(50));
        fulladder43: fulladder port map (sum(50), (a6 and b6), cout(48), sum(51), cout(51));
        fulladder44: fulladder port map (sum(51), (a7 and b5), cout(49), sum(52), cout(52));
        c(12) <= sum(52);

        -- Décima quarta coluna do multiplicador
        fulladder45: fulladder port map ((a6 and b7), cout(50), cout(51), sum(53), cout(53));
        fulladder46: fulladder port map (sum(53), (a7 and b6), cout(52), sum(54), cout(54));
        c(13) <= sum(54);

        -- Décima quinta coluna do multiplicador
        fulladder47: fulladder port map ((a7 and b7), cout(53), cout(54), sum(55), cout(55));
        c(14) <= sum(55);

        -- Décima sexta coluna do multiplicador
        c(15) <= cout(55);

        -- A saída, nesse projeto, tem que ter 8 bits, portanto, pegamos os 8 bits menos significativos de c
        S_output <= c(7 downto 0);

        -- O resto do truncamento é o carry out
        Carry_out <= (c(15) or c(14) or c(13) or c(12) or c(11) or c(10) or c(9) or c(8));

-- Fim da arquitetura ckt
end architecture ckt;



