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
begin
    main : process
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("test") then
                check_equal(SEVEN_SEG_MAP(0),  seven_seg_t'("1000000"));
                check_equal(SEVEN_SEG_MAP(1),  seven_seg_t'("1111001"));
                check_equal(SEVEN_SEG_MAP(2),  seven_seg_t'("0100100"));
                check_equal(SEVEN_SEG_MAP(3),  seven_seg_t'("0110000"));
                check_equal(SEVEN_SEG_MAP(4),  seven_seg_t'("0011001"));
                check_equal(SEVEN_SEG_MAP(5),  seven_seg_t'("0010010"));
                check_equal(SEVEN_SEG_MAP(6),  seven_seg_t'("0000010"));
                check_equal(SEVEN_SEG_MAP(7),  seven_seg_t'("1111000"));
                check_equal(SEVEN_SEG_MAP(8),  seven_seg_t'("0000000"));
                check_equal(SEVEN_SEG_MAP(9),  seven_seg_t'("0010000"));
                check_equal(SEVEN_SEG_MAP(10), seven_seg_t'("0001000"));
                check_equal(SEVEN_SEG_MAP(11), seven_seg_t'("0000011"));
                check_equal(SEVEN_SEG_MAP(12), seven_seg_t'("1000110"));
                check_equal(SEVEN_SEG_MAP(13), seven_seg_t'("0100001"));
                check_equal(SEVEN_SEG_MAP(14), seven_seg_t'("0000110"));
                check_equal(SEVEN_SEG_MAP(15), seven_seg_t'("0001110"));
                wait for 1 ns;
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end;