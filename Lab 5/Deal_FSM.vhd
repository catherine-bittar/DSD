-- this circuit implements the deal FSM circuit used in Lab 5

-- entity name: g21_dealer_FSM

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-27-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity Deal_FSM is
	port(Request_Deal : in std_logic;
		  Stop         : in std_logic;
		  INIT         : in std_logic;
		  reset        : in std_logic;
		  Clock        : in std_logic;
		  Dealer_legal : in std_logic; -- TODO: take legal_play output from dealer rules module
		  Player_legal : in std_logic; -- TODO: similarly like above
		  Dealer_total : in std_logic_vector (5 downto 0);
		  Player_total : in std_logic_vector (5 downto 0);
		  Dealer_high  : in std_logic; -- TODO: 1 when dealer sum > player sum (would require a comparator module)
		  Player_high  : in std_logic; -- TODO: similarly like above
		  Rand_Enable  : out std_logic;
		  Dealer_Enable: out std_logic;
		  Player_Enable: out std_logic);
end Deal_FSM;

architecture deal_machine of Deal_FSM is

type state is (waiting, ready, dealer_wait, player_wait, dealer_card1,
               dealer_card2, player_card1, player_card2, dealer_play, 
					dealer_fc, player_fc, player_play, dealer_en,player_en,
					dealer_test, player_test, dealer_win, player_win, compare); 

signal present_state, next_state: state;

begin
	  
	fsm: process (reset, Clock)
	begin 
		if (reset = '1') then
			present_state <= waiting;
		elsif (Clock = '1' and Clock'event) then
			present_state <= next_state;
		end if;
	end process fsm;
	
	state_assign: process (present_state, INIT, Stop, Request_Deal, Dealer_legal, Player_legal)
	begin
		case present_state is
			
			when waiting =>
				if (INIT = '1') then
					next_state <= ready;
				else
					next_state <= waiting;
				end if;
				
			when ready =>
				next_state <= dealer_card1;
			
			when dealer_card1 =>
				next_state <= player_card1;
				
			when player_card1 =>
				next_state <= dealer_card2;
				
			when dealer_card2 =>
				next_state <= player_card2;
				
			when player_card2 => 
				next_state <= dealer_fc;
			
			when dealer_fc =>
				if (Dealer_total = "010101") then
					next_state <= Dealer_win;
				else
					next_state <= player_fc;
				end if;	
				
			when player_fc =>
				if (Player_total = "010101") then
					next_state <= Player_win;
				else
					next_state <= player_wait;
				end if;
			
			when player_wait =>
				if (stop = '1') then
					next_state <= dealer_wait;
				elsif (Request_Deal = '1') then
					next_state <= player_play;
				end if;
				
			when player_play =>
				next_state <= player_en;
				
			when player_en =>
				next_state <= player_test;
				
			when player_test =>
				if (Player_legal = '1' and Player_total /= "010101") then
					next_state <= dealer_wait;
				elsif (Player_legal = '1' and Player_total = "010101") then
					next_state <= player_win;
				elsif (Player_legal = '0') then
					next_state <= dealer_win;
				end if;
				
			when dealer_wait =>
				if (Dealer_total <= "010000") then
					next_state <= dealer_play;
				elsif (Dealer_total > "010000" and Dealer_total /= "010101") then 
					next_state <= compare;
				elsif (Dealer_total = "010101") then
					next_state <= dealer_win;
				end if;
				
			when dealer_play =>
				next_state <= dealer_en;
				
			when dealer_en =>
				next_state <= dealer_test;
				
			when dealer_test =>
				next_state <= dealer_wait;
			 
			when compare =>
				if (Dealer_high = '1') then
					next_state <= dealer_win;
				elsif(Player_high = '1') then
					next_state <= player_win;
				end if;
				
			when dealer_win =>
				if (INIT = '1') then
					next_state <= ready;
				end if;
				
			when player_win =>
				if (INIT = '1') then
					next_state <= ready;
				end if;
					
		
		end case;
	end process state_assign;
	
end architecture;