LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counterGates IS
    PORT(
        clk : IN  STD_LOGIC;
        rst : IN  STD_LOGIC;
        ena : IN  STD_LOGIC;
        q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END counterGates;

ARCHITECTURE gateLevel OF counterGates IS

    SIGNAL q0 : STD_LOGIC;
    SIGNAL q1 : STD_LOGIC;
    SIGNAL q2 : STD_LOGIC;
    SIGNAL q3 : STD_LOGIC;

    SIGNAL d0 : STD_LOGIC;
    SIGNAL d1 : STD_LOGIC;
    SIGNAL d2 : STD_LOGIC;
    SIGNAL d3 : STD_LOGIC;

    SIGNAL ena1 : STD_LOGIC;
    SIGNAL ena2 : STD_LOGIC;
    SIGNAL ena3 : STD_LOGIC;

BEGIN

    -- Entradas D de los flip-flops
    -- Cada flip-flop funciona como T cuando d = NOT q

    d0 <= NOT q0;
    d1 <= NOT q1;
    d2 <= NOT q2;
    d3 <= NOT q3;

    -- Señales de enable

    ena1 <= ena AND q0;
    ena2 <= ena AND q1 AND q0;
    ena3 <= ena AND q2 AND q1 AND q0;

    -- Salida del contador

    q <= q3 & q2 & q1 & q0;

    -- Flip-flop 0

    bit0: ENTITY work.my_dff
    PORT MAP(
        clk => clk,
        rst => rst,
        ena => ena,
        d   => d0,
        q   => q0
    );

    -- Flip-flop 1

    bit1: ENTITY work.my_dff
    PORT MAP(
        clk => clk,
        rst => rst,
        ena => ena1,
        d   => d1,
        q   => q1
    );

    -- Flip-flop 2

    bit2: ENTITY work.my_dff
    PORT MAP(
        clk => clk,
        rst => rst,
        ena => ena2,
        d   => d2,
        q   => q2
    );

    -- Flip-flop 3

    bit3: ENTITY work.my_dff
    PORT MAP(
        clk => clk,
        rst => rst,
        ena => ena3,
        d   => d3,
        q   => q3
    );

END ARCHITECTURE;
