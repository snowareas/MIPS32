@echo off
set xv_path=E:\\Programfiles\\Xilinx17\\Vivado\\2017.2\\bin
call %xv_path%/xsim sram_test_tb_behav -key {Behavioral:sim_1:Functional:sram_test_tb} -tclbatch sram_test_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
