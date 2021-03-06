-- this circuit implements the rules of the '21' game as decribed in the Lab 4 instructions

-- entity name: g21_rules

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-13-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g21_rules_2 is
	port(card_to_add		  : in std_logic_vector(5 downto 0); -- card to add to out hand
	     current_hand      : in std_logic_vector(5 downto 0); -- sum of cards we already have
        legal_play        : out std_logic;
		  total_value       : out unsigned(5 downto 0));
end g21_rules_2;

architecture game_rules_2 of g21_rules_2 is	

	signal hand : unsigned(4 downto 0);
	signal card : std_logic_vector(3 downto 0);
	signal card_int : unsigned (3 downto 0);
	signal card_value : unsigned(3 downto 0);
	signal suit : std_logic_vector(2 downto 0);
	
	signal ace_in_hand : std_logic;
	signal ace_in_total : std_logic;
	
	signal fake_add : unsigned(4 downto 0);
	signal try_add : unsigned (4 downto 0);
	signal total_value_int : unsigned (4 downto 0);
	
	signal one : unsigned(1 downto 0);
	signal ten : unsigned (3 downto 0);
	signal eleven : unsigned(3 downto 0);
	
	component g21_Modulo_13 -- begin description of modulo 13 component
		port (A     : in std_logic_vector(5 downto 0) ;
			   floor : out std_logic_vector(2 downto 0); 
			   modout: out std_logic_vector(3 downto 0) );
	 end component;

begin
	
	modulo_top: g21_Modulo_13 port map (A => card_to_add, floor => suit, modout => card);
	card_int <= unsigned(card);
	hand <= unsigned(current_hand(4 downto 0));
	ace_in_hand <= current_hand(5);
	
	one <= "01";
	ten <= "1010";
	eleven <= "1011";
	game_procedure: process(hand, card_value, ace_in_hand, ace_in_total, fake_add, try_add, total_value_int)
	begin
		--set the card value
		if(card_int >= "0001" and card_int <= "1001") then
			card_value <= card_int + one;
			
		elsif (card_int >= "1010") then
			card_value <= ten;
			
		elsif (card_int = "0000") then
			fake_add <= hand + eleven;
			
			if(fake_add > "10101") then
				card_value <= one;
			else
				card_value <= eleven;
			end if;
		end if;
		
		--try adding the sum
		try_add <= hand + card_value;
		
		--check if go bust and assign temp total value and ace marker
		if(try_add <= "10101") then
			total_value_int <= try_add;
			ace_in_total <= ace_in_hand;
		else
			if(ace_in_hand = '1') then
				total_value_int <= try_add - ten;
				ace_in_total <= '0';
			else
				total_value_int <= try_add;
				ace_in_total <= ace_in_hand;
			end if;
		end if;
		
		-- get legal play
		if (total_value_int <= "10101") then
			legal_play <= '1';
		else
			legal_play <= '0';
		end if;
		
		-- assign output values
		total_value <= ace_in_total & total_value_int;
	end process;
end;