library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library seven_seg;
use seven_seg.seven_seg.all;

library vga;
use vga.vga_pkg;

use work.plls_pkg.all;

entity vga_img_src is
    port (
        img_select : in  vga_pkg.vga_img_select_t;
        color      : out vga_pkg.vga_color_interface_t
    );
end;

architecture impl of vga_img_src is
begin

    colors : process (all)
    begin
        if img_select.enable = '1' and (img_select.column - 640/2) * (img_select.column - 640/2)
            + (img_select.row - 480/2) * (img_select.row - 480/2) < 100*100 then
            color.R <= 128;
            color.G <= 64;
            color.B <= 255;
        elsif img_select.enable = '1' and (img_select.column - 640/2) * (img_select.column - 640/2)
            + (img_select.row - 480/2) * (img_select.row - 480/2) < 240*240 then
            color.R <= 255;
            color.G <= 255;
            color.B <= 255;
        else
            color.R <= 0;
            color.G <= 0;
            color.B <= 0;
        end if;
    end process;

end;