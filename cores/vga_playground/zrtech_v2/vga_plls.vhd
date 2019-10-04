--copyright (c) 2018  intel corporation. all rights reserved.
--your use of intel corporation's design tools, logic functions 
--and other software and tools, and its ampp partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the intel program license 
--subscription agreement, the intel quartus prime license agreement,
--the intel fpga ip license agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--intel and sold by intel or its authorized distributors.  please
--refer to the applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
use altera_mf.all;

entity vga_plls is
    port (
        areset     : in std_logic := '0';
        inclk0     : in std_logic := '0';
        clk_vga    : out std_logic
    );
end vga_plls;
architecture syn of vga_plls is

    signal sub_wire0 : std_logic;
    signal sub_wire1 : std_logic_vector (1 downto 0);
    signal sub_wire2_bv : bit_vector (0 downto 0);
    signal sub_wire2 : std_logic_vector (0 downto 0);
    signal sub_wire3 : std_logic_vector (4 downto 0);
    signal sub_wire4 : std_logic;
    component altpll
        generic (
            bandwidth_type : string;
            clk0_divide_by : natural;
            clk0_duty_cycle : natural;
            clk0_multiply_by : natural;
            clk0_phase_shift : string;
            compensate_clock : string;
            auto_inclk_interface_clock_rate : natural;
            inclk0_input_frequency : natural;
            intended_device_family : string;
            lpm_hint : string;
            lpm_type : string;
            operation_mode : string;
            pll_type : string;
            port_areset : string;
            port_inclk0 : string;
            port_clk0 : string;
            width_clock : natural
        );
        port (
            areset : in std_logic;
            inclk : in std_logic_vector (1 downto 0);
            clk : out std_logic_vector (4 downto 0)
        );
    end component;

begin
    sub_wire2_bv(0 downto 0) <= "0";
    sub_wire2 <= to_stdlogicvector(sub_wire2_bv);
    sub_wire0 <= inclk0;
    sub_wire1 <= sub_wire2(0 downto 0) & sub_wire0;
    sub_wire4 <= sub_wire3(0);
    clk_vga <= sub_wire4;

    altpll_component : altpll
    generic map(
        bandwidth_type => "LOW",
        clk0_multiply_by => 74,
        clk0_divide_by => 147,
        clk0_duty_cycle => 50,
        clk0_phase_shift => "0",
        compensate_clock => "CLK0",
        auto_inclk_interface_clock_rate => 50000000,
        inclk0_input_frequency => 20000,
        intended_device_family => "Cyclone IV E",
        lpm_hint => "CBX_MODULE_PREFIX=pll",
        lpm_type => "altpll",
        operation_mode => "NORMAL",
        pll_type => "AUTO",
        port_areset => "PORT_USED",
        port_inclk0 => "PORT_USED",
        port_clk0 => "PORT_USED",
        width_clock => 5
    )
    port map(
        areset => areset,
        inclk => sub_wire1,
        clk => sub_wire3
    );

end syn;