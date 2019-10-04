library ieee;
use ieee.std_logic_1164.all;

entity counter is
	generic (
		COUNTER_MAX : integer
	);
	port (
		clk       : in  std_ulogic;
		reset     : in  std_ulogic;
		increment : in  std_ulogic;
		overflow  : out std_ulogic;
		value     : out natural range 0 to COUNTER_MAX
	);
end;

architecture impl of counter is
	type state_t is record
		counter_value : natural range 0 to COUNTER_MAX;
		overflow      : std_ulogic;
	end record;

	constant INITIAL_STATE : state_t := (counter_value => 0, overflow => '0');
	signal   state         : state_t := INITIAL_STATE;
	signal   state_next    : state_t;
begin

	outputs : process (state)
	begin
		value    <= state.counter_value;
		overflow <= state.overflow;
	end process;

	combinatorial : process (all)
	begin
		state_next <= state;
		state_next.overflow <= '0';
		if increment = '1' and state.counter_value < COUNTER_MAX then
			state_next.counter_value <= state.counter_value + 1;
		elsif increment = '1' then
			state_next.counter_value <= 0;
			state_next.overflow <= '1';
		end if;
	end process;

	clocked : process (clk,reset)
	begin
		if reset then
			state <= INITIAL_STATE;
		elsif rising_edge(clk) then
			state <= state_next;
		end if;
	end process;
end;
