@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Oct 10 19:57:21 +0300 2024
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto c00d15654868464fa1ba3eae8adcbba4 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot encoder_tb_behav xil_defaultlib.encoder_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
