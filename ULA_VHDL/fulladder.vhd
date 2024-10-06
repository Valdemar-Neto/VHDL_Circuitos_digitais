
-- Autor: Rutileno Gabriel Camilo da Silva

-- Definindo o fulladder_mult
-- A partir de algumas portas lógicas, é possível implementar um fulladder_mult


-- Importando as bibliotecas permitidas
library ieee;
use ieee.std_logic_1164.all;

-- Definindo a entidade fulladder_mult
entity fulladder_mult is
    port (

        -- Definindo as entradas e saídas do fulladder_mult
        A_fa_mult_input, B_fa_mult_input, Carry_fa_mult_in : in std_logic;
        S_fa_mult_output, Carry_fa_mult_out : out std_logic
    );

-- Fim da entidade fulladder_mult
end entity fulladder_mult;

-- Definindo a arquitetura do fulladder_mult
architecture ckt of fulladder_mult is

    begin
        -- Atribuindo as operações lógicas para os sinais de saída
        S_fa_mult_output <= A_fa_mult_input xor B_fa_mult_input xor Carry_fa_mult_in;
        Carry_fa_mult_out <= (A_fa_mult_input and B_fa_mult_input) or (Carry_fa_mult_in and (A_fa_mult_input xor B_fa_mult_input));

-- Fim da arquitetura ckt
end architecture ckt;
