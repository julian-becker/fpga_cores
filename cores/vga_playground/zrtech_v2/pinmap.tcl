set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

set_location_assignment PIN_24 -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk

set_location_assignment PIN_89 -to rstn
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to rstn


set_location_assignment PIN_100 -to HSYNC
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HSYNC

set_location_assignment PIN_101 -to VSYNC
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VSYNC

set_location_assignment PIN_110 -to VB[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VB[4]

set_location_assignment PIN_106 -to VB[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VB[3]

set_location_assignment PIN_105 -to VB[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VB[2]

set_location_assignment PIN_104 -to VB[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VB[1]

set_location_assignment PIN_103 -to VB[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VB[0]

set_location_assignment PIN_119 -to VG[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[5]

set_location_assignment PIN_115 -to VG[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[4]

set_location_assignment PIN_114 -to VG[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[3]

set_location_assignment PIN_113 -to VG[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[2]

set_location_assignment PIN_112 -to VG[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[1]

set_location_assignment PIN_111 -to VG[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VG[0]

set_location_assignment PIN_126 -to VR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VR[4]

set_location_assignment PIN_125 -to VR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VR[3]

set_location_assignment PIN_124 -to VR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VR[2]

set_location_assignment PIN_121 -to VR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VR[1]

set_location_assignment PIN_120 -to VR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VR[0]