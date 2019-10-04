library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.vga_pkg.all;

entity vga is
    generic (
        MODE : vga_params_t
    );
    port (
        clk    : in std_ulogic;
        reset  : in std_ulogic;
        h_sync : out std_ulogic;
        v_sync : out std_ulogic;
        r,g,b  : out std_ulogic);
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
    signal x_screen : integer := 0;

    signal count_v : natural := 0;
    signal y_screen : integer := 0;

    signal increment_v : std_ulogic := '0';
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

    x_screen <= count_h - MODE.h_sync.front_border;
    y_screen <= count_v - MODE.v_sync.front_border;


    combinatorial : process (all)
    is
    begin
        if count_h < TOTAL_SIZE_H then
            h_sync <= not MODE.h_sync.sync_polarity;
        else
            h_sync <= MODE.h_sync.sync_polarity;
        end if;

        if count_v < TOTAL_SIZE_V then
            v_sync <= not MODE.v_sync.sync_polarity;
        else
            v_sync <= MODE.v_sync.sync_polarity;
        end if;
    end process;

    colors : process (all)
    begin
        if (x_screen - 1280/2) * (x_screen - 1280/2)
         + (y_screen - 1024/2) * (y_screen - 1024/2) < 600*600 then
            r <= '1';
            g <= '1';
            b <= '1';
        else
            r <= '0';
            g <= '0';
            b <= '0';
        end if;
    end process;
end;
