library ieee;
use ieee.std_logic_1164.all;

package plls_pkg is

    component vga_plls
        port (
            areset  : in std_logic := '0';
            inclk0  : in std_logic := '0';
            clk_vga : out std_logic 
        );
    end component;

end;