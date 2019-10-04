library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

library seven_seg;
use seven_seg.seven_seg.all;

entity application is
    port (
        clk                : in  std_ulogic;
        to_board_seven_seg : out seven_seg_interface_t
    );
end;

architecture impl of application is
    signal digits   : digit_array_t(SEVEN_SEG_RANGE) := (others => ' ');
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

end;