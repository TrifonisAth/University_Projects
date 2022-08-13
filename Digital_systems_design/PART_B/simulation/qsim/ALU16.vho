-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "06/05/2022 21:01:46"

-- 
-- Device: Altera 5M160ZT100C4 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	ALU16 IS
    PORT (
	a : IN std_logic_vector(15 DOWNTO 0);
	b : IN std_logic_vector(15 DOWNTO 0);
	opcode : IN std_logic_vector(2 DOWNTO 0);
	result : OUT std_logic_vector(15 DOWNTO 0);
	overflow : OUT std_logic
	);
END ALU16;

-- Design Ports Information


ARCHITECTURE structure OF ALU16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_result : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL \G0:0:ALU1|OPER|Mux0~3_combout\ : std_logic;
SIGNAL \G0:0:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:0:ALU1|OPER|Mux0~4_combout\ : std_logic;
SIGNAL \Step0|Mux0~0_combout\ : std_logic;
SIGNAL \Step0|Mux1~0_combout\ : std_logic;
SIGNAL \Step0|Mux4~0_combout\ : std_logic;
SIGNAL \Step0|Mux2~0_combout\ : std_logic;
SIGNAL \G0:0:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:1:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:1:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:1:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:2:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:2:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:1:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:2:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:2:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:2:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:3:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:2:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:3:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:3:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:4:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:4:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:3:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:4:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:4:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:5:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:4:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:5:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:5:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:6:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:5:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:6:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:6:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:6:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:7:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:6:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:7:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:7:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:8:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:7:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:8:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:8:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:8:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:9:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:8:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:9:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:9:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:9:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:11:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:10:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:11:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:11:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:12:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:11:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:12:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:12:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:12:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:12:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:13:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:13:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:13:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:13:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|XOR2|out1~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|INVERTING_A|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:15:ALU1|OPER|Mux0~0_combout\ : std_logic;
SIGNAL \G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ : std_logic;
SIGNAL \G0:14:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \G0:15:ALU1|OPER|Mux0~1_combout\ : std_logic;
SIGNAL \G0:15:ALU1|OPER|Mux0~2_combout\ : std_logic;
SIGNAL \G0:15:ALU1|ADDING|Cout~0_combout\ : std_logic;
SIGNAL \overflow~0_combout\ : std_logic;
SIGNAL \b~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \opcode~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \a~combout\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_opcode <= opcode;
result <= ww_result;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(0),
	combout => \opcode~combout\(0));

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(1),
	combout => \opcode~combout\(1));

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(2),
	combout => \opcode~combout\(2));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(0),
	combout => \b~combout\(0));

-- Location: LC_X3_Y1_N2
\G0:0:ALU1|OPER|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \G0:0:ALU1|OPER|Mux0~3_combout\ = (\opcode~combout\(1) & (\b~combout\(0) $ (((!\opcode~combout\(2)) # (!\opcode~combout\(0)))))) # (!\opcode~combout\(1) & ((\b~combout\(0) & ((!\opcode~combout\(2)))) # (!\b~combout\(0) & (\opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "836e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:0:ALU1|OPER|Mux0~3_combout\);

-- Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(0),
	combout => \a~combout\(0));

-- Location: LC_X3_Y1_N7
\G0:0:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:0:ALU1|OPER|Mux0~2_combout\ = (\opcode~combout\(1) & (\b~combout\(0) & ((!\opcode~combout\(2)) # (!\opcode~combout\(0))))) # (!\opcode~combout\(1) & ((\b~combout\(0) & (\opcode~combout\(0))) # (!\b~combout\(0) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6e30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:0:ALU1|OPER|Mux0~2_combout\);

-- Location: LC_X3_Y1_N8
\G0:0:ALU1|OPER|Mux0~4\ : maxv_lcell
-- Equation(s):
-- \G0:0:ALU1|OPER|Mux0~4_combout\ = ((\a~combout\(0) & (\G0:0:ALU1|OPER|Mux0~3_combout\)) # (!\a~combout\(0) & ((\G0:0:ALU1|OPER|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \G0:0:ALU1|OPER|Mux0~3_combout\,
	datac => \a~combout\(0),
	datad => \G0:0:ALU1|OPER|Mux0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:0:ALU1|OPER|Mux0~4_combout\);

-- Location: LC_X3_Y2_N8
\Step0|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Step0|Mux0~0_combout\ = (((\opcode~combout\(2) & \opcode~combout\(0))) # (!\opcode~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "88ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(0),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Step0|Mux0~0_combout\);

-- Location: LC_X3_Y1_N0
\Step0|Mux1~0\ : maxv_lcell
-- Equation(s):
-- \Step0|Mux1~0_combout\ = (\opcode~combout\(0) & (!\opcode~combout\(1))) # (!\opcode~combout\(0) & (\opcode~combout\(1) & (\opcode~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6262",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Step0|Mux1~0_combout\);

-- Location: LC_X3_Y1_N3
\Step0|Mux4~0\ : maxv_lcell
-- Equation(s):
-- \Step0|Mux4~0_combout\ = (\opcode~combout\(0) & (\opcode~combout\(1) & (!\opcode~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0808",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Step0|Mux4~0_combout\);

-- Location: LC_X3_Y2_N7
\Step0|Mux2~0\ : maxv_lcell
-- Equation(s):
-- \Step0|Mux2~0_combout\ = (\opcode~combout\(2) & (((!\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Step0|Mux2~0_combout\);

-- Location: LC_X3_Y1_N5
\G0:0:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:0:ALU1|ADDING|Cout~0_combout\ = (\b~combout\(0) & ((\a~combout\(0) & ((!\Step0|Mux2~0_combout\))) # (!\a~combout\(0) & (\Step0|Mux4~0_combout\ & \Step0|Mux2~0_combout\)))) # (!\b~combout\(0) & ((\Step0|Mux4~0_combout\) # ((!\a~combout\(0) & 
-- \Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2be2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux4~0_combout\,
	datab => \b~combout\(0),
	datac => \a~combout\(0),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:0:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X4_Y2_N0
\G0:1:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:1:ALU1|OPER|Mux0~1_combout\ = (\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (!\Step0|Mux1~0_combout\ & (\G0:0:ALU1|ADDING|Cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9898",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \Step0|Mux1~0_combout\,
	datac => \G0:0:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:1:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(1),
	combout => \b~combout\(1));

-- Location: LC_X4_Y4_N2
\G0:1:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(1) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:1:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(1),
	combout => \a~combout\(1));

-- Location: LC_X4_Y2_N3
\G0:1:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:1:ALU1|OPER|Mux0~0_combout\ = \a~combout\(1) $ (((\opcode~combout\(2) & (!\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a6a6",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(1),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:1:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X4_Y2_N6
\G0:1:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:1:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:1:ALU1|OPER|Mux0~1_combout\ & ((\G0:1:ALU1|INVERTING_B|inToInvert~0_combout\) # (\G0:1:ALU1|OPER|Mux0~0_combout\))) # (!\G0:1:ALU1|OPER|Mux0~1_combout\ & 
-- (\G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ & \G0:1:ALU1|OPER|Mux0~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:1:ALU1|OPER|Mux0~1_combout\ $ (\G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:1:ALU1|OPER|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \G0:1:ALU1|OPER|Mux0~1_combout\,
	datac => \G0:1:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:1:ALU1|OPER|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:1:ALU1|OPER|Mux0~2_combout\);

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(2),
	combout => \a~combout\(2));

-- Location: LC_X4_Y2_N2
\G0:2:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|INVERTING_A|inToInvert~0_combout\ = \a~combout\(2) $ (((!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b4b4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \a~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(2),
	combout => \b~combout\(2));

-- Location: LC_X4_Y2_N4
\G0:2:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(2) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X4_Y2_N7
\G0:1:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:1:ALU1|ADDING|Cout~0_combout\ = (\G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:0:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(1))))) # (!\G0:1:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:0:ALU1|ADDING|Cout~0_combout\ 
-- & (\Step0|Mux2~0_combout\ $ (\a~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:1:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \Step0|Mux2~0_combout\,
	datac => \a~combout\(1),
	datad => \G0:0:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:1:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X4_Y2_N9
\G0:2:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|XOR2|out1~0_combout\ = \b~combout\(2) $ (\a~combout\(2) $ (((\Step0|Mux4~0_combout\ & !\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c96",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux4~0_combout\,
	datab => \b~combout\(2),
	datac => \a~combout\(2),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X4_Y2_N8
\G0:2:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (\G0:2:ALU1|XOR2|out1~0_combout\ $ (((!\Step0|Mux1~0_combout\ & \G0:1:ALU1|ADDING|Cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cd98",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \Step0|Mux1~0_combout\,
	datac => \G0:1:ALU1|ADDING|Cout~0_combout\,
	datad => \G0:2:ALU1|XOR2|out1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X4_Y2_N1
\G0:2:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|OPER|Mux0~1_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:2:ALU1|INVERTING_A|inToInvert~0_combout\ & ((\G0:2:ALU1|INVERTING_B|inToInvert~0_combout\) # (\G0:2:ALU1|OPER|Mux0~0_combout\))) # (!\G0:2:ALU1|INVERTING_A|inToInvert~0_combout\ & 
-- (\G0:2:ALU1|INVERTING_B|inToInvert~0_combout\ & \G0:2:ALU1|OPER|Mux0~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (((\G0:2:ALU1|OPER|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fd80",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \G0:2:ALU1|INVERTING_A|inToInvert~0_combout\,
	datac => \G0:2:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:2:ALU1|OPER|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(3),
	combout => \b~combout\(3));

-- Location: LC_X4_Y4_N4
\G0:3:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(3) $ (((\opcode~combout\(1) & (!\opcode~combout\(2) & \opcode~combout\(0))) # (!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9b64",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(0),
	datad => \b~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:3:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(3),
	combout => \a~combout\(3));

-- Location: LC_X5_Y4_N5
\G0:3:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:3:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(3) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:3:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X4_Y2_N5
\G0:2:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:2:ALU1|ADDING|Cout~0_combout\ = (\G0:2:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:1:ALU1|ADDING|Cout~0_combout\) # (\a~combout\(2) $ (\Step0|Mux2~0_combout\)))) # (!\G0:2:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:1:ALU1|ADDING|Cout~0_combout\ 
-- & (\a~combout\(2) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:2:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:1:ALU1|ADDING|Cout~0_combout\,
	datac => \a~combout\(2),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:2:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X5_Y4_N1
\G0:3:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:3:ALU1|OPER|Mux0~1_combout\ = (\Step0|Mux1~0_combout\ & (\Step0|Mux0~0_combout\)) # (!\Step0|Mux1~0_combout\ & (!\Step0|Mux0~0_combout\ & ((\G0:2:ALU1|ADDING|Cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9988",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux1~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datad => \G0:2:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:3:ALU1|OPER|Mux0~1_combout\);

-- Location: LC_X5_Y4_N0
\G0:3:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:3:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:3:ALU1|OPER|Mux0~0_combout\) # (\G0:3:ALU1|OPER|Mux0~1_combout\))) # (!\G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:3:ALU1|OPER|Mux0~0_combout\ & \G0:3:ALU1|OPER|Mux0~1_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:3:ALU1|OPER|Mux0~0_combout\ $ (\G0:3:ALU1|OPER|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \G0:3:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \G0:3:ALU1|OPER|Mux0~0_combout\,
	datad => \G0:3:ALU1|OPER|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:3:ALU1|OPER|Mux0~2_combout\);

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(4),
	combout => \a~combout\(4));

-- Location: LC_X5_Y4_N8
\G0:4:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(4) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: PIN_82,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(4),
	combout => \b~combout\(4));

-- Location: LC_X5_Y4_N4
\G0:4:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|XOR2|out1~0_combout\ = \a~combout\(4) $ (\b~combout\(4) $ (((!\Step0|Mux2~0_combout\ & \Step0|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "659a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(4),
	datab => \Step0|Mux2~0_combout\,
	datac => \Step0|Mux4~0_combout\,
	datad => \b~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X5_Y4_N9
\G0:3:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:3:ALU1|ADDING|Cout~0_combout\ = (\G0:2:ALU1|ADDING|Cout~0_combout\ & ((\G0:3:ALU1|INVERTING_B|inToInvert~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(3))))) # (!\G0:2:ALU1|ADDING|Cout~0_combout\ & (\G0:3:ALU1|INVERTING_B|inToInvert~0_combout\ 
-- & (\Step0|Mux2~0_combout\ $ (\a~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:2:ALU1|ADDING|Cout~0_combout\,
	datab => \G0:3:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:3:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X5_Y4_N6
\G0:4:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (\G0:4:ALU1|XOR2|out1~0_combout\ $ (((!\Step0|Mux1~0_combout\ & \G0:3:ALU1|ADDING|Cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a9b8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux1~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \G0:4:ALU1|XOR2|out1~0_combout\,
	datad => \G0:3:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y4_N3
\G0:4:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(4) $ (((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96a6",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(4),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X5_Y4_N2
\G0:4:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|OPER|Mux0~1_combout\ = (\G0:4:ALU1|INVERTING_A|inToInvert~0_combout\ & ((\G0:4:ALU1|OPER|Mux0~0_combout\) # ((\Step0|Mux0~0_combout\ & \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\)))) # (!\G0:4:ALU1|INVERTING_A|inToInvert~0_combout\ & 
-- (\G0:4:ALU1|OPER|Mux0~0_combout\ & ((\G0:4:ALU1|INVERTING_B|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f8b0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:4:ALU1|INVERTING_A|inToInvert~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \G0:4:ALU1|OPER|Mux0~0_combout\,
	datad => \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(5),
	combout => \a~combout\(5));

-- Location: LC_X3_Y4_N6
\G0:5:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:5:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(5) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(1),
	datac => \a~combout\(5),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:5:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y4_N7
\G0:4:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:4:ALU1|ADDING|Cout~0_combout\ = (\G0:4:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:3:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(4))))) # (!\G0:4:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:3:ALU1|ADDING|Cout~0_combout\ 
-- & (\Step0|Mux2~0_combout\ $ (\a~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:4:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:3:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:4:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X3_Y4_N7
\G0:5:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:5:ALU1|OPER|Mux0~1_combout\ = ((\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (!\Step0|Mux1~0_combout\ & \G0:4:ALU1|ADDING|Cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Step0|Mux0~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \G0:4:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:5:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(5),
	combout => \b~combout\(5));

-- Location: LC_X4_Y4_N6
\G0:5:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(5) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X3_Y4_N3
\G0:5:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:5:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:5:ALU1|OPER|Mux0~0_combout\ & ((\G0:5:ALU1|OPER|Mux0~1_combout\) # (\G0:5:ALU1|INVERTING_B|inToInvert~0_combout\))) # (!\G0:5:ALU1|OPER|Mux0~0_combout\ & (\G0:5:ALU1|OPER|Mux0~1_combout\ & 
-- \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:5:ALU1|OPER|Mux0~0_combout\ $ (\G0:5:ALU1|OPER|Mux0~1_combout\ $ (\G0:5:ALU1|INVERTING_B|inToInvert~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e896",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:5:ALU1|OPER|Mux0~0_combout\,
	datab => \G0:5:ALU1|OPER|Mux0~1_combout\,
	datac => \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \Step0|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:5:ALU1|OPER|Mux0~2_combout\);

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(6),
	combout => \b~combout\(6));

-- Location: LC_X3_Y4_N8
\G0:6:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(6) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(6),
	combout => \a~combout\(6));

-- Location: LC_X3_Y4_N4
\G0:6:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|XOR2|out1~0_combout\ = \a~combout\(6) $ (\b~combout\(6) $ (((!\Step0|Mux2~0_combout\ & \Step0|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "639c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux2~0_combout\,
	datab => \a~combout\(6),
	datac => \Step0|Mux4~0_combout\,
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X3_Y4_N9
\G0:5:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:5:ALU1|ADDING|Cout~0_combout\ = (\G0:5:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:4:ALU1|ADDING|Cout~0_combout\) # (\a~combout\(5) $ (\Step0|Mux2~0_combout\)))) # (!\G0:5:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:4:ALU1|ADDING|Cout~0_combout\ 
-- & (\a~combout\(5) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:5:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \a~combout\(5),
	datac => \Step0|Mux2~0_combout\,
	datad => \G0:4:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:5:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X3_Y4_N0
\G0:6:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (((\Step0|Mux1~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:6:ALU1|XOR2|out1~0_combout\ $ (((!\Step0|Mux1~0_combout\ & \G0:5:ALU1|ADDING|Cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e1e2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:6:ALU1|XOR2|out1~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \G0:5:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X3_Y4_N1
\G0:6:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(6) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(6),
	datac => \opcode~combout\(2),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: LC_X3_Y4_N2
\G0:6:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|OPER|Mux0~1_combout\ = (\G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:6:ALU1|OPER|Mux0~0_combout\) # ((\Step0|Mux0~0_combout\ & \G0:6:ALU1|INVERTING_A|inToInvert~0_combout\)))) # (!\G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:6:ALU1|OPER|Mux0~0_combout\ & ((\G0:6:ALU1|INVERTING_A|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ec8c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:6:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:6:ALU1|OPER|Mux0~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:6:ALU1|INVERTING_A|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(7),
	combout => \a~combout\(7));

-- Location: LC_X2_Y1_N4
\G0:7:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:7:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(7) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(7),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:7:ALU1|OPER|Mux0~0_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(7),
	combout => \b~combout\(7));

-- Location: LC_X2_Y1_N7
\G0:7:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(7) $ (((\opcode~combout\(1) & (!\opcode~combout\(2) & \opcode~combout\(0))) # (!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96b4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \b~combout\(7),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:7:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X3_Y4_N5
\G0:6:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:6:ALU1|ADDING|Cout~0_combout\ = (\G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:5:ALU1|ADDING|Cout~0_combout\) # (\a~combout\(6) $ (\Step0|Mux2~0_combout\)))) # (!\G0:6:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:5:ALU1|ADDING|Cout~0_combout\ 
-- & (\a~combout\(6) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:6:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \a~combout\(6),
	datac => \Step0|Mux2~0_combout\,
	datad => \G0:5:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:6:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X2_Y1_N1
\G0:7:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:7:ALU1|OPER|Mux0~1_combout\ = ((\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (!\Step0|Mux1~0_combout\ & \G0:6:ALU1|ADDING|Cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Step0|Mux0~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \G0:6:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:7:ALU1|OPER|Mux0~1_combout\);

-- Location: LC_X2_Y1_N8
\G0:7:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:7:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:7:ALU1|OPER|Mux0~0_combout\ & ((\G0:7:ALU1|INVERTING_B|inToInvert~0_combout\) # (\G0:7:ALU1|OPER|Mux0~1_combout\))) # (!\G0:7:ALU1|OPER|Mux0~0_combout\ & 
-- (\G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ & \G0:7:ALU1|OPER|Mux0~1_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:7:ALU1|OPER|Mux0~0_combout\ $ (\G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:7:ALU1|OPER|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e992",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:7:ALU1|OPER|Mux0~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \G0:7:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:7:ALU1|OPER|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:7:ALU1|OPER|Mux0~2_combout\);

-- Location: PIN_20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(8),
	combout => \b~combout\(8));

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(8),
	combout => \a~combout\(8));

-- Location: LC_X3_Y1_N6
\G0:8:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|XOR2|out1~0_combout\ = \b~combout\(8) $ (\a~combout\(8) $ (((\Step0|Mux4~0_combout\ & !\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2dd2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux4~0_combout\,
	datab => \Step0|Mux2~0_combout\,
	datac => \b~combout\(8),
	datad => \a~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X2_Y1_N0
\G0:7:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:7:ALU1|ADDING|Cout~0_combout\ = (\G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:6:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(7))))) # (!\G0:7:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:6:ALU1|ADDING|Cout~0_combout\ 
-- & (\Step0|Mux2~0_combout\ $ (\a~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f660",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux2~0_combout\,
	datab => \a~combout\(7),
	datac => \G0:7:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:6:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:7:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X2_Y1_N3
\G0:8:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (((\Step0|Mux1~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:8:ALU1|XOR2|out1~0_combout\ $ (((\G0:7:ALU1|ADDING|Cout~0_combout\ & !\Step0|Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa06",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:8:ALU1|XOR2|out1~0_combout\,
	datab => \G0:7:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \Step0|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X2_Y1_N6
\G0:8:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(8) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: LC_X2_Y1_N9
\G0:8:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(8) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a56a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(8),
	datab => \opcode~combout\(0),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X2_Y1_N5
\G0:8:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|OPER|Mux0~1_combout\ = (\G0:8:ALU1|OPER|Mux0~0_combout\ & ((\G0:8:ALU1|INVERTING_A|inToInvert~0_combout\) # ((\G0:8:ALU1|INVERTING_B|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\)))) # (!\G0:8:ALU1|OPER|Mux0~0_combout\ & 
-- (\G0:8:ALU1|INVERTING_A|inToInvert~0_combout\ & (\Step0|Mux0~0_combout\ & \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ea8a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:8:ALU1|OPER|Mux0~0_combout\,
	datab => \G0:8:ALU1|INVERTING_A|inToInvert~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(9),
	combout => \b~combout\(9));

-- Location: LC_X3_Y2_N4
\G0:9:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(9) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a578",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(0),
	datac => \b~combout\(9),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:9:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(9),
	combout => \a~combout\(9));

-- Location: LC_X3_Y2_N9
\G0:9:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:9:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(9) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f05a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datac => \a~combout\(9),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:9:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X2_Y1_N2
\G0:8:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:8:ALU1|ADDING|Cout~0_combout\ = (\G0:8:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:7:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(8))))) # (!\G0:8:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:7:ALU1|ADDING|Cout~0_combout\ 
-- & (\Step0|Mux2~0_combout\ $ (\a~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux2~0_combout\,
	datab => \G0:8:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \G0:7:ALU1|ADDING|Cout~0_combout\,
	datad => \a~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:8:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X3_Y2_N6
\G0:9:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:9:ALU1|OPER|Mux0~1_combout\ = ((\Step0|Mux1~0_combout\ & ((\Step0|Mux0~0_combout\))) # (!\Step0|Mux1~0_combout\ & (\G0:8:ALU1|ADDING|Cout~0_combout\ & !\Step0|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \G0:8:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \Step0|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:9:ALU1|OPER|Mux0~1_combout\);

-- Location: LC_X3_Y2_N2
\G0:9:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:9:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:9:ALU1|OPER|Mux0~0_combout\) # (\G0:9:ALU1|OPER|Mux0~1_combout\))) # (!\G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:9:ALU1|OPER|Mux0~0_combout\ & \G0:9:ALU1|OPER|Mux0~1_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:9:ALU1|OPER|Mux0~0_combout\ $ (\G0:9:ALU1|OPER|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e896",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:9:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:9:ALU1|OPER|Mux0~0_combout\,
	datac => \G0:9:ALU1|OPER|Mux0~1_combout\,
	datad => \Step0|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:9:ALU1|OPER|Mux0~2_combout\);

-- Location: LC_X3_Y2_N5
\G0:9:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:9:ALU1|ADDING|Cout~0_combout\ = (\G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:8:ALU1|ADDING|Cout~0_combout\) # (\a~combout\(9) $ (\Step0|Mux2~0_combout\)))) # (!\G0:9:ALU1|INVERTING_B|inToInvert~0_combout\ & (\G0:8:ALU1|ADDING|Cout~0_combout\ 
-- & (\a~combout\(9) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:9:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:8:ALU1|ADDING|Cout~0_combout\,
	datac => \a~combout\(9),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:9:ALU1|ADDING|Cout~0_combout\);

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(10),
	combout => \b~combout\(10));

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(10),
	combout => \a~combout\(10));

-- Location: LC_X5_Y1_N3
\G0:10:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|XOR2|out1~0_combout\ = \b~combout\(10) $ (\a~combout\(10) $ (((\Step0|Mux4~0_combout\ & !\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "59a6",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(10),
	datab => \Step0|Mux4~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X5_Y1_N4
\G0:10:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (((\Step0|Mux1~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:10:ALU1|XOR2|out1~0_combout\ $ (((\G0:9:ALU1|ADDING|Cout~0_combout\ & !\Step0|Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cdc2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:9:ALU1|ADDING|Cout~0_combout\,
	datab => \Step0|Mux1~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:10:ALU1|XOR2|out1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y1_N7
\G0:10:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(10) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: LC_X5_Y1_N1
\G0:10:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(10) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d23c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \b~combout\(10),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X5_Y1_N8
\G0:10:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|OPER|Mux0~1_combout\ = (\G0:10:ALU1|OPER|Mux0~0_combout\ & ((\G0:10:ALU1|INVERTING_A|inToInvert~0_combout\) # ((\G0:10:ALU1|INVERTING_B|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\)))) # (!\G0:10:ALU1|OPER|Mux0~0_combout\ & 
-- (\G0:10:ALU1|INVERTING_A|inToInvert~0_combout\ & (\Step0|Mux0~0_combout\ & \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ea8a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:10:ALU1|OPER|Mux0~0_combout\,
	datab => \G0:10:ALU1|INVERTING_A|inToInvert~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(11),
	combout => \b~combout\(11));

-- Location: LC_X4_Y4_N5
\G0:11:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(11) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:11:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(11),
	combout => \a~combout\(11));

-- Location: LC_X5_Y1_N2
\G0:11:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:11:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(11) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:11:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y1_N9
\G0:10:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:10:ALU1|ADDING|Cout~0_combout\ = (\G0:9:ALU1|ADDING|Cout~0_combout\ & ((\G0:10:ALU1|INVERTING_B|inToInvert~0_combout\) # (\a~combout\(10) $ (\Step0|Mux2~0_combout\)))) # (!\G0:9:ALU1|ADDING|Cout~0_combout\ & 
-- (\G0:10:ALU1|INVERTING_B|inToInvert~0_combout\ & (\a~combout\(10) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:9:ALU1|ADDING|Cout~0_combout\,
	datab => \a~combout\(10),
	datac => \Step0|Mux2~0_combout\,
	datad => \G0:10:ALU1|INVERTING_B|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:10:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X5_Y1_N5
\G0:11:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:11:ALU1|OPER|Mux0~1_combout\ = ((\Step0|Mux1~0_combout\ & (\Step0|Mux0~0_combout\)) # (!\Step0|Mux1~0_combout\ & (!\Step0|Mux0~0_combout\ & \G0:10:ALU1|ADDING|Cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Step0|Mux1~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:10:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:11:ALU1|OPER|Mux0~1_combout\);

-- Location: LC_X5_Y1_N6
\G0:11:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:11:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:11:ALU1|OPER|Mux0~0_combout\) # (\G0:11:ALU1|OPER|Mux0~1_combout\))) # (!\G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:11:ALU1|OPER|Mux0~0_combout\ & \G0:11:ALU1|OPER|Mux0~1_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:11:ALU1|OPER|Mux0~0_combout\ $ (\G0:11:ALU1|OPER|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:11:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:11:ALU1|OPER|Mux0~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:11:ALU1|OPER|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:11:ALU1|OPER|Mux0~2_combout\);

-- Location: PIN_72,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(12),
	combout => \b~combout\(12));

-- Location: LC_X5_Y2_N5
\G0:12:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(12) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a758",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(0),
	datac => \opcode~combout\(2),
	datad => \b~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: PIN_83,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(12),
	combout => \a~combout\(12));

-- Location: LC_X5_Y2_N7
\G0:12:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(12) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "af50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \a~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: LC_X5_Y1_N0
\G0:11:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:11:ALU1|ADDING|Cout~0_combout\ = (\G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:10:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(11))))) # (!\G0:11:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:10:ALU1|ADDING|Cout~0_combout\ & (\Step0|Mux2~0_combout\ $ (\a~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:11:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:10:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:11:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X5_Y2_N1
\G0:12:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|XOR2|out1~0_combout\ = \a~combout\(12) $ (\b~combout\(12) $ (((!\Step0|Mux2~0_combout\ & \Step0|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "639c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux2~0_combout\,
	datab => \a~combout\(12),
	datac => \Step0|Mux4~0_combout\,
	datad => \b~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X5_Y2_N9
\G0:12:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (((\Step0|Mux1~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:12:ALU1|XOR2|out1~0_combout\ $ (((\G0:11:ALU1|ADDING|Cout~0_combout\ & !\Step0|Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f1c2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:11:ALU1|ADDING|Cout~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \G0:12:ALU1|XOR2|out1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y2_N0
\G0:12:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|OPER|Mux0~1_combout\ = (\G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:12:ALU1|OPER|Mux0~0_combout\) # ((\Step0|Mux0~0_combout\ & \G0:12:ALU1|INVERTING_A|inToInvert~0_combout\)))) # (!\G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:12:ALU1|OPER|Mux0~0_combout\ & ((\G0:12:ALU1|INVERTING_A|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fb80",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:12:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \G0:12:ALU1|INVERTING_A|inToInvert~0_combout\,
	datad => \G0:12:ALU1|OPER|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(13),
	combout => \b~combout\(13));

-- Location: LC_X3_Y1_N1
\G0:13:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(13) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:13:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X5_Y2_N8
\G0:12:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:12:ALU1|ADDING|Cout~0_combout\ = (\G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:11:ALU1|ADDING|Cout~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(12))))) # (!\G0:12:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:11:ALU1|ADDING|Cout~0_combout\ & (\Step0|Mux2~0_combout\ $ (\a~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:12:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \G0:11:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:12:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X5_Y2_N4
\G0:13:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:13:ALU1|OPER|Mux0~1_combout\ = ((\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (!\Step0|Mux1~0_combout\ & \G0:12:ALU1|ADDING|Cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Step0|Mux0~0_combout\,
	datac => \Step0|Mux1~0_combout\,
	datad => \G0:12:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:13:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(13),
	combout => \a~combout\(13));

-- Location: LC_X5_Y2_N2
\G0:13:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:13:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(13) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "af50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \a~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:13:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X5_Y2_N3
\G0:13:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:13:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:13:ALU1|OPER|Mux0~1_combout\) # (\G0:13:ALU1|OPER|Mux0~0_combout\))) # (!\G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:13:ALU1|OPER|Mux0~1_combout\ & \G0:13:ALU1|OPER|Mux0~0_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:13:ALU1|OPER|Mux0~1_combout\ $ (\G0:13:ALU1|OPER|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e992",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:13:ALU1|INVERTING_B|inToInvert~0_combout\,
	datab => \Step0|Mux0~0_combout\,
	datac => \G0:13:ALU1|OPER|Mux0~1_combout\,
	datad => \G0:13:ALU1|OPER|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:13:ALU1|OPER|Mux0~2_combout\);

-- Location: LC_X5_Y2_N6
\G0:13:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:13:ALU1|ADDING|Cout~0_combout\ = (\G0:12:ALU1|ADDING|Cout~0_combout\ & ((\G0:13:ALU1|INVERTING_B|inToInvert~0_combout\) # (\Step0|Mux2~0_combout\ $ (\a~combout\(13))))) # (!\G0:12:ALU1|ADDING|Cout~0_combout\ & 
-- (\G0:13:ALU1|INVERTING_B|inToInvert~0_combout\ & (\Step0|Mux2~0_combout\ $ (\a~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:12:ALU1|ADDING|Cout~0_combout\,
	datab => \G0:13:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \Step0|Mux2~0_combout\,
	datad => \a~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:13:ALU1|ADDING|Cout~0_combout\);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(14),
	combout => \b~combout\(14));

-- Location: PIN_19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(14),
	combout => \a~combout\(14));

-- Location: LC_X4_Y1_N9
\G0:14:ALU1|XOR2|out1~0\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|XOR2|out1~0_combout\ = \b~combout\(14) $ (\a~combout\(14) $ (((\Step0|Mux4~0_combout\ & !\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5a96",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(14),
	datab => \Step0|Mux4~0_combout\,
	datac => \a~combout\(14),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|XOR2|out1~0_combout\);

-- Location: LC_X4_Y1_N8
\G0:14:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|OPER|Mux0~0_combout\ = (\Step0|Mux0~0_combout\ & (\Step0|Mux1~0_combout\)) # (!\Step0|Mux0~0_combout\ & (\G0:14:ALU1|XOR2|out1~0_combout\ $ (((!\Step0|Mux1~0_combout\ & \G0:13:ALU1|ADDING|Cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cd98",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \Step0|Mux1~0_combout\,
	datac => \G0:13:ALU1|ADDING|Cout~0_combout\,
	datad => \G0:14:ALU1|XOR2|out1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|OPER|Mux0~0_combout\);

-- Location: LC_X3_Y1_N4
\G0:14:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(14) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X4_Y1_N2
\G0:14:ALU1|INVERTING_A|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|INVERTING_A|inToInvert~0_combout\ = (\a~combout\(14) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f03c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \a~combout\(14),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|INVERTING_A|inToInvert~0_combout\);

-- Location: LC_X4_Y1_N7
\G0:14:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|OPER|Mux0~1_combout\ = (\G0:14:ALU1|OPER|Mux0~0_combout\ & ((\G0:14:ALU1|INVERTING_B|inToInvert~0_combout\) # ((\G0:14:ALU1|INVERTING_A|inToInvert~0_combout\) # (!\Step0|Mux0~0_combout\)))) # (!\G0:14:ALU1|OPER|Mux0~0_combout\ & 
-- (\G0:14:ALU1|INVERTING_B|inToInvert~0_combout\ & (\Step0|Mux0~0_combout\ & \G0:14:ALU1|INVERTING_A|inToInvert~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ea8a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:14:ALU1|OPER|Mux0~0_combout\,
	datab => \G0:14:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:14:ALU1|INVERTING_A|inToInvert~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|OPER|Mux0~1_combout\);

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(15),
	combout => \a~combout\(15));

-- Location: LC_X4_Y1_N0
\G0:15:ALU1|OPER|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G0:15:ALU1|OPER|Mux0~0_combout\ = (\a~combout\(15) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f03c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \a~combout\(15),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:15:ALU1|OPER|Mux0~0_combout\);

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(15),
	combout => \b~combout\(15));

-- Location: LC_X3_Y1_N9
\G0:15:ALU1|INVERTING_B|inToInvert~0\ : maxv_lcell
-- Equation(s):
-- \G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ = \b~combout\(15) $ (((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9d62",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(0),
	datad => \b~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:15:ALU1|INVERTING_B|inToInvert~0_combout\);

-- Location: LC_X4_Y1_N1
\G0:14:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:14:ALU1|ADDING|Cout~0_combout\ = (\G0:13:ALU1|ADDING|Cout~0_combout\ & ((\G0:14:ALU1|INVERTING_B|inToInvert~0_combout\) # (\a~combout\(14) $ (\Step0|Mux2~0_combout\)))) # (!\G0:13:ALU1|ADDING|Cout~0_combout\ & 
-- (\G0:14:ALU1|INVERTING_B|inToInvert~0_combout\ & (\a~combout\(14) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G0:13:ALU1|ADDING|Cout~0_combout\,
	datab => \G0:14:ALU1|INVERTING_B|inToInvert~0_combout\,
	datac => \a~combout\(14),
	datad => \Step0|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:14:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X4_Y1_N3
\G0:15:ALU1|OPER|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G0:15:ALU1|OPER|Mux0~1_combout\ = (\Step0|Mux1~0_combout\ & (((\Step0|Mux0~0_combout\)))) # (!\Step0|Mux1~0_combout\ & (((!\Step0|Mux0~0_combout\ & \G0:14:ALU1|ADDING|Cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux1~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:14:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:15:ALU1|OPER|Mux0~1_combout\);

-- Location: LC_X4_Y1_N4
\G0:15:ALU1|OPER|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G0:15:ALU1|OPER|Mux0~2_combout\ = (\Step0|Mux0~0_combout\ & ((\G0:15:ALU1|OPER|Mux0~0_combout\ & ((\G0:15:ALU1|INVERTING_B|inToInvert~0_combout\) # (\G0:15:ALU1|OPER|Mux0~1_combout\))) # (!\G0:15:ALU1|OPER|Mux0~0_combout\ & 
-- (\G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ & \G0:15:ALU1|OPER|Mux0~1_combout\)))) # (!\Step0|Mux0~0_combout\ & (\G0:15:ALU1|OPER|Mux0~0_combout\ $ (\G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ $ (\G0:15:ALU1|OPER|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux0~0_combout\,
	datab => \G0:15:ALU1|OPER|Mux0~0_combout\,
	datac => \G0:15:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:15:ALU1|OPER|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:15:ALU1|OPER|Mux0~2_combout\);

-- Location: LC_X4_Y1_N5
\G0:15:ALU1|ADDING|Cout~0\ : maxv_lcell
-- Equation(s):
-- \G0:15:ALU1|ADDING|Cout~0_combout\ = (\G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ & ((\G0:14:ALU1|ADDING|Cout~0_combout\) # (\a~combout\(15) $ (\Step0|Mux2~0_combout\)))) # (!\G0:15:ALU1|INVERTING_B|inToInvert~0_combout\ & 
-- (\G0:14:ALU1|ADDING|Cout~0_combout\ & (\a~combout\(15) $ (\Step0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f660",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(15),
	datab => \Step0|Mux2~0_combout\,
	datac => \G0:15:ALU1|INVERTING_B|inToInvert~0_combout\,
	datad => \G0:14:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G0:15:ALU1|ADDING|Cout~0_combout\);

-- Location: LC_X4_Y1_N6
\overflow~0\ : maxv_lcell
-- Equation(s):
-- \overflow~0_combout\ = (!\Step0|Mux1~0_combout\ & (!\Step0|Mux0~0_combout\ & (\G0:14:ALU1|ADDING|Cout~0_combout\ $ (\G0:15:ALU1|ADDING|Cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0104",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Step0|Mux1~0_combout\,
	datab => \G0:14:ALU1|ADDING|Cout~0_combout\,
	datac => \Step0|Mux0~0_combout\,
	datad => \G0:15:ALU1|ADDING|Cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \overflow~0_combout\);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:0:ALU1|OPER|Mux0~4_combout\,
	oe => VCC,
	padio => ww_result(0));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:1:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(1));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:2:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(2));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:3:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(3));

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:4:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(4));

-- Location: PIN_2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:5:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(5));

-- Location: PIN_95,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:6:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(6));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:7:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(7));

-- Location: PIN_29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:8:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(8));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:9:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(9));

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:10:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(10));

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:11:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(11));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:12:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(12));

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:13:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(13));

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:14:ALU1|OPER|Mux0~1_combout\,
	oe => VCC,
	padio => ww_result(14));

-- Location: PIN_56,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G0:15:ALU1|OPER|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result(15));

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\overflow~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \overflow~0_combout\,
	oe => VCC,
	padio => ww_overflow);
END structure;


