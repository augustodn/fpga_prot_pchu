library ieee;
use ieee.std_logic_1164.all;
entity barrel_shifter_lr_2 is
    port(
        a: in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0);
        amt:in std_logic_vector(2 downto 0);
        lr: in std_logic
        );
end barrel_shifter_lr_2;

architecture multi_stage_arch of barrel_shifter_lr_2 is
    signal  s1, s0, o_bshft, o_inv0: std_logic_vector(7 downto 0);
    signal rev: std_logic;

begin

    -- lr = 0 left rotation
    -- lr = 1 right rotation
    rev <= not lr;

    inverter_0: entity work.reverser(rtl)
        port map (a => a, y => o_inv0, rev => rev);
    
    inverter_1: entity work.reverser(rtl)
        port map (a => o_bshft, y => y, rev => rev);

    --right rotation
    s0 <= o_inv0(0) & o_inv0(7 downto 1) when amt(0) = '1' else o_inv0;
    s1 <= s0(1 downto 0) & s0(7 downto 2) when amt(1) = '1' else s0;
    o_bshft  <= s1(3 downto 0) & s1(7 downto 4) when amt(2) = '1' else s1;

end multi_stage_arch;
