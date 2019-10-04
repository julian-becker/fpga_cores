library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg.all;

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
    signal to_board_seven_seg : seven_seg_interface_t;
begin

    ds_a    <= to_board_seven_seg.ds_a;
    ds_b    <= to_board_seven_seg.ds_b;
    ds_c    <= to_board_seven_seg.ds_c;
    ds_d    <= to_board_seven_seg.ds_d;
    ds_e    <= to_board_seven_seg.ds_e;
    ds_f    <= to_board_seven_seg.ds_f;
    ds_g    <= to_board_seven_seg.ds_g;
    ds_dp   <= to_board_seven_seg.ds_dp;
    ds_en1  <= to_board_seven_seg.ds_en1;
    ds_en2  <= to_board_seven_seg.ds_en2;
    ds_en3  <= to_board_seven_seg.ds_en3;
    ds_en4  <= to_board_seven_seg.ds_en4;

    application : entity work.application
        port map (
            clk                => clk,
            to_board_seven_seg => to_board_seven_seg);

end;