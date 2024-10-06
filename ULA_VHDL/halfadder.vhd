
-- Autor: Rutileno Gabriel Camilo da Silva

-- Definindo o halfadder_mult.
-- A partir de algumas portas lógicas, é possível implementar um halfadder_mult

-- Importando as bibliotecas permitidas
library ieee;
use ieee.std_logic_1164.all;

-- Definindo a entidade halfadder_mult
entity halfadder_mult is
    port (

        -- Definindo as entradas e saídas do halfadder_mult
        A_ha_mult_input, B_ha_mult_input : in std_logic;
        S_ha_mult_output, Carry_ha_mult_out : out std_logic
    );

-- Fim da entidade halfadder_mult
end entity halfadder_mult;

-- Definindo a arquitetura do halfadder_mult
architecture ckt of halfadder_mult is

begin

    -- Atribuindo as operações lógicas para os sinais de saída
    S_ha_mult_output <= A_ha_mult_input xor B_ha_mult_input;
    Carry_ha_mult_out <= A_ha_mult_input and B_ha_mult_input;

-- Fim da arquitetura ckt
end architecture ckt;
