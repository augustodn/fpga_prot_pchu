library ieee;
use ieee.std_logic_1164.all;

entity eq2_tb is --has to be named same as filename
--The testbenches has no ports
end eq2_tb;

architecture tb_arch of eq2_tb is
    signal test_in0, test_in1: std_logic_vector (1 downto 0);
    signal test_out: std_logic;

begin
    -- instantiate the unit under test (uut)

    uut: entity work.eq2(struct_arch)
        port map (a => test_in0, b => test_in1, aeqb => test_out);
    
    --test vector generator
    process
    begin
        --test vector 1
        test_in0 <= "00";
        test_in1 <= "00";
        wait for 200 ns;
        --test vector 2
        test_in0 <= "01";
        test_in1 <= "01";
        wait for 200 ns;
        --test vector 3
        test_in0 <= "01";
        test_in1 <= "10";
        wait for 200 ns;
        --test vector 4
        test_in0 <= "10";
        test_in1 <= "10";
        wait for 200 ns;
        --test vector 5
        test_in0 <= "11";
        test_in1 <= "11";
        wait for 200 ns;
        --test vector 6
        test_in0 <= "10";
        test_in1 <= "01";
        wait for 200 ns;
        --test vector 7
        test_in0 <= "11";
        test_in1 <= "00";
        wait for 200 ns;
        
        wait; --to quit simulation (in ghdl)
    end process;
end tb_arch;
