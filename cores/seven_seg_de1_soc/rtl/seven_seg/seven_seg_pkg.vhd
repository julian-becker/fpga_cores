library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg;

package seven_seg is

    constant SEVEN_SEG_DISPLAY_SIZE : natural := seven_seg_hw_pkg.SEVEN_SEG_DISPLAY_SIZE;
    alias SEVEN_SEG_RANGE is seven_seg_hw_pkg.SEVEN_SEG_RANGE;

    constant SEVEN_SEG_MAP : seven_seg_map_t := seven_seg_hw_pkg.SEVEN_SEG_MAP;
    alias seven_seg_interface_t is seven_seg_hw_pkg.seven_seg_interface_t;


    component seven_seg_display is
        port (
            clk      : in  std_ulogic;
            digits   : in  digit_array_t(SEVEN_SEG_RANGE);
            to_board : out seven_seg_interface_t
        );
    end component;

end;