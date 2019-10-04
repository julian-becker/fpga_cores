library ieee;
use ieee.std_logic_1164.all;

package seven_seg_hw_pkg is
    subtype seven_seg_t is std_ulogic_vector(6 downto 0);

    -- maps a hexadecimal number (index) to the 7-segment display layout
    type seven_seg_hex_map_t is array (0 to 15) of seven_seg_t;

    -- maps a decimal number (index) to the 7-segment display layout
    type seven_seg_dec_map_t is array (0 to 9) of seven_seg_t;
    
    constant SEVEN_SEG_DISPLAY_SIZE : natural := 4;
    subtype  SEVEN_SEG_RANGE is natural range SEVEN_SEG_DISPLAY_SIZE-1 downto 0;

    constant SEVEN_SEG_DEC_MAP : seven_seg_dec_map_t := (
        "1111110", -- 0
        "0110000", -- 1
        "1101101", -- 2
        "1111001", -- 3
        "0110011", -- 4
        "1011011", -- 5
        "1011111", -- 6
        "1110000", -- 7
        "1111111", -- 8
        "1111011"  -- 9
    );

    constant SEVEN_SEG_HEX_MAP : seven_seg_hex_map_t := (
        SEVEN_SEG_DEC_MAP(0),
        SEVEN_SEG_DEC_MAP(1),
        SEVEN_SEG_DEC_MAP(2),
        SEVEN_SEG_DEC_MAP(3),
        SEVEN_SEG_DEC_MAP(4),
        SEVEN_SEG_DEC_MAP(5),
        SEVEN_SEG_DEC_MAP(6),
        SEVEN_SEG_DEC_MAP(7),
        SEVEN_SEG_DEC_MAP(8),
        SEVEN_SEG_DEC_MAP(9),
        "1110111", -- 0xA
        "0011111", -- 0xB
        "1001110", -- 0xC
        "0111101", -- 0xD
        "1001111", -- 0xE
        "1000111"  -- 0xF
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

end;
