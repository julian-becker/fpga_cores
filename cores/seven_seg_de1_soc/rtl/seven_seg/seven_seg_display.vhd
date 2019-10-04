library ieee;
use ieee.std_logic_1164.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

use work.seven_seg_pkg.all;

entity seven_seg_display is
    generic (
        SEVEN_SEG_DISPLAY_SIZE : natural;
        SEVEN_SEG_MAP          : seven_seg_map_t
    );
    port (
        clk      : in  std_ulogic;
        digits   : in  hex_digit_array_t(SEVEN_SEG_DISPLAY_SIZE-1 downto 0);
        to_board : out seven_seg_interface_t
    );
end;

architecture impl of seven_seg_display is
begin

    assignments: for ii in 0 to SEVEN_SEG_DISPLAY_SIZE-1 generate
      to_board(ii) <= SEVEN_SEG_MAP(digits(ii));
    end generate;

end;
