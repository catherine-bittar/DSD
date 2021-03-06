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

entity g21_rules is
	port(play_pile_top_card: in std_logic_vector(5 downto 0); -- card to add to out hand
	     card_to_play      : in std_logic_vector(5 downto 0); -- sum of cards we already have
        legal_play        : out std_logic;
		  total_value       : out unsigned(5 downto 0));
end g21_rules;	

architecture game_rules of g21_rules is
	signal face_top: std_logic_vector(3 downto 0); -- numerical face value
	signal suit_top: std_logic_vector(2 downto 0); 
	signal top_val: unsigned(3 downto 0); -- integer value of card to add (face_top + 1)
	signal card_val: std_logic_vector(4 downto 0); -- truncated value of sum
	signal card_val_int: unsigned (4 downto 0);
	signal ace_in_hand : std_logic; -- presence of ace in previous hand
	-- signal ace_new_card : std_logic; -- new card is an ace
	signal face_top_int : unsigned(3 downto 0);
	signal one_int : unsigned(1 downto 0);
	signal ten_int : unsigned (3 downto 0);
	signal eleven_int: unsigned (3 downto 0);
	signal fake_add: unsigned (4 downto 0); -- attempt to add 11 if new card is an ace
	signal try_add: unsigned (4 downto 0);
	signal total_value_temp : unsigned(4 downto 0);
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
	face_top_int <= unsigned(face_top); --convert to integer
	one_int <= "01"; -- create a value of 1
	ace_in_hand <= card_to_play(5);
	card_val <= card_to_play(4 downto 0);
	card_val_int <= unsigned(card_val);
	eleven_int <= "1011";
	ten_int <= "1010";
	
	card_val_assign: process(face_top, top_val, card_val_int, face_top_int, eleven_int, one_int, fake_add, try_add, total_value_temp)
	begin
	
		if (face_top >= "0001" and face_top <= "1001") then -- if mod was 1-9 need to add 1 for actual value
			top_val <= face_top_int + one_int;
			try_add <= top_val + card_val_int;
			if(ace_in_hand = '1' and try_add > "10101") then -- if card in hand was an ace and you go bust, you could change that ace to be 1
				total_value_temp <= try_add - ten_int;
				new_ace <= '0';
			elsif (ace_in_hand = '1' and try_add <= "10101") then
				new_ace <= '1';
				total_value_temp <= try_add;
			else
				total_value_temp <= try_add;
				new_ace <= '0';
			end if;
			
		elsif (face_top >= "1010") then -- if mod was 10 or more, its jack, queen or king so need actual value 10
			top_val <= "1010";
			try_add <= top_val + card_val_int;
			if(ace_in_hand = '1' and try_add > "10101") then -- if card in hand was an ace and you go bust, you could change that ace to be 1
				total_value_temp <= try_add - ten_int;
				new_ace <= '0';
			elsif (ace_in_hand = '1' and try_add <= "10101") then
				new_ace <= '1';
				total_value_temp <= try_add;
			else
				total_value_temp <= try_add;
				new_ace <= '0';
			end if;
			
		elsif (face_top = "0000") then -- if its an ace, decide which value
			fake_add <= eleven_int + card_val_int;
			if (fake_add <= "10101") then
				top_val <= "1011";
				new_ace <= '1';
			else
				top_val <= "0001";
				new_ace <= '0';
			end if;
			
			total_value_temp <= top_val + card_val_int;
		end if;
		
		if (total_value_temp <= "10101") then -- assign legal_play
			legal_play <= '1';
			total_value <= new_ace & total_value_temp;
		else
			legal_play <= '0';
			total_value <= new_ace & total_value_temp;
		end if;
		
	end process;
	
	--total_value <= '0' & (top_val + card_val_int);
	
	--total_value <= std_logic_vector(total_value_int);
end architecture;		