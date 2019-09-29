library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg_pkg.all;

library seven_seg_zrtech;
use seven_seg_zrtech.seven_seg_zrtech_pkg.all;

entity top is
    port (
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
    signal to_board      : seven_seg_interface_t;
    signal letter        : seven_seg_t := SEVEN_SEG_HEX_MAP(0);
    signal active        : std_ulogic_vector(SEVEN_SEG_RANGE) := (others => '0');
    signal decimal_point : std_ulogic := '0';
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

    letter  <= SEVEN_SEG_HEX_MAP(15);
    active  <= (others => '1');
    decimal_point <= '0';

    seven_seg_port : seven_seg_interface
        port map (
            to_board      => to_board,
            letter        => letter,
            decimal_point => decimal_point,
            active        => active
        );

end;