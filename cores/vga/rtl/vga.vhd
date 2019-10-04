library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.vga_pkg.all;

entity vga is
    generic (
        MODE : vga_params_t
    );
    port (
        clk        : in  std_ulogic;
        reset      : in  std_ulogic;
        img_select : out vga_img_select_t;
        to_board   : out vga_interface_t
    );
end;

architecture arch of vga is

    constant TOTAL_SIZE_H : natural :=
        MODE.h_sync.front_border +
        MODE.h_sync.visible_size +
        MODE.h_sync.back_border;
    constant TOTAL_SIZE_V : natural :=
        MODE.v_sync.front_border +
        MODE.v_sync.visible_size +
        MODE.v_sync.back_border;
    constant COUNTER_MAX_H : natural := TOTAL_SIZE_H + MODE.h_sync.retrace - 1;
    constant COUNTER_MAX_V : natural := TOTAL_SIZE_V + MODE.v_sync.retrace - 1;

    signal count_h : natural := 0;
    signal count_v : natural := 0;

    signal increment_v : std_ulogic := '0';

    pure function is_in_visible_range(h: natural; v: natural) return boolean is
    begin
        return h >= MODE.h_sync.front_border and h < (MODE.h_sync.front_border + MODE.h_sync.visible_size)
           and v >= MODE.v_sync.front_border and v < (MODE.v_sync.front_border + MODE.v_sync.visible_size);
    end;
begin
    
    counter_h : entity work.counter
            generic map (COUNTER_MAX => COUNTER_MAX_H)
            port map (
                clk       => clk   ,
                reset     => reset,
                increment => '1',
                overflow  => increment_v,
                value     => count_h
            );

    counter_v : entity work.counter
            generic map (COUNTER_MAX => COUNTER_MAX_V)
            port map (
                clk       => clk   ,
                reset     => reset,
                increment => increment_v,
                overflow  => open,
                value     => count_v
            );

    img_select.column <= count_h - MODE.h_sync.front_border;
    img_select.row    <= count_v - MODE.v_sync.front_border;
    img_select.enable <= '1' when is_in_visible_range(count_h, count_v) else '0';

    combinatorial : process (all)
    is
    begin
        if count_h < TOTAL_SIZE_H then
            to_board.h_sync <= not MODE.h_sync.sync_polarity;
        else
            to_board.h_sync <= MODE.h_sync.sync_polarity;
        end if;

        if count_v < TOTAL_SIZE_V then
            to_board.v_sync <= not MODE.v_sync.sync_polarity;
        else
            to_board.v_sync <= MODE.v_sync.sync_polarity;
        end if;
    end process;

end;
