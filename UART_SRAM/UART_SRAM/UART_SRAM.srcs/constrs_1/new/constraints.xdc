set_property PACKAGE_PIN R1 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

set_property PACKAGE_PIN M4 [get_ports {data_choose}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_choose}]

set_property PACKAGE_PIN P17 [get_ports sysclk]
set_property IOSTANDARD LVCMOS33 [get_ports sysclk]

set_property PACKAGE_PIN K2 [get_ports read_finish]
set_property IOSTANDARD LVCMOS33 [get_ports read_finish]

set_property PACKAGE_PIN J2 [get_ports compare_result]
set_property IOSTANDARD LVCMOS33 [get_ports compare_result]

set_property PACKAGE_PIN J3 [get_ports UART_end_flag]
set_property IOSTANDARD LVCMOS33 [get_ports UART_end_flag]
set_property PACKAGE_PIN H4 [get_ports sram_wr_en]
set_property IOSTANDARD LVCMOS33 [get_ports sram_wr_en]
#set_property PACKAGE_PIN J4 [get_ports OE]
#set_property IOSTANDARD LVCMOS33 [get_ports OE]
#set_property PACKAGE_PIN G3 [get_ports CE]
#set_property IOSTANDARD LVCMOS33 [get_ports CE]
#set_property PACKAGE_PIN G4 [get_ports UB]
#set_property IOSTANDARD LVCMOS33 [get_ports UB]
#set_property PACKAGE_PIN F6 [get_ports LB]
#set_property IOSTANDARD LVCMOS33 [get_ports LB]

set_property PACKAGE_PIN N4 [get_ports test_mode]
set_property IOSTANDARD LVCMOS33 [get_ports test_mode]

set_property PACKAGE_PIN J4 [get_ports show_addr[0]]
set_property IOSTANDARD LVCMOS33 [get_ports show_addr[0]]
set_property PACKAGE_PIN G3 [get_ports show_addr[1]]
set_property IOSTANDARD LVCMOS33 [get_ports show_addr[1]]
set_property PACKAGE_PIN G4 [get_ports show_addr[2]]
set_property IOSTANDARD LVCMOS33 [get_ports show_addr[2]]
set_property PACKAGE_PIN F6 [get_ports show_addr[3]]
set_property IOSTANDARD LVCMOS33 [get_ports show_addr[3]]

set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {test_addr[7]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {test_addr[6]}]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {test_addr[5]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {test_addr[4]}]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {test_addr[3]}]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports {test_addr[2]}]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {test_addr[1]}]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {test_addr[0]}]

set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {test_data[7]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {test_data[6]}]
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33} [get_ports {test_data[5]}]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports {test_data[4]}]
set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports {test_data[3]}]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {test_data[2]}]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {test_data[1]}]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {test_data[0]}]

set_property PACKAGE_PIN N5 [get_ports UART_RX]
set_property PACKAGE_PIN T4 [get_ports UART_TX]

set_property IOSTANDARD LVCMOS33 [get_ports UART_RX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TX]

#SRAM
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {sram_data[15]}]
set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {sram_data[14]}]
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {sram_data[13]}]
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {sram_data[12]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {sram_data[11]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {sram_data[10]}]
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {sram_data[9]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {sram_data[8]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {sram_data[7]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {sram_data[6]}]
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {sram_data[5]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {sram_data[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {sram_data[3]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {sram_data[2]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {sram_data[1]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {sram_data[0]}]

set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {sram_addr[18]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {sram_addr[17]}]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {sram_addr[16]}]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports {sram_addr[15]}]
set_property -dict {PACKAGE_PIN R12 IOSTANDARD LVCMOS33} [get_ports {sram_addr[14]}]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {sram_addr[13]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {sram_addr[12]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {sram_addr[11]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {sram_addr[10]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {sram_addr[9]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {sram_addr[8]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {sram_addr[7]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {sram_addr[6]}]
set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33} [get_ports {sram_addr[5]}]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {sram_addr[4]}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {sram_addr[3]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {sram_addr[2]}]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {sram_addr[1]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {sram_addr[0]}]

set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports CE]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports LB]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports OE]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports UB]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports WE]



 #set_property CFGBVS VCCO [current_design]
 #where value1 is either VCCO or GND

 #set_property CONFIG_VOLTAGE 3.3 [current_design]
 #where value2 is the voltage provided to configuration bank 0

