library ieee;
use ieee.std_logic_1164.all;
entity reverser is
    port(
        a: in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0);
        rev: in std_logic
        );
end reverser;

architecture rtl of reverser is
    signal b: std_logic_vector (7 downto 0);

begin
    
    b(7) <= a(0);
    b(6) <= a(1);
    b(5) <= a(2);
    b(4) <= a(3);
    b(3) <= a(4);
    b(2) <= a(5);
    b(1) <= a(6);
    b(0) <= a(7);

    y <= b when rev = '1' else a;

end rtl;
