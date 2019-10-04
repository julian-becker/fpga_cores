library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg.all;

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
    signal to_board_seven_seg : seven_seg_interface_t;
begin

    HEX0 <= to_board_seven_seg(0);
    HEX1 <= to_board_seven_seg(1);
    HEX2 <= to_board_seven_seg(2);
    HEX3 <= to_board_seven_seg(3);
    HEX4 <= to_board_seven_seg(4);
    HEX5 <= to_board_seven_seg(5);

    application : entity work.application
        port map (
            clk                => CLOCK_50,
            to_board_seven_seg => to_board_seven_seg);


end;