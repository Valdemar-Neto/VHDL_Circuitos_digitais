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
        A_mult_input, B_mult_input : in std_logic_vector(7 downto 0);
        S_mult_output : out std_logic_vector(7 downto 0);
        Carry_mult_out : out std_logic
    );
end multiplicador;

-- Definindo a arquitetura do multiplicador
architecture ckt of multiplicador is

    -- Definindo os componentes halfadder_mult e fulladder_mult

    -- Definindo o componente halfadder_mult
    component halfadder_mult is
        port (
            -- Definindo as entradas e saídas do halfadder_mult
            A_ha_mult_input, B_ha_mult_input : in std_logic;
            S_ha_mult_output, Carry_ha_mult_out : out std_logic
        );
    end component;

    -- Definindo o componente fulladder_mult
    component fulladder_mult is
        port (
            -- Definindo as entradas e saídas do fulladder_mult
            A_fa_mult_input, B_fa_mult_input, Carry_fa_mult_in : in std_logic;
            S_fa_mult_output, Carry_fa_mult_out : out std_logic
        );
    end component;

    -- Definindo os sinais que serão utilizados
    signal a0_mult, a1_mult, a2_mult, a3_mult, a4_mult, a5_mult, a6_mult, a7_mult : std_logic;
    signal b0_mult, b1_mult, b2_mult, b3_mult, b4_mult, b5_mult, b6_mult, b7_mult : std_logic;
    signal c_mult_ : std_logic_vector(15 downto 0);
    signal cout_mult_ : std_logic_vector(55 downto 0);
    signal sum_mult_ : std_logic_vector(55 downto 0);
    signal temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8 : std_logic;
    signal temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16 : std_logic;
    signal temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24 : std_logic;
    signal temp25, temp26, temp27, temp28, temp29, temp30, temp31, temp32 : std_logic;
    signal temp33, temp34, temp35, temp36, temp37, temp38, temp39, temp40 : std_logic;
    signal temp41, temp42, temp43, temp44, temp45, temp46, temp47, temp48 : std_logic;
    signal temp49, temp50, temp51, temp52, temp53, temp54, temp55, temp56 : std_logic;
    signal temp57, temp58, temp59, temp60, temp61, temp62, temp63 : std_logic;

begin
    -- Atribuindo os valores de A_mult_input e B_mult_input para as variáveis a0_mult, a1_mult, a2_mult, a3_mult, a4_mult, a5_mult, a6_mult, a7_mult, b0_mult, b1_mult, b2_mult, b3_mult, b4_mult, b5_mult, b6_mult, b7_mult
    a0_mult <= A_mult_input(0); a1_mult <= A_mult_input(1); a2_mult <= A_mult_input(2); a3_mult <= A_mult_input(3); a4_mult <= A_mult_input(4); a5_mult <= A_mult_input(5); a6_mult <= A_mult_input(6); a7_mult <= A_mult_input(7);
    b0_mult <= B_mult_input(0); b1_mult <= B_mult_input(1); b2_mult <= B_mult_input(2); b3_mult <= B_mult_input(3); b4_mult <= B_mult_input(4); b5_mult <= B_mult_input(5); b6_mult <= B_mult_input(6); b7_mult <= B_mult_input(7);

    -- Primeira coluna do multiplicador
    c_mult_(0) <= (a0_mult and b0_mult);

    -- Segunda coluna do multiplicador
    temp1 <= a0_mult and b1_mult;
    temp2 <= a1_mult and b0_mult;
    halfadder_mult0: halfadder_mult port map (A_ha_mult_input => temp1, B_ha_mult_input => temp2, S_ha_mult_output => sum_mult_(0), Carry_ha_mult_out => cout_mult_(0));
    c_mult_(1) <= sum_mult_(0);

    -- Terceira coluna do multiplicador
    temp3 <= a0_mult and b2_mult;
    temp4 <= a1_mult and b1_mult;
    fulladder_mult0: fulladder_mult port map (A_fa_mult_input => temp3, B_fa_mult_input => temp4, Carry_fa_mult_in => cout_mult_(0), S_fa_mult_output => sum_mult_(1), Carry_fa_mult_out => cout_mult_(1));
    temp5 <= a2_mult and b0_mult;
    halfadder_mult1: halfadder_mult port map (A_ha_mult_input => sum_mult_(1), B_ha_mult_input => temp5, S_ha_mult_output => sum_mult_(2), Carry_ha_mult_out => cout_mult_(2));
    c_mult_(2) <= sum_mult_(2);

    -- Quarta coluna do multiplicador
    temp6 <= a0_mult and b3_mult;
    temp7 <= a1_mult and b2_mult;
    fulladder_mult1: fulladder_mult port map (A_fa_mult_input => temp6, B_fa_mult_input => temp7, Carry_fa_mult_in => cout_mult_(1), S_fa_mult_output => sum_mult_(3), Carry_fa_mult_out => cout_mult_(3));
    temp8 <= a2_mult and b1_mult;
    fulladder_mult2: fulladder_mult port map (A_fa_mult_input => sum_mult_(3), B_fa_mult_input => temp8, Carry_fa_mult_in => cout_mult_(2), S_fa_mult_output => sum_mult_(4), Carry_fa_mult_out => cout_mult_(4));
    temp63 <= a3_mult and b0_mult;
    halfadder_mult210: halfadder_mult port map (A_ha_mult_input => sum_mult_(4), B_ha_mult_input => temp63, S_ha_mult_output => sum_mult_(5), Carry_ha_mult_out => cout_mult_(5));
    c_mult_(3) <= sum_mult_(5);
    
    -- Quinta coluna do multiplicador
    temp9 <= a0_mult and b4_mult;
    temp10 <= a1_mult and b3_mult;
    fulladder_mult220: fulladder_mult port map (A_fa_mult_input => temp9, B_fa_mult_input => temp10, Carry_fa_mult_in => cout_mult_(3), S_fa_mult_output => sum_mult_(6), Carry_fa_mult_out => cout_mult_(6));
    temp11 <= a2_mult and b2_mult;
    fulladder_mult4: fulladder_mult port map (A_fa_mult_input => sum_mult_(6), B_fa_mult_input => temp11, Carry_fa_mult_in => cout_mult_(4), S_fa_mult_output => sum_mult_(7), Carry_fa_mult_out => cout_mult_(7));
    temp12 <= a3_mult and b1_mult;
    fulladder_mult5: fulladder_mult port map (A_fa_mult_input => sum_mult_(7), B_fa_mult_input => temp12, Carry_fa_mult_in => cout_mult_(5), S_fa_mult_output => sum_mult_(8), Carry_fa_mult_out => cout_mult_(8));
    temp13 <= a4_mult and b0_mult;
    halfadder_mult3: halfadder_mult port map (A_ha_mult_input => sum_mult_(8), B_ha_mult_input => temp13, S_ha_mult_output => sum_mult_(9), Carry_ha_mult_out => cout_mult_(9));
    c_mult_(4) <= sum_mult_(9);

    -- Sexta coluna do multiplicador
    temp14 <= a0_mult and b5_mult;
    temp15 <= a1_mult and b4_mult;
    fulladder_mult6: fulladder_mult port map (A_fa_mult_input => temp14, B_fa_mult_input => temp15, Carry_fa_mult_in => cout_mult_(6), S_fa_mult_output => sum_mult_(10), Carry_fa_mult_out => cout_mult_(10));
    temp16 <= a2_mult and b3_mult;
    fulladder_mult7: fulladder_mult port map (A_fa_mult_input => sum_mult_(10), B_fa_mult_input => temp16, Carry_fa_mult_in => cout_mult_(7), S_fa_mult_output => sum_mult_(11), Carry_fa_mult_out => cout_mult_(11));
    temp17 <= a3_mult and b2_mult;
    fulladder_mult8: fulladder_mult port map (A_fa_mult_input => sum_mult_(11), B_fa_mult_input => temp17, Carry_fa_mult_in => cout_mult_(8), S_fa_mult_output => sum_mult_(12), Carry_fa_mult_out => cout_mult_(12));
    temp18 <= a4_mult and b1_mult;
    fulladder_mult9: fulladder_mult port map (A_fa_mult_input => sum_mult_(12), B_fa_mult_input => temp18, Carry_fa_mult_in => cout_mult_(9), S_fa_mult_output => sum_mult_(13), Carry_fa_mult_out => cout_mult_(13));
    temp19 <= a5_mult and b0_mult;
    halfadder_mult4: halfadder_mult port map (A_ha_mult_input => sum_mult_(13), B_ha_mult_input => temp19, S_ha_mult_output => sum_mult_(14), Carry_ha_mult_out => cout_mult_(14));
    c_mult_(5) <= sum_mult_(14);

    -- Sétima coluna do multiplicador
    temp20 <= a0_mult and b6_mult;
    temp21 <= a1_mult and b5_mult;
    fulladder_mult10: fulladder_mult port map (A_fa_mult_input => temp20, B_fa_mult_input => temp21, Carry_fa_mult_in => cout_mult_(10), S_fa_mult_output => sum_mult_(15), Carry_fa_mult_out => cout_mult_(15));
    temp22 <= a2_mult and b4_mult;
    fulladder_mult11: fulladder_mult port map (A_fa_mult_input => sum_mult_(15), B_fa_mult_input => temp22, Carry_fa_mult_in => cout_mult_(11), S_fa_mult_output => sum_mult_(16), Carry_fa_mult_out => cout_mult_(16));
    temp23 <= a3_mult and b3_mult;
    fulladder_mult12: fulladder_mult port map (A_fa_mult_input => sum_mult_(16), B_fa_mult_input => temp23, Carry_fa_mult_in => cout_mult_(12), S_fa_mult_output => sum_mult_(17), Carry_fa_mult_out => cout_mult_(17));
    temp24 <= a4_mult and b2_mult;
    fulladder_mult13: fulladder_mult port map (A_fa_mult_input => sum_mult_(17), B_fa_mult_input => temp24, Carry_fa_mult_in => cout_mult_(13), S_fa_mult_output => sum_mult_(18), Carry_fa_mult_out => cout_mult_(18));
    temp25 <= a5_mult and b1_mult;
    fulladder_mult14: fulladder_mult port map (A_fa_mult_input => sum_mult_(18), B_fa_mult_input => temp25, Carry_fa_mult_in => cout_mult_(14), S_fa_mult_output => sum_mult_(19), Carry_fa_mult_out => cout_mult_(19));
    temp26 <= a6_mult and b0_mult;
    halfadder_mult5: halfadder_mult port map (A_ha_mult_input => sum_mult_(19), B_ha_mult_input => temp26, S_ha_mult_output => sum_mult_(20), Carry_ha_mult_out => cout_mult_(20));
    c_mult_(6) <= sum_mult_(20);

    -- Oitava coluna do multiplicador
    temp27 <= a0_mult and b7_mult;
    temp28 <= a1_mult and b6_mult;
    fulladder_mult15: fulladder_mult port map (A_fa_mult_input => temp27, B_fa_mult_input => temp28, Carry_fa_mult_in => cout_mult_(15), S_fa_mult_output => sum_mult_(21), Carry_fa_mult_out => cout_mult_(21));
    temp29 <= a2_mult and b5_mult;
    fulladder_mult16: fulladder_mult port map (A_fa_mult_input => sum_mult_(21), B_fa_mult_input => temp29, Carry_fa_mult_in => cout_mult_(16), S_fa_mult_output => sum_mult_(22), Carry_fa_mult_out => cout_mult_(22));
    temp30 <= a3_mult and b4_mult;
    fulladder_mult17: fulladder_mult port map (A_fa_mult_input => sum_mult_(22), B_fa_mult_input => temp30, Carry_fa_mult_in => cout_mult_(17), S_fa_mult_output => sum_mult_(23), Carry_fa_mult_out => cout_mult_(23));
    temp31 <= a4_mult and b3_mult;
    fulladder_mult18: fulladder_mult port map (A_fa_mult_input => sum_mult_(23), B_fa_mult_input => temp31, Carry_fa_mult_in => cout_mult_(18), S_fa_mult_output => sum_mult_(24), Carry_fa_mult_out => cout_mult_(24));
    temp32 <= a5_mult and b2_mult;
    fulladder_mult19: fulladder_mult port map (A_fa_mult_input => sum_mult_(24), B_fa_mult_input => temp32, Carry_fa_mult_in => cout_mult_(19), S_fa_mult_output => sum_mult_(25), Carry_fa_mult_out => cout_mult_(25));
    temp33 <= a6_mult and b1_mult;
    fulladder_mult20: fulladder_mult port map (A_fa_mult_input => sum_mult_(25), B_fa_mult_input => temp33, Carry_fa_mult_in => cout_mult_(20), S_fa_mult_output => sum_mult_(26), Carry_fa_mult_out => cout_mult_(26));
    temp34 <= a7_mult and b0_mult;
    halfadder_mult6: halfadder_mult port map (A_ha_mult_input => sum_mult_(26), B_ha_mult_input => temp34, S_ha_mult_output => sum_mult_(27), Carry_ha_mult_out => cout_mult_(27));
    c_mult_(7) <= sum_mult_(27);

    -- Nona coluna do multiplicador
    temp35 <= a1_mult and b7_mult;
    fulladder_mult21: fulladder_mult port map (A_fa_mult_input => temp35, B_fa_mult_input => cout_mult_(21), Carry_fa_mult_in => cout_mult_(22), S_fa_mult_output => sum_mult_(28), Carry_fa_mult_out => cout_mult_(28));
    temp36 <= a2_mult and b6_mult;
    fulladder_mult22: fulladder_mult port map (A_fa_mult_input => sum_mult_(28), B_fa_mult_input => temp36, Carry_fa_mult_in => cout_mult_(23), S_fa_mult_output => sum_mult_(29), Carry_fa_mult_out => cout_mult_(29));
    temp37 <= a3_mult and b5_mult;
    fulladder_mult23: fulladder_mult port map (A_fa_mult_input => sum_mult_(29), B_fa_mult_input => temp37, Carry_fa_mult_in => cout_mult_(24), S_fa_mult_output => sum_mult_(30), Carry_fa_mult_out => cout_mult_(30));
    temp38 <= a4_mult and b4_mult;
    fulladder_mult24: fulladder_mult port map (A_fa_mult_input => sum_mult_(30), B_fa_mult_input => temp38, Carry_fa_mult_in => cout_mult_(25), S_fa_mult_output => sum_mult_(31), Carry_fa_mult_out => cout_mult_(31));
    temp39 <= a5_mult and b3_mult;
    fulladder_mult25: fulladder_mult port map (A_fa_mult_input => sum_mult_(31), B_fa_mult_input => temp39, Carry_fa_mult_in => cout_mult_(26), S_fa_mult_output => sum_mult_(32), Carry_fa_mult_out => cout_mult_(32));
    temp40 <= a6_mult and b2_mult;
    fulladder_mult26: fulladder_mult port map (A_fa_mult_input => sum_mult_(32), B_fa_mult_input => temp40, Carry_fa_mult_in => cout_mult_(27), S_fa_mult_output => sum_mult_(33), Carry_fa_mult_out => cout_mult_(33));
    temp41 <= a7_mult and b1_mult;
    halfadder_mult7: halfadder_mult port map (A_ha_mult_input => sum_mult_(33), B_ha_mult_input => temp41, S_ha_mult_output => sum_mult_(34), Carry_ha_mult_out => cout_mult_(34));
    c_mult_(8) <= sum_mult_(34);

    -- Décima coluna do multiplicador
    temp42 <= a2_mult and b7_mult;
    fulladder_mult27: fulladder_mult port map (A_fa_mult_input => temp42, B_fa_mult_input => cout_mult_(28), Carry_fa_mult_in => cout_mult_(29), S_fa_mult_output => sum_mult_(35), Carry_fa_mult_out => cout_mult_(35));
    temp43 <= a3_mult and b6_mult;
    fulladder_mult28: fulladder_mult port map (A_fa_mult_input => sum_mult_(35), B_fa_mult_input => temp43, Carry_fa_mult_in => cout_mult_(30), S_fa_mult_output => sum_mult_(36), Carry_fa_mult_out => cout_mult_(36));
    temp44 <= a4_mult and b5_mult;
    fulladder_mult29: fulladder_mult port map (A_fa_mult_input => sum_mult_(36), B_fa_mult_input => temp44, Carry_fa_mult_in => cout_mult_(31), S_fa_mult_output => sum_mult_(37), Carry_fa_mult_out => cout_mult_(37));
    temp45 <= a5_mult and b4_mult;
    fulladder_mult30: fulladder_mult port map (A_fa_mult_input => sum_mult_(37), B_fa_mult_input => temp45, Carry_fa_mult_in => cout_mult_(32), S_fa_mult_output => sum_mult_(38), Carry_fa_mult_out => cout_mult_(38));
    temp46 <= a6_mult and b3_mult;
    fulladder_mult31: fulladder_mult port map (A_fa_mult_input => sum_mult_(38), B_fa_mult_input => temp46, Carry_fa_mult_in => cout_mult_(33), S_fa_mult_output => sum_mult_(39), Carry_fa_mult_out => cout_mult_(39));
    temp47 <= a7_mult and b2_mult;
    fulladder_mult32: fulladder_mult port map (A_fa_mult_input => sum_mult_(39), B_fa_mult_input => temp47, Carry_fa_mult_in => cout_mult_(34), S_fa_mult_output => sum_mult_(40), Carry_fa_mult_out => cout_mult_(40));
    c_mult_(9) <= sum_mult_(40);

    -- Décima primeira coluna do multiplicador
    temp48 <= a3_mult and b7_mult;
    fulladder_mult33: fulladder_mult port map (A_fa_mult_input => temp48, B_fa_mult_input => cout_mult_(35), Carry_fa_mult_in => cout_mult_(36), S_fa_mult_output => sum_mult_(41), Carry_fa_mult_out => cout_mult_(41));
    temp49 <= a4_mult and b6_mult;
    fulladder_mult34: fulladder_mult port map (A_fa_mult_input => sum_mult_(41), B_fa_mult_input => temp49, Carry_fa_mult_in => cout_mult_(37), S_fa_mult_output => sum_mult_(42), Carry_fa_mult_out => cout_mult_(42));
    temp50 <= a5_mult and b5_mult;
    fulladder_mult35: fulladder_mult port map (A_fa_mult_input => sum_mult_(42), B_fa_mult_input => temp50, Carry_fa_mult_in => cout_mult_(38), S_fa_mult_output => sum_mult_(43), Carry_fa_mult_out => cout_mult_(43));
    temp51 <= a6_mult and b4_mult;
    fulladder_mult36: fulladder_mult port map (A_fa_mult_input => sum_mult_(43), B_fa_mult_input => temp51, Carry_fa_mult_in => cout_mult_(39), S_fa_mult_output => sum_mult_(44), Carry_fa_mult_out => cout_mult_(44));
    temp52 <= a7_mult and b3_mult;
    fulladder_mult37: fulladder_mult port map (A_fa_mult_input => sum_mult_(44), B_fa_mult_input => temp52, Carry_fa_mult_in => cout_mult_(40), S_fa_mult_output => sum_mult_(45), Carry_fa_mult_out => cout_mult_(45));
    c_mult_(10) <= sum_mult_(45);

    -- Décima segunda coluna do multiplicador
    temp53 <= a4_mult and b7_mult;
    fulladder_mult38: fulladder_mult port map (A_fa_mult_input => temp53, B_fa_mult_input => cout_mult_(41), Carry_fa_mult_in => cout_mult_(42), S_fa_mult_output => sum_mult_(46), Carry_fa_mult_out => cout_mult_(46));
    temp54 <= a5_mult and b6_mult;
    fulladder_mult39: fulladder_mult port map (A_fa_mult_input => sum_mult_(46), B_fa_mult_input => temp54, Carry_fa_mult_in => cout_mult_(43), S_fa_mult_output => sum_mult_(47), Carry_fa_mult_out => cout_mult_(47));
    temp55 <= a6_mult and b5_mult;
    fulladder_mult40: fulladder_mult port map (A_fa_mult_input => sum_mult_(47), B_fa_mult_input => temp55, Carry_fa_mult_in => cout_mult_(44), S_fa_mult_output => sum_mult_(48), Carry_fa_mult_out => cout_mult_(48));
    temp56 <= a7_mult and b4_mult;
    fulladder_mult41: fulladder_mult port map (A_fa_mult_input => sum_mult_(48), B_fa_mult_input => temp56, Carry_fa_mult_in => cout_mult_(45), S_fa_mult_output => sum_mult_(49), Carry_fa_mult_out => cout_mult_(49));
    c_mult_(11) <= sum_mult_(49);

    -- Décima terceira coluna do multiplicador
    temp57 <= a5_mult and b7_mult;
    fulladder_mult42: fulladder_mult port map (A_fa_mult_input => temp57, B_fa_mult_input => cout_mult_(46), Carry_fa_mult_in => cout_mult_(47), S_fa_mult_output => sum_mult_(50), Carry_fa_mult_out => cout_mult_(50));
    temp58 <= a6_mult and b6_mult;
    fulladder_mult43: fulladder_mult port map (A_fa_mult_input => sum_mult_(50), B_fa_mult_input => temp58, Carry_fa_mult_in => cout_mult_(48), S_fa_mult_output => sum_mult_(51), Carry_fa_mult_out => cout_mult_(51));
    temp59 <= a7_mult and b5_mult;
    fulladder_mult44: fulladder_mult port map (A_fa_mult_input => sum_mult_(51), B_fa_mult_input => temp59, Carry_fa_mult_in => cout_mult_(49), S_fa_mult_output => sum_mult_(52), Carry_fa_mult_out => cout_mult_(52));
    c_mult_(12) <= sum_mult_(52);

    -- Décima quarta coluna do multiplicador
    temp60 <= a6_mult and b7_mult;
    fulladder_mult45: fulladder_mult port map (A_fa_mult_input => temp60, B_fa_mult_input => cout_mult_(50), Carry_fa_mult_in => cout_mult_(51), S_fa_mult_output => sum_mult_(53), Carry_fa_mult_out => cout_mult_(53));
    temp61 <= a7_mult and b6_mult;
    fulladder_mult46: fulladder_mult port map (A_fa_mult_input => sum_mult_(53), B_fa_mult_input => temp61, Carry_fa_mult_in => cout_mult_(52), S_fa_mult_output => sum_mult_(54), Carry_fa_mult_out => cout_mult_(54));
    c_mult_(13) <= sum_mult_(54);

    -- Décima quinta coluna do multiplicador
    temp62 <= a7_mult and b7_mult;
    fulladder_mult47: fulladder_mult port map (A_fa_mult_input => temp62, B_fa_mult_input => cout_mult_(53), Carry_fa_mult_in => cout_mult_(54), S_fa_mult_output => sum_mult_(55), Carry_fa_mult_out => cout_mult_(55));
    c_mult_(14) <= sum_mult_(55);

    -- Décima sexta coluna do multiplicador
    c_mult_(15) <= cout_mult_(55);

    -- A saída, nesse projeto, tem que ter 8 bits, portanto, pegamos os 8 bits menos significativos de c
    S_mult_output <= c_mult_(7 downto 0);

    -- O resto do truncamento é o carry out
    Carry_mult_out <= (c_mult_(15) or c_mult_(14) or c_mult_(13) or c_mult_(12) or c_mult_(11) or c_mult_(10) or c_mult_(9) or c_mult_(8));

end architecture ckt;
