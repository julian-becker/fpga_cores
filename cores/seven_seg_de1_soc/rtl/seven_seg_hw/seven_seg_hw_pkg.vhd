library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

package seven_seg_hw_pkg is

    constant SEVEN_SEG_DISPLAY_SIZE : natural := 6;
    subtype  SEVEN_SEG_RANGE is natural range SEVEN_SEG_DISPLAY_SIZE-1 downto 0;

    constant SEVEN_SEG_MAP : seven_seg_map_t := (
        ' ' => "1111111", -- 0
        '0' => "1000000", -- 0
        '1' => "1111001", -- 1
        '2' => "0100100", -- 2
        '3' => "0110000", -- 3
        '4' => "0011001", -- 4
        '5' => "0010010", -- 5
        '6' => "0000010", -- 6
        '7' => "1111000", -- 7
        '8' => "0000000", -- 8
        '9' => "0010000", -- 9
        'A' => "0001000", -- 0xA
        'B' => "0000011", -- 0xB
        'C' => "1000110", -- 0xC
        'D' => "0100001", -- 0xD
        'E' => "0000110", -- 0xE
        'F' => "0001110"  -- 0xF
    );

    subtype seven_seg_hex is std_ulogic_vector(6 downto 0);
    type seven_seg_interface_t is array(SEVEN_SEG_RANGE) of seven_seg_hex;

    constant SEVEN_SEG_INTERFACE_CLEAR : seven_seg_interface_t := (
        others => (others => '1')
    );

end;
