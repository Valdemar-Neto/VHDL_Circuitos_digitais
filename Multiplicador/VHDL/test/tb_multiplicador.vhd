library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplicador is
end tb_multiplicador;

architecture behavior of tb_multiplicador is

    -- Component declaration for the unit under test (UUT)
    component multiplicador
        port(
            A_input : in std_logic_vector(7 downto 0);
            B_input : in std_logic_vector(7 downto 0);
            S_output : out std_logic_vector(7 downto 0);
            Carry_out : out std_logic
        );
    end component;

    -- Signals to connect to UUT
    signal A_input : std_logic_vector(7 downto 0) := (others => '0');
    signal B_input : std_logic_vector(7 downto 0) := (others => '0');
    signal S_output : std_logic_vector(7 downto 0);
    signal Carry_out : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: multiplicador
        port map (
            A_input => A_input,
            B_input => B_input,
            S_output => S_output,
            Carry_out => Carry_out
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: 1 * 1
        A_input <= "00000001";
        B_input <= "00000001";
        wait for 10 ns;

        -- Test case 2: 2 * 2
        A_input <= "00000010";
        B_input <= "00000010";
        wait for 10 ns;

        -- Test case 3: 3 * 3
        A_input <= "00000011";
        B_input <= "00000011";
        wait for 10 ns;

        -- Test case 4: 15 * 15
        A_input <= "00001111";
        B_input <= "00001111";
        wait for 10 ns;

        -- Test case 5: 255 * 255
        A_input <= "11111111";
        B_input <= "11111111";
        wait for 10 ns;

        -- Test case 6: 128 * 2
        A_input <= "10000000";
        B_input <= "00000010";
        wait for 10 ns;

        -- Test case 7: 64 * 4
        A_input <= "01000000";
        B_input <= "00000100";
        wait for 10 ns;

        -- Test case 8: 0 * 255
        A_input <= "00000000";
        B_input <= "11111111";
        wait for 10 ns;

        -- Test case 9: 255 * 0
        A_input <= "11111111";
        B_input <= "00000000";
        wait for 10 ns;

        -- Test case 10: 123 * 45
        A_input <= "01111011";
        B_input <= "00101101";
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end behavior;
