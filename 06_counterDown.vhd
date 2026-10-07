LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY counterDown IS
    PORT(
        clk : IN  STD_LOGIC;
        rst : IN  STD_LOGIC;
        ena : IN  STD_LOGIC;
        q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END counterDown;

ARCHITECTURE rtl OF counterDown IS

    SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    PROCESS(clk, rst)
    BEGIN

        IF rst = '1' THEN
            count <= "1111";

        ELSIF rising_edge(clk) THEN

            IF ena = '1' THEN
                count <= STD_LOGIC_VECTOR(unsigned(count) - 1);
            END IF;

        END IF;

    END PROCESS;

    q <= count;

END ARCHITECTURE;
