-- this circuit implements th IBM RANDU version of a linear congruential generator

-- entity name: g21_RANDU

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 09/29-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_RANDU is -- begin description of g21_RANDU entity
	port (seed : in std_logic_vector(31 downto 0); -- define input port seed (32-bit)
	      rand : out std_logic_vector(31 downto 0)); -- define output port rand (32 bit)
end g21_RANDU;

architecture RANDU of g21_RANDU is -- begin description of g21_RANDU architecture
	signal A_lshift16: std_logic_vector(31 downto 0); -- input A times 2^16, where A = seed
	signal A_lshift1: std_logic_vector(31 downto 0); -- input A times 2^1
	signal out1: std_logic_vector(31 downto 0); -- output of the first adder = A_lshift16 + A_lshift1 
	signal out2: std_logic_vector(31 downto 0); -- output of the second adder = out1 + A
	signal GND: std_logic_vector(31 downto 0); -- ground signal vector used for shifting

	component add_sub -- begin description of lpm add_sub component
		port (dataa : IN STD_LOGIC_VECTOR (31 downto 0); -- dataa, datab and result are all 32-bit
				datab : IN STD_LOGIC_VECTOR (31 downto	0);
				result : OUT STD_LOGIC_VECTOR (31 downto 0) ) ;
	end component;
	
begin 
	GND <= (others => '0'); -- set value 0 to GND signal vector
	A_lshift16 <= (seed(15 downto 0) & GND(15 downto 0)); -- shift A left by 16
	A_lshift1 <= (seed(30 downto 0) & GND(0)); -- shift A left by 1
	
   A1: add_sub port map (dataa => A_lshift16, datab => A_lshift1, result => out1); -- define inputs abd outputs for adder A1
	A2: add_sub port map (dataa => out1, datab => seed, result => out2); -- define inputs abd outputs for adder A2
	
	rand <= (GND(0) & out2(30 downto 0)); -- zero 31st bit of out2 and connect to output rand
end architecture RANDU;
	
	
	