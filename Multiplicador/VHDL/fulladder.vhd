
-- Autor: Rutileno Gabriel Camilo da Silva

-- Definindo o fulladder
-- A partir de algumas portas lógicas, é possível implementar um fulladder


-- Importando as bibliotecas permitidas
library ieee;
use ieee.std_logic_1164.all;

-- Definindo a entidade fulladder
entity fulladder is
    port (

        -- Definindo as entradas e saídas do fulladder
        A_input, B_input, Carry_in : in std_logic;
        S_output, Carry_out : out std_logic
    );

-- Fim da entidade fulladder
end entity fulladder;

-- Definindo a arquitetura do fulladder
architecture ckt of fulladder is

    begin
        -- Atribuindo as operações lógicas para os sinais de saída
        S_output <= A_input xor B_input xor Carry_in;
        Carry_out <= (A_input and B_input) or (Carry_in and (A_input xor B_input));

-- Fim da arquitetura ckt
end architecture ckt;
