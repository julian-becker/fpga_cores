library ieee;
use ieee.std_logic_1164.all;

package seven_seg_types is

    type digit_t is (' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
    type digit_array_t is array (natural range <>) of digit_t;

    subtype seven_seg_t is std_ulogic_vector(6 downto 0);

    type seven_seg_map_t is array (digit_t) of seven_seg_t;

end;