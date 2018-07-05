@echo off
set xv_path=E:\\Programfiles\\Xilinx17\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 54e20c03d979472aa3201f5bf30360d0 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sram_test_tb_behav xil_defaultlib.sram_test_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
