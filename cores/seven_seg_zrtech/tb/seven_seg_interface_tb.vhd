library ieee;
use ieee.std_logic_1164.all;

library seven_seg;
use seven_seg.seven_seg_pkg.all;

library seven_seg_zrtech;
use seven_seg_zrtech.seven_seg_zrtech_pkg.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity seven_seg_interface_tb is
    generic (runner_cfg : string);
end;
architecture spec of seven_seg_interface_tb is
    signal to_board : seven_seg_interface_t := SEVEN_SEG_INTERFACE_CLEAR;

    signal letter        : seven_seg_t := SEVEN_SEG_HEX_MAP(0);
    signal active        : std_ulogic_vector(SEVEN_SEG_RANGE) := (others => '0');
    signal decimal_point : std_ulogic := '0';
begin

    dut : seven_seg_interface
        port map (
            to_board      => to_board,
            letter        => letter,
            decimal_point => decimal_point,
            active        => active
        );


    main : process
        constant TEST_DIGIT : seven_seg_t := SEVEN_SEG_HEX_MAP(0);
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("active") then
                active <= "1010";
                wait for 1 ps;
                check_equal(to_board.ds_en1, '1');
                check_equal(to_board.ds_en2, '0');
                check_equal(to_board.ds_en3, '1');
                check_equal(to_board.ds_en4, '0');
            elsif run("letter") then
                letter <= TEST_DIGIT;
                wait for 1 ps;
                check_equal(to_board.ds_a, TEST_DIGIT(6));
                check_equal(to_board.ds_b, TEST_DIGIT(5));
                check_equal(to_board.ds_c, TEST_DIGIT(4));
                check_equal(to_board.ds_d, TEST_DIGIT(3));
                check_equal(to_board.ds_e, TEST_DIGIT(2));
                check_equal(to_board.ds_f, TEST_DIGIT(1));
                check_equal(to_board.ds_g, TEST_DIGIT(0));
            elsif run("decimal_point") then
                decimal_point <= '0';
                wait for 1 ps;
                check_equal(to_board.ds_dp, '0');
            end if;
            end loop;
        test_runner_cleanup(runner);
    end process;
end;