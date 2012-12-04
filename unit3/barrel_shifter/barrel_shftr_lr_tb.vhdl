library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shftr_lr_tb is
end barrel_shftr_lr_tb;

architecture testbench of barrel_shftr_lr_tb is
    signal a: std_logic_vector (7 downto 0);
    signal amt: std_logic_vector (2 downto 0);
    signal lr: std_logic;

begin
    --Instantiate the unit under test
    uut: entity work.barrel_shifter_lr_2(multi_stage_arch)
        port map (a => a, amt => amt, lr => lr);

    process
        variable i: unsigned (2 downto 0):= to_unsigned(0,3);
    begin

        a <= "00100000";
        
        lr <= '0';
        for count_a in 0 to 7 loop
            amt <= std_logic_vector(i);
            i:= i + 1;
            wait for 10 ns;
        end loop;

        lr <= '1';
        for count_a in 0 to 7 loop
            amt <= std_logic_vector(i);
            i:= i + 1;
            wait for 10 ns;
        end loop;

    wait;
    end process;
end testbench;
