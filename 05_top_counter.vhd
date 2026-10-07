LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top_counter IS
    PORT(
        KEY  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END top_counter;

ARCHITECTURE structural OF top_counter IS

    SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL clk_counter : STD_LOGIC;

BEGIN

    -- KEY0 será el reloj
    -- Los pulsadores de la DE0 son activos en bajo

    clk_counter <= NOT KEY(0);

    -- Contador

    contador: ENTITY work.counterGates
    PORT MAP(
        clk => clk_counter,
        rst => NOT KEY(1),
        ena => '1',
        q   => count
    );

    -- Display

    display: ENTITY work.hex7seg
    PORT MAP(
        hex => count,
        seg => HEX0
    );

END ARCHITECTURE;
