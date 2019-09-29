library ieee;
use ieee.std_logic_1164.all;
library basetypes;
use basetypes.basetypes_pkg.all;
library vunit_lib;
context vunit_lib.vunit_context;

entity basetypes_tb is
    generic (runner_cfg : string);
end;

architecture spec of basetypes_tb is
    signal byte_sig : byte := ZERO_BYTE;
    signal ubyte_sig : ubyte := ZERO_UBYTE;
begin
    main : process
    begin
        test_runner_setup(runner, runner_cfg);
        while test_suite loop
            if run("test_byte") then
                byte_sig <= "10101010";
                wait until byte_sig'stable;
                check_equal(byte_sig, byte'("10101010"));

                byte_sig <= ZERO_BYTE;
                wait until byte_sig'stable;
                check_equal(byte_sig, ZERO_BYTE);

            elsif run("test_ubyte") then
                ubyte_sig <= "01010101";
                wait until ubyte_sig'stable;
                check_equal(ubyte_sig, ubyte'("01010101"));

                ubyte_sig <= ZERO_UBYTE;
                wait until ubyte_sig'stable;
                check_equal(ubyte_sig, ZERO_UBYTE);
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;
end;