library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg_pkg.all;

library seven_seg_hw;
use seven_seg_hw.seven_seg_hw_pkg.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb is
    generic (runner_cfg : string);
end;

architecture spec of tb is

    constant SEVEN_SEG_MAP : seven_seg_map_t := (
        "1111110",
        "0110000",
        "1101101",
        "1111001",
        "0110011",
        "1011011",
        "1011111",
        "1110000",
        "1111111",
        "1111011",
        "1101111",
        "0111101",
        "0011110",
        "1111001",
        "0011111",
        "0001111"
    );
begin
    main : process
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("test") then
                check_equal(SEVEN_SEG_MAP(0), seven_seg_t'("1111110"));
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end;