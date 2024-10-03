
-- Autor: Rutileno Gabriel Camilo da Silva

-- Definindo o halfadder.
-- A partir de algumas portas lógicas, é possível implementar um halfadder

-- Importando as bibliotecas permitidas
library ieee;
use ieee.std_logic_1164.all;

-- Definindo a entidade halfadder
entity halfadder is
    port (

        -- Definindo as entradas e saídas do halfadder
        A_input, B_input : in std_logic;
        S_output, Carry_out : out std_logic
    );

-- Fim da entidade halfadder
end entity halfadder;

-- Definindo a arquitetura do halfadder
architecture ckt of halfadder is

begin

    -- Atribuindo as operações lógicas para os sinais de saída
    S_output <= A_input xor B_input;
    Carry_out <= A_input and B_input;

-- Fim da arquitetura ckt
end architecture ckt;
