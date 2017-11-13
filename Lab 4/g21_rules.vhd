-- this circuit implements the rules of the '21' game as decribed in the Lab 4 instructions

-- entity name: g21_rules

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-13-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_rules is
	port(play_pile_top_card: in std_logic_vector(5 downto 0);
	     card_to_play      : in std_logic_vector(5 downto 0);
        legal_play        : out std_logic);
end g21_rules;	

architecture game_rules of g21_rules is
		signal face_top: std_logic_vector(3 downto 0);
		signal suit_top: std_logic_vector(2 downto 0); 
		signal face_card: std_logic_vector(3 downto 0);
		signal suit_card: std_logic_vector(2 downto 0); 
		signal top_val: std_logic_vector(3 downto 0); 
		signal card_val: std_logic_vector(3 downto 0);
		signal tot_val: std_logic_vector(3 downto 0);
		
		component g21_Modulo_13 -- begin description of modulo 13 component
		port (A     : in std_logic_vector(5 downto 0) ;
			   floor : out std_logic_vector(2 downto 0); -- useless?
			   modout: out std_logic_vector(3 downto 0) );
	   end component;

begin-- use g21_Modulo_13 component to assign signal values

	modulo_top: g21_Modulo_13 port map (A => play_pile_top_card, floor => suit_top, modout => face_top);
	modulo_card: g21_Modulo_13 port map (A => card_to_play, floor => suit_card, modout => face_card);
	
	card_val_assign: process(face_top, face_card, top_val, card_val, tot_val)
	begin
	
	if (face_top >= "0010" and face_top <= "1010") then
		top_val <= face_top;
	elsif (face_top >= "1011") then
		top_val <= "1010";
	end if;
		