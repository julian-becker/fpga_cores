library ieee;
use ieee.std_logic_1164.all;

use work.seven_seg_pkg.all;

entity seven_seg_hex_display is
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
end;

architecture impl of seven_seg_hex_display is
    signal digit_select_int : natural range 0 to SEVEN_SEG_DISPLAY_SIZE-1 := 0;
    signal digit : hex_digit_t;
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
end;
