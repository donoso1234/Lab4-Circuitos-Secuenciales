LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_counterGates IS
END tb_counterGates;

ARCHITECTURE sim OF tb_counterGates IS

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst : STD_LOGIC := '1';
    SIGNAL ena : STD_LOGIC := '1';

    SIGNAL q : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    -- Instancia del contador

    DUT: ENTITY work.counterGates
    PORT MAP(
        clk => clk,
        rst => rst,
        ena => ena,
        q   => q
    );

    -- Generador de reloj
    -- Periodo = 10 ns

    clk_process: PROCESS
    BEGIN

        WHILE TRUE LOOP
            clk <= '0';
            WAIT FOR 5 ns;

            clk <= '1';
            WAIT FOR 5 ns;
        END LOOP;

    END PROCESS;

    -- Generador de reset

    reset_process: PROCESS
    BEGIN

        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';

        WAIT;

    END PROCESS;

END ARCHITECTURE;
