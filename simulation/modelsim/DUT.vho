-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "04/30/2022 01:47:07"

-- 
-- Device: Altera 5M2210ZF256C4 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	DUT IS
    PORT (
	input_vector : IN std_logic_vector(0 DOWNTO 0);
	output_vector : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END DUT;

-- Design Ports Information


ARCHITECTURE structure OF DUT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_vector : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_output_vector : std_logic_vector(3 DOWNTO 0);
SIGNAL \pc_instance|pc[1]~1\ : std_logic;
SIGNAL \pc_instance|pc[1]~1COUT1_10\ : std_logic;
SIGNAL \pc_instance|pc[2]~3\ : std_logic;
SIGNAL \pc_instance|pc[2]~3COUT1_11\ : std_logic;
SIGNAL \pc_instance|pc[3]~5\ : std_logic;
SIGNAL \pc_instance|pc[3]~5COUT1_12\ : std_logic;
SIGNAL \mem_instance|mem_ins~0_combout\ : std_logic;
SIGNAL \mem_instance|mem_ins~1_combout\ : std_logic;
SIGNAL \input_vector~combout\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \pc_instance|pc\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \mem_instance|ALT_INV_mem_ins~1_combout\ : std_logic;

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\mem_instance|ALT_INV_mem_ins~1_combout\ <= NOT \mem_instance|mem_ins~1_combout\;

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(0),
	combout => \input_vector~combout\(0));

-- Location: LC_X1_Y13_N8
\pc_instance|pc[0]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(0) = DFFEAS((((!\pc_instance|pc\(0)))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datad => \pc_instance|pc\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(0));

-- Location: LC_X1_Y13_N0
\pc_instance|pc[1]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(1) = DFFEAS(\pc_instance|pc\(0) $ ((\pc_instance|pc\(1))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )
-- \pc_instance|pc[1]~1\ = CARRY((\pc_instance|pc\(0) & (\pc_instance|pc\(1))))
-- \pc_instance|pc[1]~1COUT1_10\ = CARRY((\pc_instance|pc\(0) & (\pc_instance|pc\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	dataa => \pc_instance|pc\(0),
	datab => \pc_instance|pc\(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(1),
	cout0 => \pc_instance|pc[1]~1\,
	cout1 => \pc_instance|pc[1]~1COUT1_10\);

-- Location: LC_X1_Y13_N1
\pc_instance|pc[2]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(2) = DFFEAS((\pc_instance|pc\(2) $ ((\pc_instance|pc[1]~1\))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )
-- \pc_instance|pc[2]~3\ = CARRY(((!\pc_instance|pc[1]~1\) # (!\pc_instance|pc\(2))))
-- \pc_instance|pc[2]~3COUT1_11\ = CARRY(((!\pc_instance|pc[1]~1COUT1_10\) # (!\pc_instance|pc\(2))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datab => \pc_instance|pc\(2),
	aclr => GND,
	cin0 => \pc_instance|pc[1]~1\,
	cin1 => \pc_instance|pc[1]~1COUT1_10\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(2),
	cout0 => \pc_instance|pc[2]~3\,
	cout1 => \pc_instance|pc[2]~3COUT1_11\);

-- Location: LC_X1_Y13_N2
\pc_instance|pc[3]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(3) = DFFEAS((\pc_instance|pc\(3) $ ((!\pc_instance|pc[2]~3\))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )
-- \pc_instance|pc[3]~5\ = CARRY(((\pc_instance|pc\(3) & !\pc_instance|pc[2]~3\)))
-- \pc_instance|pc[3]~5COUT1_12\ = CARRY(((\pc_instance|pc\(3) & !\pc_instance|pc[2]~3COUT1_11\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datab => \pc_instance|pc\(3),
	aclr => GND,
	cin0 => \pc_instance|pc[2]~3\,
	cin1 => \pc_instance|pc[2]~3COUT1_11\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(3),
	cout0 => \pc_instance|pc[3]~5\,
	cout1 => \pc_instance|pc[3]~5COUT1_12\);

-- Location: LC_X1_Y13_N3
\pc_instance|pc[4]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(4) = DFFEAS(((\pc_instance|pc[3]~5\ $ (\pc_instance|pc\(4)))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datad => \pc_instance|pc\(4),
	aclr => GND,
	cin0 => \pc_instance|pc[3]~5\,
	cin1 => \pc_instance|pc[3]~5COUT1_12\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(4));

-- Location: LC_X1_Y13_N7
\mem_instance|mem_ins~0\ : maxv_lcell
-- Equation(s):
-- \mem_instance|mem_ins~0_combout\ = (\pc_instance|pc\(2)) # ((\pc_instance|pc\(3)) # ((\pc_instance|pc\(1) & \pc_instance|pc\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pc_instance|pc\(1),
	datab => \pc_instance|pc\(0),
	datac => \pc_instance|pc\(2),
	datad => \pc_instance|pc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \mem_instance|mem_ins~0_combout\);

-- Location: LC_X1_Y13_N9
\mem_instance|mem_ins~1\ : maxv_lcell
-- Equation(s):
-- \mem_instance|mem_ins~1_combout\ = (\pc_instance|pc\(4)) # (((\mem_instance|mem_ins~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fafa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pc_instance|pc\(4),
	datac => \mem_instance|mem_ins~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \mem_instance|mem_ins~1_combout\);

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \mem_instance|ALT_INV_mem_ins~1_combout\,
	oe => VCC,
	padio => ww_output_vector(0));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_output_vector(1));

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_output_vector(2));

-- Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_output_vector(3));
END structure;


