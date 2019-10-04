library ieee;
use ieee.std_logic_1164.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

use work.seven_seg_pkg.all;

entity seven_seg_display is
    generic (
        SEVEN_SEG_DISPLAY_SIZE : natural;
        SEVEN_SEG_HEX_MAP : seven_seg_hex_map_t
    );
    port (
        clk      : in  std_ulogic;
        digits   : in  hex_digit_array_t(SEVEN_SEG_DISPLAY_SIZE-1 downto 0);
        to_board : out seven_seg_interface_t
    );
end;

architecture impl of seven_seg_display is
    signal digit_select_int : natural range 0 to SEVEN_SEG_DISPLAY_SIZE-1 := 0;
    signal digit : hex_digit_t;


    signal letter        : seven_seg_t := SEVEN_SEG_HEX_MAP(0);
    signal active        : std_ulogic_vector(SEVEN_SEG_RANGE) := (others => '0');
begin

    digit  <= digits(digit_select_int);
    letter <= SEVEN_SEG_HEX_MAP(digit);

    active_select_process : process (all)
    begin
        active <= (others => '0');
        active(digit_select_int) <= '1';
    end process;

    select_digit_to_encode : entity work.seven_seg_digit_selector
        generic map (
            SEVEN_SEG_DISPLAY_SIZE => SEVEN_SEG_DISPLAY_SIZE
        )
        port map (
            clk          => clk, 
            digit_select => digit_select_int
        );

    seven_seg_port : seven_seg_interface
        port map (
            to_board      => to_board,
            letter        => letter,
            decimal_point => '0',
            active        => active
        );
    
end;
