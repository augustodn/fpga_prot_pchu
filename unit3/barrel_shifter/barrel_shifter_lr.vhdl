library ieee;
use ieee.std_logic_1164.all;
entity barrel_shifter_lr is
    port(
        a: in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0);
        amt:in std_logic_vector(2 downto 0);
        lr: in std_logic
        );
end barrel_shifter_lr;

architecture multi_stage_arch of barrel_shifter_lr is
    signal sl0, sl1, sr0, sr1, lo, ro: std_logic_vector(7 downto 0);
begin
    --right rotation
    sr0 <= a(0) & a(7 downto 1) when amt(0) = '1' else a;
    sr1 <= sr0(1 downto 0) & sr0(7 downto 2) when amt(1) = '1' else sr0;
    ro  <= sr1(3 downto 0) & sr1(7 downto 4) when amt(2) = '1' else sr1;
    --left rotation
    sl0 <= a(6 downto 0) & a(7) when amt(0) = '1' else a;
    sl1 <= sl0(5 downto 0) & sl0(7 downto 6) when amt(1) = '1' else sl0;
    lo  <= sl1(3 downto 0) & sl1(7 downto 4) when amt(2) = '1' else sl1;
    --right or left
    y <= ro when lr = '1' else lo;

end multi_stage_arch;
    
