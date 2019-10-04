library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg_pkg.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

entity top is
    port (
        HPS_RESET_n : in  std_ulogic;
        CLOCK_50    : in  std_ulogic;
        HEX0        : out std_ulogic_vector(6 downto 0);
        HEX1        : out std_ulogic_vector(6 downto 0);
        HEX2        : out std_ulogic_vector(6 downto 0);
        HEX3        : out std_ulogic_vector(6 downto 0);
        HEX4        : out std_ulogic_vector(6 downto 0);
        HEX5        : out std_ulogic_vector(6 downto 0)
    );
end;
architecture spec of top is
    signal digits   : hex_digit_array_t(1 to 6) := (0, 1, 2, 3, 4, 5);
    signal to_board : seven_seg_interface_t;
begin

    HEX0 <= to_board(0);
    HEX1 <= to_board(1);
    HEX2 <= to_board(2);
    HEX3 <= to_board(3);
    HEX4 <= to_board(4);
    HEX5 <= to_board(5);

    display : seven_seg_display
    generic map (
        SEVEN_SEG_DISPLAY_SIZE => SEVEN_SEG_DISPLAY_SIZE,
        SEVEN_SEG_MAP          => SEVEN_SEG_MAP
    )
    port map (
        clk      => CLOCK_50,
        digits   => digits,
        to_board => to_board);


end;