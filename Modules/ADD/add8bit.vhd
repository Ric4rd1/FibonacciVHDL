-- megafunction wizard: %PARALLEL_ADD%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: parallel_add 

-- ============================================================
-- File Name: add8bit.vhd
-- Megafunction Name(s):
-- 			parallel_add
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 21.1.0 Build 842 10/21/2021 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2021  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY add8bit IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END add8bit;


ARCHITECTURE SYN OF add8bit IS

--	type ALTERA_MF_LOGIC_2D is array (NATURAL RANGE <>, NATURAL RANGE <>) of STD_LOGIC;

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL sub_wire1	: ALTERA_MF_LOGIC_2D (1 DOWNTO 0, 7 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
	sub_wire2    <= data0x(7 DOWNTO 0);
	sub_wire0    <= data1x(7 DOWNTO 0);
	sub_wire1(1, 0)    <= sub_wire0(0);
	sub_wire1(1, 1)    <= sub_wire0(1);
	sub_wire1(1, 2)    <= sub_wire0(2);
	sub_wire1(1, 3)    <= sub_wire0(3);
	sub_wire1(1, 4)    <= sub_wire0(4);
	sub_wire1(1, 5)    <= sub_wire0(5);
	sub_wire1(1, 6)    <= sub_wire0(6);
	sub_wire1(1, 7)    <= sub_wire0(7);
	sub_wire1(0, 0)    <= sub_wire2(0);
	sub_wire1(0, 1)    <= sub_wire2(1);
	sub_wire1(0, 2)    <= sub_wire2(2);
	sub_wire1(0, 3)    <= sub_wire2(3);
	sub_wire1(0, 4)    <= sub_wire2(4);
	sub_wire1(0, 5)    <= sub_wire2(5);
	sub_wire1(0, 6)    <= sub_wire2(6);
	sub_wire1(0, 7)    <= sub_wire2(7);
	result    <= sub_wire3(7 DOWNTO 0);

	parallel_add_component : parallel_add
	GENERIC MAP (
		msw_subtract => "NO",
		pipeline => 0,
		representation => "UNSIGNED",
		result_alignment => "LSB",
		shift => 0,
		size => 2,
		width => 8,
		widthr => 8,
		lpm_type => "parallel_add"
	)
	PORT MAP (
		data => sub_wire1,
		result => sub_wire3
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX 10"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: MSW_SUBTRACT STRING "NO"
-- Retrieval info: CONSTANT: PIPELINE NUMERIC "0"
-- Retrieval info: CONSTANT: REPRESENTATION STRING "UNSIGNED"
-- Retrieval info: CONSTANT: RESULT_ALIGNMENT STRING "LSB"
-- Retrieval info: CONSTANT: SHIFT NUMERIC "0"
-- Retrieval info: CONSTANT: SIZE NUMERIC "2"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "8"
-- Retrieval info: CONSTANT: WIDTHR NUMERIC "8"
-- Retrieval info: USED_PORT: data0x 0 0 8 0 INPUT NODEFVAL "data0x[7..0]"
-- Retrieval info: USED_PORT: data1x 0 0 8 0 INPUT NODEFVAL "data1x[7..0]"
-- Retrieval info: USED_PORT: result 0 0 8 0 OUTPUT NODEFVAL "result[7..0]"
-- Retrieval info: CONNECT: @data 1 0 8 0 data0x 0 0 8 0
-- Retrieval info: CONNECT: @data 1 1 8 0 data1x 0 0 8 0
-- Retrieval info: CONNECT: result 0 0 8 0 @result 0 0 8 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL add8bit.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL add8bit.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL add8bit.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL add8bit.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL add8bit_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
