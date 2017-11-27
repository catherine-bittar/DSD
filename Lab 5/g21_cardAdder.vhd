-- this circuit implements a odified version of our rules module that we use to add values of the two first cards

-- entity name: g21_rules

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-23-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g21_cardAdder is
	port(play_pile_top_card: in std_logic_vector(5 downto 0); -- card to add to out hand
	     card_to_play      : in std_logic_vector(5 downto 0); -- sum of cards we already have
		  total_value       : out unsigned(5 downto 0));
end g21_cardAdder;	

architecture game_rules of g21_cardAdder is
	signal face_top: std_logic_vector(3 downto 0); -- numerical face value
	signal suit_top: std_logic_vector(2 downto 0);
	signal face_card: std_logic_vector(3 downto 0);
	signal suit_card: std_logic_vector(2 downto 0);
	
	signal top_val: unsigned(4 downto 0); -- integer value of card to add (face_top + 1)
	signal card_val: unsigned(4 downto 0); -- truncated value of sum
	signal card_val_int: unsigned (4 downto 0);
	signal face_top_int : unsigned(3 downto 0);
	signal face_card_int: unsigned(3 downto 0);
	signal one_int : unsigned(1 downto 0);
	signal new_ace: std_logic;

		
		component g21_Modulo_13 -- begin description of modulo 13 component
		port (A     : in std_logic_vector(5 downto 0) ;
			   floor : out std_logic_vector(2 downto 0); 
			   modout: out std_logic_vector(3 downto 0) );
	   end component;
		
		component adder_6 
		port (dataa		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			   datab		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			   result		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
		end component;

begin-- use g21_Modulo_13 component to assign signal values

	modulo_top: g21_Modulo_13 port map (A => play_pile_top_card, floor => suit_top, modout => face_top);
	modulo_card: g21_Modulo_13 port map (A => card_to_play, floor => suit_card, modout => face_card);
	
	face_top_int <= unsigned(face_top); --convert to integer
	face_card_int <= unsigned(face_card);
	
	one_int <= "01"; -- create a value of 1

	
	card_val_assign: process(face_top, top_val, card_val_int, face_top_int, one_int)
	begin
	
		new_ace <= '0';
		top_val <= "00000";
		card_val <= "00000";
	
		if (face_top >= "0001" and face_top <= "1001") then -- if mod was 1-9 need to add 1 for actual value
			top_val <= '0' & (face_top_int + one_int);
			
		elsif (face_top >= "1010") then -- if mod was 10 or more, its jack, queen or king so need actual value 10
			top_val <= '0' & "1010";
			
		elsif (face_top = "0000") then -- if its an ace, decide which value
			top_val <= '0' & "1011";
			new_ace <= '1';
		end if;
		
		if (face_card >= "0001" and face_card <= "1001") then -- if mod was 1-9 need to add 1 for actual value
			card_val <= '0' & (face_card_int + one_int);
		elsif (face_card >= "1010") then -- if mod was 10 or more, its jack, queen or king so need actual value 10
			card_val <= '0' & "1010";
		elsif (face_card = "0000" and new_ace = '0') then -- if its an ace, decide which value
			card_val <= '0' & "1011";
			new_ace <= '1';
		elsif (face_card = "0000" and new_ace = '1') then -- if its an ace, decide which value
			card_val <= '0' & "0001";
			new_ace <= '1';
		end if;
		
		total_value <= new_ace & (top_val + card_val);
			

		
	end process;
	
end architecture;		