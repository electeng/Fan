-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "08/04/2016 18:25:31"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	testing_counter IS
    PORT (
	cnt : OUT std_logic_vector(3 DOWNTO 0);
	clk : IN std_logic;
	clear : IN std_logic;
	enable : IN std_logic
	);
END testing_counter;

-- Design Ports Information
-- cnt[3]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[2]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[1]	=>  Location: PIN_P5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[0]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF testing_counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cnt[3]~output_o\ : std_logic;
SIGNAL \cnt[2]~output_o\ : std_logic;
SIGNAL \cnt[1]~output_o\ : std_logic;
SIGNAL \cnt[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \inst|temp~5_combout\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \inst|temp[3]~2_combout\ : std_logic;
SIGNAL \inst|temp~4_combout\ : std_logic;
SIGNAL \inst|temp~3_combout\ : std_logic;
SIGNAL \inst|temp~0_combout\ : std_logic;
SIGNAL \inst|temp~1_combout\ : std_logic;
SIGNAL \inst|temp\ : std_logic_vector(3 DOWNTO 0);

BEGIN

cnt <= ww_cnt;
ww_clk <= clk;
ww_clear <= clear;
ww_enable <= enable;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X0_Y7_N2
\cnt[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|temp\(3),
	devoe => ww_devoe,
	o => \cnt[3]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\cnt[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|temp\(2),
	devoe => ww_devoe,
	o => \cnt[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\cnt[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|temp\(1),
	devoe => ww_devoe,
	o => \cnt[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\cnt[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|temp\(0),
	devoe => ww_devoe,
	o => \cnt[0]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y8_N15
\clear~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: LCCOMB_X1_Y8_N10
\inst|temp~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp~5_combout\ = (!\inst|temp\(0) & !\clear~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|temp\(0),
	datad => \clear~input_o\,
	combout => \inst|temp~5_combout\);

-- Location: IOIBUF_X0_Y8_N1
\enable~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: LCCOMB_X1_Y8_N14
\inst|temp[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp[3]~2_combout\ = (\enable~input_o\) # (\clear~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \enable~input_o\,
	datad => \clear~input_o\,
	combout => \inst|temp[3]~2_combout\);

-- Location: FF_X1_Y8_N11
\inst|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|temp~5_combout\,
	ena => \inst|temp[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|temp\(0));

-- Location: LCCOMB_X1_Y8_N28
\inst|temp~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp~4_combout\ = (!\clear~input_o\ & (\inst|temp\(1) $ (\inst|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~input_o\,
	datac => \inst|temp\(1),
	datad => \inst|temp\(0),
	combout => \inst|temp~4_combout\);

-- Location: FF_X1_Y8_N29
\inst|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|temp~4_combout\,
	ena => \inst|temp[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|temp\(1));

-- Location: LCCOMB_X1_Y8_N22
\inst|temp~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp~3_combout\ = (!\clear~input_o\ & (\inst|temp\(2) $ (((\inst|temp\(1) & \inst|temp\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \inst|temp\(1),
	datac => \inst|temp\(2),
	datad => \inst|temp\(0),
	combout => \inst|temp~3_combout\);

-- Location: FF_X1_Y8_N23
\inst|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|temp~3_combout\,
	ena => \inst|temp[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|temp\(2));

-- Location: LCCOMB_X1_Y8_N12
\inst|temp~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp~0_combout\ = (!\inst|temp\(0)) # (!\inst|temp\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|temp\(2),
	datad => \inst|temp\(0),
	combout => \inst|temp~0_combout\);

-- Location: LCCOMB_X1_Y8_N24
\inst|temp~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|temp~1_combout\ = (!\clear~input_o\ & (\inst|temp\(3) $ (((\inst|temp\(1) & !\inst|temp~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \inst|temp\(1),
	datac => \inst|temp\(3),
	datad => \inst|temp~0_combout\,
	combout => \inst|temp~1_combout\);

-- Location: FF_X1_Y8_N25
\inst|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|temp~1_combout\,
	ena => \inst|temp[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|temp\(3));

ww_cnt(3) <= \cnt[3]~output_o\;

ww_cnt(2) <= \cnt[2]~output_o\;

ww_cnt(1) <= \cnt[1]~output_o\;

ww_cnt(0) <= \cnt[0]~output_o\;
END structure;


