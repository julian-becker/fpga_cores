library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package body basetypes_pkg is
  pure function to_character (arg : ubyte) return character is
  begin
    return character'val(to_integer(unsigned(arg)));
  end;
end;