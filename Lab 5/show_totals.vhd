-- this circuit translates the total value into decimal to be shown on the LED output to be used in Lab 5

-- entity name: show_totals

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-28-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity show_totals is
	port( total_player 		: in std_logic_vector (4 downto 0);
			total_dealer 		: in std_logic_vector (4 downto 0);
			
			dealer_total_dec	: out std_logic_vector (6 downto 0);
			dealer_total_unit	: out std_logic_vector (6 downto 0);
			player_total_dec	: out std_logic_vector (6 downto 0);
			player_total_unit	: out std_logic_vector (6 downto 0));
		
	end show_totals;

architecture get_totals of show_totals is

	signal dealer_dec  : std_logic_vector(4 downto 0);
	signal dealer_unit : std_logic_vector(3 downto 0);
	signal player_dec  : std_logic_vector(4 downto 0);
	signal player_unit : std_logic_vector(3 downto 0);
	signal mode_0        : std_logic;
	
	component g21_7_segment_decoder
		port (code : in std_logic_vector(3 downto 0); -- define input port code (4-bit)
				mode : in std_logic; -- define input port mode (1-bit)
				segments_out : out std_logic_vector(6 downto 0)); -- define output port segments_out (7-bit)
		end component;

begin
	
	mode_0 <= '0';
	dealer_dec <= std_logic_vector(unsigned(total_dealer) / "1010"); 
	dealer_unit <= std_logic_vector(unsigned(total_dealer) rem "1010");
	player_dec <= std_logic_vector(unsigned(total_player) / "1010"); 
	player_unit <= std_logic_vector(unsigned(total_player) rem "1010"); 
	
	A0: g21_7_segment_decoder port map (code => dealer_dec(3 downto 0), mode => mode_0, segments_out => dealer_total_dec);
	A1: g21_7_segment_decoder port map (code => dealer_unit, mode => mode_0, segments_out => dealer_total_unit);
	A2: g21_7_segment_decoder port map (code => player_dec(3 downto 0), mode => mode_0, segments_out => player_total_dec);
	A3: g21_7_segment_decoder port map (code => player_unit, mode => mode_0, segments_out => player_total_unit);
	
 end architecture;

	
	
