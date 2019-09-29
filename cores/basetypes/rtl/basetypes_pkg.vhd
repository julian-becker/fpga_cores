library ieee;
use ieee.std_logic_1164.all;

package basetypes_pkg is
  subtype ubyte is std_ulogic_vector(7 downto 0);
  subtype byte is std_logic_vector (7 downto 0);

  constant ZERO_BYTE : byte := (others => '0');
  constant ZERO_UBYTE : ubyte := (others => '0');

  pure function to_character (arg : ubyte) return character;

  type ubyte_array is array(natural range <>) of ubyte;
  type byte_array is array(natural range <>) of byte;

end package basetypes_pkg;