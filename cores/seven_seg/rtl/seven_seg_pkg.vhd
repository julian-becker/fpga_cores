library ieee;
use ieee.std_logic_1164.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

package seven_seg_pkg is

    subtype dec_digit_t is natural range 0 to 9;
    subtype hex_digit_t is natural range 0 to 15;

    type dec_digit_array_t is array (natural range <>) of dec_digit_t;
    type hex_digit_array_t is array (natural range <>) of hex_digit_t;

    component seven_seg_digit_selector is
        generic (
            SEVEN_SEG_DISPLAY_SIZE : natural
        );
        port (
            clk          : in std_ulogic;
            digit_select : out natural range 0 to SEVEN_SEG_DISPLAY_SIZE-1
        );
    end component;

    component seven_seg_display is
        generic (
            SEVEN_SEG_DISPLAY_SIZE : natural;
            SEVEN_SEG_MAP : seven_seg_map_t
        );
        port (
            clk      : in  std_ulogic;
            digits   : in  hex_digit_array_t(SEVEN_SEG_DISPLAY_SIZE-1 downto 0);
            to_board : out seven_seg_interface_t
        );
    end component;

end;