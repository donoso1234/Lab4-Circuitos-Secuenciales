LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY counterMax IS
    PORT(
        clk : IN  STD_LOGIC;
        rst : IN  STD_LOGIC;
        ena : IN  STD_LOGIC;
        max : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END counterMax;

ARCHITECTURE rtl OF counterMax IS

    SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    PROCESS(clk, rst)
    BEGIN

        IF rst = '1' THEN
            count <= "0000";

        ELSIF rising_edge(clk) THEN

            IF ena = '1' THEN

                IF count = max THEN
                    count <= "0000";
                ELSE
                    count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
                END IF;

            END IF;

        END IF;

    END PROCESS;

    q <= count;

END ARCHITECTURE;
