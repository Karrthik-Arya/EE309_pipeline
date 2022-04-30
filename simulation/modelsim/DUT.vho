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

-- DATE "04/30/2022 17:24:50"

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
SIGNAL \ir_instance|ir_store[1][5]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[2][5]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[3][5]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[4][5]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[5][5]~regout\ : std_logic;
SIGNAL \ir_instance|Equal0~0\ : std_logic;
SIGNAL \ir_instance|ir_store[1][6]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[2][6]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[3][6]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[4][6]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[5][6]~regout\ : std_logic;
SIGNAL \ir_instance|ir_store[0][12]~0\ : std_logic;
SIGNAL \ir_instance|ir_store[0][15]~regout\ : std_logic;
SIGNAL \pc_instance|Equal0~0_combout\ : std_logic;
SIGNAL \pc_instance|pc[1]~1\ : std_logic;
SIGNAL \pc_instance|pc[1]~1COUT1_10\ : std_logic;
SIGNAL \pc_instance|pc[2]~3\ : std_logic;
SIGNAL \pc_instance|pc[2]~3COUT1_11\ : std_logic;
SIGNAL \pc_instance|pc[3]~5\ : std_logic;
SIGNAL \pc_instance|pc[3]~5COUT1_12\ : std_logic;
SIGNAL \ir_instance|ir_store[0][12]~regout\ : std_logic;
SIGNAL \mem_instance|mem_ins~0\ : std_logic;
SIGNAL \mem_instance|mem_ins~1\ : std_logic;
SIGNAL \input_vector~combout\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \pc_instance|pc\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

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

-- Location: LC_X1_Y8_N4
\ir_instance|ir_store[1][5]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[1][5]~regout\ = DFFEAS(GND, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[0][15]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[0][15]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[1][5]~regout\);

-- Location: LC_X1_Y8_N2
\ir_instance|ir_store[2][5]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[2][5]~regout\ = DFFEAS(GND, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[1][5]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[1][5]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[2][5]~regout\);

-- Location: LC_X2_Y8_N6
\ir_instance|ir_store[3][5]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[3][5]~regout\ = DFFEAS((((\ir_instance|ir_store[2][5]~regout\))), GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datad => \ir_instance|ir_store[2][5]~regout\,
	aclr => GND,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[3][5]~regout\);

-- Location: LC_X2_Y8_N7
\ir_instance|ir_store[4][5]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[4][5]~regout\ = DFFEAS(GND, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[3][5]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[3][5]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[4][5]~regout\);

-- Location: LC_X2_Y8_N3
\ir_instance|ir_store[5][5]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[0][12]~0\ = (\ir_instance|ir_store[5][6]~regout\ & (!G1_ir_store[5][5] & ((!\ir_instance|ir_store[0][12]~regout\) # (!\ir_instance|ir_store[0][15]~regout\)))) # (!\ir_instance|ir_store[5][6]~regout\ & 
-- (((!\ir_instance|ir_store[0][12]~regout\)) # (!\ir_instance|ir_store[0][15]~regout\)))
-- \ir_instance|ir_store[5][5]~regout\ = DFFEAS(\ir_instance|ir_store[0][12]~0\, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[4][5]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "135f",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	dataa => \ir_instance|ir_store[5][6]~regout\,
	datab => \ir_instance|ir_store[0][15]~regout\,
	datac => \ir_instance|ir_store[4][5]~regout\,
	datad => \ir_instance|ir_store[0][12]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ir_instance|ir_store[0][12]~0\,
	regout => \ir_instance|ir_store[5][5]~regout\);

-- Location: LC_X2_Y8_N4
\ir_instance|ir_store[5][6]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|Equal0~0\ = (((!\ir_instance|ir_store[5][5]~regout\) # (!G1_ir_store[5][6])))
-- \ir_instance|ir_store[5][6]~regout\ = DFFEAS(\ir_instance|Equal0~0\, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[4][6]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fff",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[4][6]~regout\,
	datad => \ir_instance|ir_store[5][5]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \ir_instance|Equal0~0\,
	regout => \ir_instance|ir_store[5][6]~regout\);

-- Location: LC_X2_Y8_N0
\ir_instance|ir_store[1][6]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[1][6]~regout\ = DFFEAS((((\ir_instance|ir_store[0][12]~regout\))), GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datad => \ir_instance|ir_store[0][12]~regout\,
	aclr => GND,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[1][6]~regout\);

-- Location: LC_X2_Y8_N8
\ir_instance|ir_store[2][6]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[2][6]~regout\ = DFFEAS(GND, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[1][6]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[1][6]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[2][6]~regout\);

-- Location: LC_X2_Y8_N9
\ir_instance|ir_store[3][6]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[3][6]~regout\ = DFFEAS((((\ir_instance|ir_store[2][6]~regout\))), GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datad => \ir_instance|ir_store[2][6]~regout\,
	aclr => GND,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[3][6]~regout\);

-- Location: LC_X2_Y8_N5
\ir_instance|ir_store[4][6]\ : maxv_lcell
-- Equation(s):
-- \ir_instance|ir_store[4][6]~regout\ = DFFEAS(GND, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|Equal0~0\, \ir_instance|ir_store[3][6]~regout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datac => \ir_instance|ir_store[3][6]~regout\,
	aclr => GND,
	sload => VCC,
	ena => \ir_instance|Equal0~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ir_instance|ir_store[4][6]~regout\);

-- Location: LC_X2_Y8_N2
\ir_instance|ir_store[0][15]\ : maxv_lcell
-- Equation(s):
-- \mem_instance|mem_ins~1\ = ((\pc_instance|pc\(0) & ((\mem_instance|mem_ins~0\))))
-- \ir_instance|ir_store[0][15]~regout\ = DFFEAS(\mem_instance|mem_ins~1\, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|ir_store[0][12]~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	datab => \pc_instance|pc\(0),
	datad => \mem_instance|mem_ins~0\,
	aclr => GND,
	ena => \ir_instance|ir_store[0][12]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \mem_instance|mem_ins~1\,
	regout => \ir_instance|ir_store[0][15]~regout\);

-- Location: LC_X3_Y8_N9
\pc_instance|Equal0~0\ : maxv_lcell
-- Equation(s):
-- \pc_instance|Equal0~0_combout\ = (((!\ir_instance|ir_store[0][15]~regout\) # (!\ir_instance|ir_store[0][12]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \ir_instance|ir_store[0][12]~regout\,
	datad => \ir_instance|ir_store[0][15]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \pc_instance|Equal0~0_combout\);

-- Location: LC_X3_Y8_N0
\pc_instance|pc[1]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(1) = DFFEAS(\pc_instance|pc\(0) $ ((\pc_instance|pc\(1))), GLOBAL(\input_vector~combout\(0)), VCC, , \pc_instance|Equal0~0_combout\, , , , )
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
	ena => \pc_instance|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(1),
	cout0 => \pc_instance|pc[1]~1\,
	cout1 => \pc_instance|pc[1]~1COUT1_10\);

-- Location: LC_X3_Y8_N1
\pc_instance|pc[2]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(2) = DFFEAS((\pc_instance|pc\(2) $ ((\pc_instance|pc[1]~1\))), GLOBAL(\input_vector~combout\(0)), VCC, , \pc_instance|Equal0~0_combout\, , , , )
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
	ena => \pc_instance|Equal0~0_combout\,
	cin0 => \pc_instance|pc[1]~1\,
	cin1 => \pc_instance|pc[1]~1COUT1_10\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(2),
	cout0 => \pc_instance|pc[2]~3\,
	cout1 => \pc_instance|pc[2]~3COUT1_11\);

-- Location: LC_X3_Y8_N2
\pc_instance|pc[3]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(3) = DFFEAS((\pc_instance|pc\(3) $ ((!\pc_instance|pc[2]~3\))), GLOBAL(\input_vector~combout\(0)), VCC, , \pc_instance|Equal0~0_combout\, , , , )
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
	ena => \pc_instance|Equal0~0_combout\,
	cin0 => \pc_instance|pc[2]~3\,
	cin1 => \pc_instance|pc[2]~3COUT1_11\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(3),
	cout0 => \pc_instance|pc[3]~5\,
	cout1 => \pc_instance|pc[3]~5COUT1_12\);

-- Location: LC_X3_Y8_N3
\pc_instance|pc[4]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(4) = DFFEAS(((\pc_instance|pc[3]~5\ $ (\pc_instance|pc\(4)))), GLOBAL(\input_vector~combout\(0)), VCC, , \pc_instance|Equal0~0_combout\, , , , )

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
	ena => \pc_instance|Equal0~0_combout\,
	cin0 => \pc_instance|pc[3]~5\,
	cin1 => \pc_instance|pc[3]~5COUT1_12\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(4));

-- Location: LC_X2_Y8_N1
\ir_instance|ir_store[0][12]\ : maxv_lcell
-- Equation(s):
-- \mem_instance|mem_ins~0\ = (!\pc_instance|pc\(1) & (!\pc_instance|pc\(3) & (!\pc_instance|pc\(4) & !\pc_instance|pc\(2))))
-- \ir_instance|ir_store[0][12]~regout\ = DFFEAS(\mem_instance|mem_ins~0\, GLOBAL(\input_vector~combout\(0)), VCC, , \ir_instance|ir_store[0][12]~0\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	dataa => \pc_instance|pc\(1),
	datab => \pc_instance|pc\(3),
	datac => \pc_instance|pc\(4),
	datad => \pc_instance|pc\(2),
	aclr => GND,
	ena => \ir_instance|ir_store[0][12]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \mem_instance|mem_ins~0\,
	regout => \ir_instance|ir_store[0][12]~regout\);

-- Location: LC_X3_Y8_N8
\pc_instance|pc[0]\ : maxv_lcell
-- Equation(s):
-- \pc_instance|pc\(0) = DFFEAS((\pc_instance|pc\(0) $ (((!\ir_instance|ir_store[0][15]~regout\) # (!\ir_instance|ir_store[0][12]~regout\)))), GLOBAL(\input_vector~combout\(0)), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a05f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \input_vector~combout\(0),
	dataa => \ir_instance|ir_store[0][12]~regout\,
	datac => \ir_instance|ir_store[0][15]~regout\,
	datad => \pc_instance|pc\(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \pc_instance|pc\(0));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \mem_instance|mem_ins~0\,
	oe => VCC,
	padio => ww_output_vector(0));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \mem_instance|mem_ins~0\,
	oe => VCC,
	padio => ww_output_vector(1));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \mem_instance|mem_ins~0\,
	oe => VCC,
	padio => ww_output_vector(2));

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \mem_instance|mem_ins~1\,
	oe => VCC,
	padio => ww_output_vector(3));
END structure;


