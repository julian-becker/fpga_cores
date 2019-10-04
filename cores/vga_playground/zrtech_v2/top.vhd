library ieee;
use ieee.std_logic_1164.all;

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
    signal clk_vga         : std_ulogic;
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

    pll_inst : vga_plls
        port map (
            areset  => not RSTn,
            inclk0  => CLK,
            clk_vga => clk_vga
        );

    vga_disp : vga_pkg.vga
        generic map (
            MODE => vga_pkg.VGA_PARAMS_640x480
        )
        port map (
            CLK       => clk_vga,
            reset     => not RSTn,
            h_sync    => HSYNC,
            v_sync    => VSYNC,
            r         => VR(4),
            g         => VG(5),
            b         => VB(4));

    VR(3 downto 0) <= "0000";
    VG(4 downto 0) <= "00000";
    VB(3 downto 0) <= "0000";

    application : entity work.application
        port map (
            CLK                => CLK,
            to_board_seven_seg => to_board_seven_seg);

end;