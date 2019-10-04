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
        RSTn    : in  std_ulogic;
        CLK     : in  std_ulogic;
        DS_A    : out std_ulogic;
        DS_B    : out std_ulogic;
        DS_C    : out std_ulogic;
        DS_D    : out std_ulogic;
        DS_E    : out std_ulogic;
        DS_F    : out std_ulogic;
        DS_G    : out std_ulogic;
        DS_DP   : out std_ulogic;
        DS_EN1  : out std_ulogic;
        DS_EN2  : out std_ulogic;
        DS_EN3  : out std_ulogic;
        DS_EN4  : out std_ulogic;
        HSYNC   : out std_ulogic;
        VSYNC   : out std_ulogic;
        VR      : out std_ulogic_vector(4 downto 0);
        VG      : out std_ulogic_vector(5 downto 0);
        VB      : out std_ulogic_vector(4 downto 0)
);
end;
architecture spec of top is
    signal to_board_seven_seg : seven_seg_interface_t;
    signal clk_vga            : std_ulogic;
    signal to_board_vga       : vga_pkg.vga_interface_t;
    signal vga_color          : vga_pkg.vga_color_interface_t;
begin

    pll_25MHz : vga_plls
        port map (
            areset  => not RSTn,
            inclk0  => CLK,
            clk_vga => clk_vga
        );

    seven_seg_outputs : block
    begin
        DS_A    <= to_board_seven_seg.DS_A;
        DS_B    <= to_board_seven_seg.DS_B;
        DS_C    <= to_board_seven_seg.DS_C;
        DS_D    <= to_board_seven_seg.DS_D;
        DS_E    <= to_board_seven_seg.DS_E;
        DS_F    <= to_board_seven_seg.DS_F;
        DS_G    <= to_board_seven_seg.DS_G;
        DS_DP   <= to_board_seven_seg.DS_DP;
        DS_EN1  <= to_board_seven_seg.DS_EN1;
        DS_EN2  <= to_board_seven_seg.DS_EN2;
        DS_EN3  <= to_board_seven_seg.DS_EN3;
        DS_EN4  <= to_board_seven_seg.DS_EN4;
    end block;

    vga_outputs : block
        signal vga_r, vga_g, vga_b : std_ulogic_vector(7 downto 0);
    begin
        HSYNC <= to_board_vga.h_sync;
        VSYNC <= to_board_vga.v_sync;

        VR <= vga_r(7 downto 3);
        VG <= vga_g(7 downto 2);
        VB <= vga_b(7 downto 3);

        vga_r <= std_ulogic_vector(to_unsigned(vga_color.R, vga_r'length));
        vga_g <= std_ulogic_vector(to_unsigned(vga_color.G, vga_g'length));
        vga_b <= std_ulogic_vector(to_unsigned(vga_color.B, vga_b'length));
    end block;

    application : entity work.application
        port map (
            clk                => CLK,
            reset              => not RSTn,
            to_board_seven_seg => to_board_seven_seg,
            clk_vga            => clk_vga,
            to_board_vga       => to_board_vga,
            vga_color          => vga_color);

end;