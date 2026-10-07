LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top_counter_down IS
    PORT(
        KEY  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END top_counter_down;

ARCHITECTURE structural OF top_counter_down IS

    SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL clk_counter : STD_LOGIC;

BEGIN

    clk_counter <= NOT KEY(0);

    contador: ENTITY work.counterDown
    PORT MAP(
        clk => clk_counter,
        rst => NOT KEY(1),
        ena => '1',
        q   => count
    );

    display: ENTITY work.hex7seg
    PORT MAP(
        hex => count,
        seg => HEX0
    );

END ARCHITECTURE;
