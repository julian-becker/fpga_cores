library ieee;
use ieee.std_logic_1164.all;

package seven_seg_hw_pkg is
    subtype seven_seg_t is std_ulogic_vector(6 downto 0);

    -- maps a hexadecimal number (index) to the 7-segment display layout
    type seven_seg_map_t is array (0 to 15) of seven_seg_t;

    constant SEVEN_SEG_DISPLAY_SIZE : natural := 6;
    subtype  SEVEN_SEG_RANGE is natural range SEVEN_SEG_DISPLAY_SIZE-1 downto 0;

    constant SEVEN_SEG_MAP : seven_seg_map_t := (
        "1000000", -- 0
        "1111001", -- 1
        "0100100", -- 2
        "0110000", -- 3
        "0011001", -- 4
        "0010010", -- 5
        "0000010", -- 6
        "1111000", -- 7
        "0000000", -- 8
        "0010000", -- 9
        "0001000", -- 0xA
        "0000011", -- 0xB
        "1000110", -- 0xC
        "0100001", -- 0xD
        "0000110", -- 0xE
        "0001110"  -- 0xF
    );

    subtype seven_seg_hex is std_ulogic_vector(6 downto 0);
    type seven_seg_interface_t is array(5 downto 0) of seven_seg_hex;

    constant SEVEN_SEG_INTERFACE_CLEAR : seven_seg_interface_t := (
        others => (others => '0')
    );

end;
