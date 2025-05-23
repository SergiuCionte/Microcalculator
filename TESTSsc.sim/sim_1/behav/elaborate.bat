@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto dde0905a518a4a63bd1972a8c8d0a3ba -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Main_behav xil_defaultlib.Main -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
