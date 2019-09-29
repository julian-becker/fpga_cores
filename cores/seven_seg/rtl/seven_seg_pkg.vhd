library ieee;
use ieee.std_logic_1164.all;

package seven_seg_pkg is

    subtype dec_digit_t is natural range 0 to 9;
    subtype hex_digit_t is natural range 0 to 15;

    type dec_digit_array_t is array (natural range <>) of dec_digit_t;
    type hex_digit_array_t is array (natural range <>) of hex_digit_t;

    subtype seven_seg_t is std_ulogic_vector(6 downto 0);

    -- maps a hexadecimal number (index) to the 7-segment display layout
    type seven_seg_hex_map_t is array (0 to 15) of seven_seg_t;

    -- maps a decimal number (index) to the 7-segment display layout
    type seven_seg_dec_map_t is array (0 to 9) of seven_seg_t;


    component seven_seg_digit_selector is
        generic (
            SEVEN_SEG_DISPLAY_SIZE : natural
        );
        port (
            clk          : in std_ulogic;
            digit_select : out natural range 0 to SEVEN_SEG_DISPLAY_SIZE-1
        );
    end component;

    component seven_seg_hex_display is
        generic (
            SEVEN_SEG_DISPLAY_SIZE : natural;
            SEVEN_SEG_HEX_MAP : seven_seg_hex_map_t
        );
        port (
            clk    : in  std_ulogic;
            digits : in  hex_digit_array_t(SEVEN_SEG_DISPLAY_SIZE-1 downto 0);
            letter : out seven_seg_t;
            active : out std_ulogic_vector(SEVEN_SEG_DISPLAY_SIZE-1 downto 0)
        );
    end component;

end;