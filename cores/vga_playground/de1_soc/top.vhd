library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library seven_seg;
use seven_seg.seven_seg.all;

library vga;
use vga.vga_pkg;

use work.plls_pkg.all;

entity top is
    port (
        HPS_RESET_n : in  std_ulogic;
        CLOCK_50    : in  std_ulogic;
        HEX0        : out std_ulogic_vector(6 downto 0);
        HEX1        : out std_ulogic_vector(6 downto 0);
        HEX2        : out std_ulogic_vector(6 downto 0);
        HEX3        : out std_ulogic_vector(6 downto 0);
        HEX4        : out std_ulogic_vector(6 downto 0);
        HEX5        : out std_ulogic_vector(6 downto 0);
        VGA_R       : out std_ulogic_vector(7 downto 0);
        VGA_G       : out std_ulogic_vector(7 downto 0);
        VGA_B       : out std_ulogic_vector(7 downto 0);
        VGA_CLK     : out std_ulogic;
        VGA_HS      : out std_ulogic;
        VGA_VS      : out std_ulogic;
        VGA_SYNC_N  : out std_ulogic;
        VGA_BLANK_N : out std_ulogic
    );
end;

architecture spec of top is
    signal to_board_seven_seg : seven_seg_interface_t;

    signal clk_vga            : std_ulogic;
    signal to_board_vga       : vga_pkg.vga_interface_t;
    signal vga_color          : vga_pkg.vga_color_interface_t;
begin

    HEX0 <= to_board_seven_seg(0);
    HEX1 <= to_board_seven_seg(1);
    HEX2 <= to_board_seven_seg(2);
    HEX3 <= to_board_seven_seg(3);
    HEX4 <= to_board_seven_seg(4);
    HEX5 <= to_board_seven_seg(5);

    pll_25MHz : vga_plls
        port map (
            areset  => not HPS_RESET_n,
            inclk0  => CLOCK_50,
            clk_vga => clk_vga
        );


    vga_outputs : block
    begin
        VGA_CLK     <= clk_vga;
        VGA_SYNC_N  <= '1';
        VGA_BLANK_N <= '1';
        VGA_HS      <= to_board_vga.h_sync;
        VGA_VS      <= to_board_vga.v_sync;
        VGA_R       <= std_ulogic_vector(to_unsigned(vga_color.R, vga_r'length));
        VGA_G       <= std_ulogic_vector(to_unsigned(vga_color.G, vga_g'length));
        VGA_B       <= std_ulogic_vector(to_unsigned(vga_color.B, vga_b'length));
    end block;


    application : entity work.application
        port map (
            clk                => CLOCK_50,
            reset              => not HPS_RESET_n,
            to_board_seven_seg => to_board_seven_seg,
            clk_vga            => clk_vga,
            to_board_vga       => to_board_vga,
            vga_color          => vga_color);

end;