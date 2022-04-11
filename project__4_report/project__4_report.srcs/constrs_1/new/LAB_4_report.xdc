# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10 -waveform {0 5} [get_ports clock]
# Buttons
set_property PACKAGE_PIN W19 [get_ports left ]
set_property PACKAGE_PIN U18 [get_ports reset ]
set_property PACKAGE_PIN T17 [get_ports right ]
# Switches
set_property PACKAGE_PIN V17 [get_ports switch ]
# LEDs
set_property PACKAGE_PIN V13 [get_ports D[8]]
set_property PACKAGE_PIN V14 [get_ports D[7]]
set_property PACKAGE_PIN U14 [get_ports D[6]]
set_property PACKAGE_PIN U15 [get_ports D[5]]
set_property PACKAGE_PIN W18 [get_ports D[4]]
set_property PACKAGE_PIN V19 [get_ports D[3]]
set_property PACKAGE_PIN U19 [get_ports D[2]]
set_property PACKAGE_PIN E19 [get_ports D[1]]
set_property PACKAGE_PIN U16 [get_ports D[0]]
set_property IOSTANDARD LVCMOS33 [get_ports {left reset right switch D}]