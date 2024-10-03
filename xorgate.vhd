-- xor_gate simples

entity xorgate is
    port(a,b: in bit;  z: out bit);
end xorgate;

architecture ckt of xorgate is
begin
    z <= (a and not b) or (not a and b);
end architecture;
