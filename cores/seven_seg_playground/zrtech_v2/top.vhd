library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg_pkg.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

entity top is
    port (
        rstn    : in  std_ulogic;
        clk     : in  std_ulogic;
        ds_a    : out std_ulogic;
        ds_b    : out std_ulogic;
        ds_c    : out std_ulogic;
        ds_d    : out std_ulogic;
        ds_e    : out std_ulogic;
        ds_f    : out std_ulogic;
        ds_g    : out std_ulogic;
        ds_dp   : out std_ulogic;
        ds_en1  : out std_ulogic;
        ds_en2  : out std_ulogic;
        ds_en3  : out std_ulogic;
        ds_en4  : out std_ulogic);
end;
architecture spec of top is
    signal digits   : hex_digit_array_t(1 to 4) := (12, 13, 14, 15);
    signal to_board : seven_seg_interface_t;
begin

    ds_a    <= to_board.ds_a;
    ds_b    <= to_board.ds_b;
    ds_c    <= to_board.ds_c;
    ds_d    <= to_board.ds_d;
    ds_e    <= to_board.ds_e;
    ds_f    <= to_board.ds_f;
    ds_g    <= to_board.ds_g;
    ds_dp   <= to_board.ds_dp;
    ds_en1  <= to_board.ds_en1;
    ds_en2  <= to_board.ds_en2;
    ds_en3  <= to_board.ds_en3;
    ds_en4  <= to_board.ds_en4;

    display : seven_seg_display
    generic map (
        SEVEN_SEG_DISPLAY_SIZE => SEVEN_SEG_DISPLAY_SIZE,
        SEVEN_SEG_MAP          => SEVEN_SEG_MAP
    )
    port map (
        clk      => clk,
        digits   => digits,
        to_board => to_board);

end;