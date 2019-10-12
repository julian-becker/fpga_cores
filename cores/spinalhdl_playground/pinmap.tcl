set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

set_location_assignment PIN_24 -to CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLK

set_location_assignment PIN_89 -to RSTn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RSTn

set_location_assignment PIN_88 -to keys_Key3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to keys_Key3

set_location_assignment PIN_91 -to keys_Key2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to keys_Key2

set_location_assignment PIN_90 -to keys_Key1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to keys_Key1


set_location_assignment PIN_141 -to leds_d5_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to leds_d5_n
set_location_assignment PIN_1 -to leds_d4_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to leds_d4_n
set_location_assignment PIN_2 -to leds_d3_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to leds_d3_n
set_location_assignment PIN_3 -to leds_d2_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to leds_d2_n
