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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/05/2022 19:38:43"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          alu
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_vhd_vec_tst IS
END alu_vhd_vec_tst;
ARCHITECTURE alu_arch OF alu_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL AInvert : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL BInvert : STD_LOGIC;
SIGNAL CarryIn : STD_LOGIC;
SIGNAL CarryOut : STD_LOGIC;
SIGNAL Operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Result : STD_LOGIC;
COMPONENT alu
	PORT (
	a : IN STD_LOGIC;
	AInvert : IN STD_LOGIC;
	b : IN STD_LOGIC;
	BInvert : IN STD_LOGIC;
	CarryIn : IN STD_LOGIC;
	CarryOut : OUT STD_LOGIC;
	Operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Result : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : alu
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	AInvert => AInvert,
	b => b,
	BInvert => BInvert,
	CarryIn => CarryIn,
	CarryOut => CarryOut,
	Operation => Operation,
	Result => Result
	);
-- Operation[1]
t_prcs_Operation_1: PROCESS
BEGIN
	Operation(1) <= '0';
WAIT;
END PROCESS t_prcs_Operation_1;
-- Operation[0]
t_prcs_Operation_0: PROCESS
BEGIN
	Operation(0) <= '0';
WAIT;
END PROCESS t_prcs_Operation_0;

-- AInvert
t_prcs_AInvert: PROCESS
BEGIN
	AInvert <= '1';
WAIT;
END PROCESS t_prcs_AInvert;

-- BInvert
t_prcs_BInvert: PROCESS
BEGIN
	BInvert <= '1';
WAIT;
END PROCESS t_prcs_BInvert;

-- CarryIn
t_prcs_CarryIn: PROCESS
BEGIN
	CarryIn <= '0';
WAIT;
END PROCESS t_prcs_CarryIn;

-- a
t_prcs_a: PROCESS
BEGIN
LOOP
	a <= '0';
	WAIT FOR 80000 ps;
	a <= '1';
	WAIT FOR 80000 ps;
	IF (NOW >= 160000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a;

-- b
t_prcs_b: PROCESS
BEGIN
LOOP
	b <= '0';
	WAIT FOR 40000 ps;
	b <= '1';
	WAIT FOR 40000 ps;
	IF (NOW >= 160000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_b;
END alu_arch;
