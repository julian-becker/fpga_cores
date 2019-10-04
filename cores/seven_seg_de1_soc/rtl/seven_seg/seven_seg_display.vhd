library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

use work.seven_seg.all;

entity seven_seg_display is
    port (
        clk      : in  std_ulogic;
        digits   : in  digit_array_t(SEVEN_SEG_RANGE);
        to_board : out seven_seg_interface_t
    );
end;

architecture impl of seven_seg_display is
begin

    assignments: for ii in SEVEN_SEG_RANGE generate
      to_board(ii) <= SEVEN_SEG_MAP(digits(ii));
    end generate;

end;
