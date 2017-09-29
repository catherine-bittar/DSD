-- this circuit implements th IBM RANDU version of a linear congruential generator

-- entity name: g21_RANDU

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 09/29-2017

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_RANDU is
	port (seed : in std_logic_vector(31 downto 0);
	      rand : out std_logic_vector(31 downto 0));
end g21_RANDU;

architecture RANDU of g21_RANDU is
	signal A_lshift16: std_logic_vector(31 downto 0);
	signal A_lshift1: std_logic_vector(31 downto 0);
	signal out1: std_logic_vector(31 downto 0);
	signal out2: std_logic_vector(31 downto 0);
	signal GND: std_logic_vector(31 downto 0);

	component add_sub
		port (dataa : IN STD_LOGIC_VECTOR (31 downto 0);
				datab : IN STD_LOGIC_VECTOR (31 downto	0);
				result : OUT STD_LOGIC_VECTOR (31 downto 0) ) ;
	end component;
	
begin 
	GND <= (others => '0');
	A_lshift16 <= (seed(15 downto 0) & GND(15 downto 0));
	A_lshift1 <= (seed(30 downto 0) & GND(0));
	
   A1: add_sub port map (dataa => A_lshift16, datab => A_lshift1, result => out1);
	A2: add_sub port map (dataa => out1, datab => seed, result => out2);
	
	rand <= (GND(0) & out2(30 downto 0));
end architecture RANDU;
	
	
	