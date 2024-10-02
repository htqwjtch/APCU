-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Thu Sep 26 17:59:07 2024
-- Host        : DESKTOP-7DQQQC3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/htqwj/APCU/work_1/project_1/project_1.sim/sim_1/synth/func/xsim/encoder_tb_func_synth.vhd
-- Design      : encoder
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity encoder is
  port (
    E1 : in STD_LOGIC;
    X0 : in STD_LOGIC;
    X1 : in STD_LOGIC;
    X2 : in STD_LOGIC;
    X3 : in STD_LOGIC;
    X4 : in STD_LOGIC;
    X5 : in STD_LOGIC;
    X6 : in STD_LOGIC;
    X7 : in STD_LOGIC;
    EO : out STD_LOGIC;
    GS : out STD_LOGIC;
    Y0 : out STD_LOGIC;
    Y1 : out STD_LOGIC;
    Y2 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of encoder : entity is true;
end encoder;

architecture STRUCTURE of encoder is
  signal E1_IBUF : STD_LOGIC;
  signal EO_OBUF : STD_LOGIC;
  signal EO_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal GS_OBUF : STD_LOGIC;
  signal X0_IBUF : STD_LOGIC;
  signal X1_IBUF : STD_LOGIC;
  signal X2_IBUF : STD_LOGIC;
  signal X3_IBUF : STD_LOGIC;
  signal X4_IBUF : STD_LOGIC;
  signal X5_IBUF : STD_LOGIC;
  signal X6_IBUF : STD_LOGIC;
  signal X7_IBUF : STD_LOGIC;
  signal Y0_OBUF : STD_LOGIC;
  signal Y0_OBUFT_inst_i_3_n_0 : STD_LOGIC;
  signal Y1_OBUF : STD_LOGIC;
  signal Y1_OBUFT_inst_i_2_n_0 : STD_LOGIC;
  signal Y2_OBUF : STD_LOGIC;
  signal Y2_TRI : STD_LOGIC;
  signal and_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EO_OBUF_inst_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of Y0_OBUFT_inst_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Y1_OBUFT_inst_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Y2_OBUFT_inst_i_1 : label is "soft_lutpair0";
begin
E1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => E1,
      O => E1_IBUF
    );
EO_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EO_OBUF,
      O => EO
    );
EO_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBFFFFFFF"
    )
        port map (
      I0 => EO_OBUF_inst_i_2_n_0,
      I1 => X0_IBUF,
      I2 => X1_IBUF,
      I3 => X3_IBUF,
      I4 => X2_IBUF,
      I5 => E1_IBUF,
      O => EO_OBUF
    );
EO_OBUF_inst_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => X4_IBUF,
      I1 => X5_IBUF,
      I2 => X6_IBUF,
      I3 => X7_IBUF,
      O => EO_OBUF_inst_i_2_n_0
    );
GS_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => GS_OBUF,
      O => GS
    );
GS_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => E1_IBUF,
      I1 => EO_OBUF_inst_i_2_n_0,
      I2 => X0_IBUF,
      I3 => X1_IBUF,
      I4 => X3_IBUF,
      I5 => X2_IBUF,
      O => GS_OBUF
    );
X0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X0,
      O => X0_IBUF
    );
X1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X1,
      O => X1_IBUF
    );
X2_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X2,
      O => X2_IBUF
    );
X3_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X3,
      O => X3_IBUF
    );
X4_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X4,
      O => X4_IBUF
    );
X5_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X5,
      O => X5_IBUF
    );
X6_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X6,
      O => X6_IBUF
    );
X7_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => X7,
      O => X7_IBUF
    );
Y0_OBUFT_inst: unisim.vcomponents.OBUFT
     port map (
      I => Y0_OBUF,
      O => Y0,
      T => Y2_TRI
    );
Y0_OBUFT_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => E1_IBUF,
      I1 => X7_IBUF,
      I2 => X6_IBUF,
      I3 => Y0_OBUFT_inst_i_3_n_0,
      O => Y0_OBUF
    );
Y0_OBUFT_inst_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => and_0,
      O => Y2_TRI
    );
Y0_OBUFT_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888088808080808"
    )
        port map (
      I0 => X5_IBUF,
      I1 => X7_IBUF,
      I2 => X4_IBUF,
      I3 => X2_IBUF,
      I4 => X1_IBUF,
      I5 => X3_IBUF,
      O => Y0_OBUFT_inst_i_3_n_0
    );
Y0_OBUFT_inst_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF7FFF"
    )
        port map (
      I0 => X2_IBUF,
      I1 => X3_IBUF,
      I2 => X1_IBUF,
      I3 => X0_IBUF,
      I4 => EO_OBUF_inst_i_2_n_0,
      I5 => E1_IBUF,
      O => and_0
    );
Y1_OBUFT_inst: unisim.vcomponents.OBUFT
     port map (
      I => Y1_OBUF,
      O => Y1,
      T => Y2_TRI
    );
Y1_OBUFT_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAFFAAFFAAFF"
    )
        port map (
      I0 => E1_IBUF,
      I1 => X3_IBUF,
      I2 => X2_IBUF,
      I3 => Y1_OBUFT_inst_i_2_n_0,
      I4 => X5_IBUF,
      I5 => X4_IBUF,
      O => Y1_OBUF
    );
Y1_OBUFT_inst_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => X7_IBUF,
      I1 => X6_IBUF,
      O => Y1_OBUFT_inst_i_2_n_0
    );
Y2_OBUFT_inst: unisim.vcomponents.OBUFT
     port map (
      I => Y2_OBUF,
      O => Y2,
      T => Y2_TRI
    );
Y2_OBUFT_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAAA"
    )
        port map (
      I0 => E1_IBUF,
      I1 => X7_IBUF,
      I2 => X6_IBUF,
      I3 => X5_IBUF,
      I4 => X4_IBUF,
      O => Y2_OBUF
    );
end STRUCTURE;
