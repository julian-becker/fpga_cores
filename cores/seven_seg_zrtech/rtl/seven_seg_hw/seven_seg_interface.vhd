library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

entity seven_seg_interface is
    port (
        to_board         : out seven_seg_interface_t;
        letter           : in  seven_seg_t;
        active           : in  std_ulogic_vector(SEVEN_SEG_RANGE);
        decimal_point    : in  std_ulogic
    );
end entity;

architecture rtl of seven_seg_interface is
begin
    to_board.ds_a    <= letter(6);
    to_board.ds_b    <= letter(5);
    to_board.ds_c    <= letter(4);
    to_board.ds_d    <= letter(3);
    to_board.ds_e    <= letter(2);
    to_board.ds_f    <= letter(1);
    to_board.ds_g    <= letter(0);
    
    to_board.ds_dp   <= decimal_point;
    to_board.ds_en1  <= not active(0);
    to_board.ds_en2  <= not active(1);
    to_board.ds_en3  <= not active(2);
    to_board.ds_en4  <= not active(3);
end;