library ieee;
use ieee.std_logic_1164.all;

package vga_pkg is

    type vga_sync_params_t is record
        front_border : natural;
        visible_size : natural;
        back_border  : natural;
        retrace      : natural;
        sync_polarity: std_ulogic;
    end record;

    type vga_params_t is record
        h_sync : vga_sync_params_t;
        v_sync : vga_sync_params_t;
    end record;

    -- requires pixel clock: 25.175Mhz
    constant VGA_PARAMS_640x480 : vga_params_t := (
        h_sync => (
            front_border  => 48,
            visible_size  => 640,
            back_border   => 16,
            retrace       => 96,
            sync_polarity => '0'),
        v_sync => (
            front_border  => 33,
            visible_size  => 480,
            back_border   => 10,
            retrace       => 2,
            sync_polarity => '0'));

    -- requires pixel clock: 108Mhz
    constant VGA_PARAMS_1280x1024 : vga_params_t := (
        h_sync => (
            front_border  => 248,
            visible_size  => 1280,
            back_border   => 48,
            retrace       => 112,
            sync_polarity => '1'),
        v_sync => (
            front_border  => 38,
            visible_size  => 1024,
            back_border   => 1,
            retrace       => 3,
            sync_polarity => '1'));


    component vga is
        generic (
            MODE : vga_params_t
        );
        port (
            clk    : in  std_ulogic;
            reset  : in  std_ulogic;
            h_sync : out std_ulogic;
            v_sync : out std_ulogic;
            r,g,b  : out std_ulogic
        );
    end component;

end;