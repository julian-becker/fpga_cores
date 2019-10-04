library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

library seven_seg;
use seven_seg.seven_seg.all;

library vga;
use vga.vga_pkg;

entity application is
    port (
        clk                : in  std_ulogic;
        reset              : in  std_ulogic;
        to_board_seven_seg : out seven_seg_interface_t;
        clk_vga            : in  std_ulogic;
        to_board_vga       : out vga_pkg.vga_interface_t;
        vga_color          : out vga_pkg.vga_color_interface_t
    );
end;

architecture impl of application is
    signal digits   : digit_array_t(SEVEN_SEG_RANGE) := (others => ' ');
    signal vga_img_select     : vga_pkg.vga_img_select_t;

begin

    digits <= (
        0 => '7',
        1 => '3',
        2 => '3',
        3 => '1',
        others => ' ');

    display : seven_seg_display
    port map (
        clk      => clk,
        digits   => digits,
        to_board => to_board_seven_seg);


    vga_disp : vga_pkg.vga
        generic map (
            MODE => vga_pkg.VGA_PARAMS_640x480
        )
        port map (
            CLK       => clk_vga,
            reset     => reset,
            img_select => vga_img_select,
            to_board   => to_board_vga);

    vga_image : entity work.vga_img_src
        port map (
            img_select => vga_img_select,
            color      => vga_color
        );


end;