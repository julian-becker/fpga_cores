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

end;