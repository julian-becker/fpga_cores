library ieee;
use ieee.std_logic_1164.all;

library seven_seg_types;
use seven_seg_types.seven_seg_types.all;

package seven_seg_hw_pkg is

    constant SEVEN_SEG_DISPLAY_SIZE : natural := 4;
    subtype  SEVEN_SEG_RANGE is natural range SEVEN_SEG_DISPLAY_SIZE-1 downto 0;

    constant SEVEN_SEG_MAP : seven_seg_map_t := (
        ' ' => "0000000", -- 0
        '0' => "1111110", -- 0
        '1' => "0110000", -- 1
        '2' => "1101101", -- 2
        '3' => "1111001", -- 3
        '4' => "0110011", -- 4
        '5' => "1011011", -- 5
        '6' => "1011111", -- 6
        '7' => "1110000", -- 7
        '8' => "1111111", -- 8
        '9' => "1111011", -- 9
        'A' => "1110111", -- 0xA
        'B' => "0011111", -- 0xB
        'C' => "1001110", -- 0xC
        'D' => "0111101", -- 0xD
        'E' => "1001111", -- 0xE
        'F' => "1000111"  -- 0xF
    );

    type seven_seg_interface_t is record
        ds_a    : std_ulogic;
        ds_b    : std_ulogic;
        ds_c    : std_ulogic;
        ds_d    : std_ulogic;
        ds_e    : std_ulogic;
        ds_f    : std_ulogic;
        ds_g    : std_ulogic;
        ds_dp   : std_ulogic;
        ds_en1  : std_ulogic;
        ds_en2  : std_ulogic;
        ds_en3  : std_ulogic;
        ds_en4  : std_ulogic;
    end record;

    constant SEVEN_SEG_INTERFACE_CLEAR : seven_seg_interface_t := (
        ds_a    => '0',
        ds_b    => '0',
        ds_c    => '0',
        ds_d    => '0',
        ds_e    => '0',
        ds_f    => '0',
        ds_g    => '0',
        ds_dp   => '0',
        ds_en1  => '0',
        ds_en2  => '0',
        ds_en3  => '0',
        ds_en4  => '0'
    );

    component seven_seg_interface is
        port (
            to_board      : out seven_seg_interface_t;
            letter        : in  seven_seg_t;
            active        : in  std_ulogic_vector(SEVEN_SEG_RANGE);
            decimal_point : in  std_ulogic
        );
    end component;

    component seven_seg_digit_selector is
        generic (
            SEVEN_SEG_DISPLAY_SIZE : natural
        );
        port (
            clk          : in std_ulogic;
            digit_select : out natural range 0 to SEVEN_SEG_DISPLAY_SIZE-1
        );
    end component;

end;
