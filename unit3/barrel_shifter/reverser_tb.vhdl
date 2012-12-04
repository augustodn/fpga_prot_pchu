library ieee;
use ieee.std_logic_1164.all;

entity reverser_tb is
end reverser_tb;

architecture testbench of reverser_tb is
    signal a: std_logic_vector (7 downto 0);
    signal rev: std_logic;

begin
    
    uut: entity work.reverser(rtl)
        port map (a => a, rev => rev);
    
    process
    begin
        
        a <= "00100000";
        rev <= '0';
        wait for 10 ns;

        rev <= '1';
        wait for 10 ns;
    
    wait;
    end process;
end testbench;
