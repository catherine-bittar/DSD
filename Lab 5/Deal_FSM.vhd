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
		  Dealer_Enable: out std_logic; -- TODO: add eneable condition to rules (and most likely a clock too)
		  Player_Enable: out std_logic;-- TODO: similarly like above
		  Dealer_score : out std_logic_vector(2 downto 0);
		  Player_score : out std_logic_vector(2 downto 0);
		  Compare_enable: out std_logic);
end Deal_FSM;

architecture deal_machine of Deal_FSM is

type state is (waiting, ready, dealer_wait, player_wait, dealer_card1,
               dealer_card2, player_card1, player_card2, dealer_play, 
					dealer_fc, player_fc, player_play, dealer_en,player_en,
					dealer_test, player_test, dealer_win, player_win, compare); 

signal present_state: state;
signal dealer_wins, player_wins: integer;

begin
--dealer_wins <= 0;
--player_wins <= 0;
	  
	fsm: process (reset, Clock, present_state, INIT, Stop, Request_Deal, Dealer_legal, Player_legal, Dealer_total, Player_total, Dealer_high, Player_high)
	begin 
		if (reset = '1') then
			present_state <= waiting;
		elsif (rising_edge(Clock)) then
		
		case present_state is
			
			when waiting =>
				if (INIT = '1') then
					present_state <= ready;
				else
					present_state <= waiting;
				end if;
				
			when ready =>
				present_state <= dealer_card1;
			
			when dealer_card1 =>
				present_state <= player_card1;
				
			when player_card1 =>
				present_state <= dealer_card2;
				
			when dealer_card2 =>
				present_state <= player_card2;
				
			when player_card2 => 
				present_state <= dealer_fc;
			
			when dealer_fc =>
				if (Dealer_total = "010101") then
					present_state <= Dealer_win;
				else
					present_state <= player_fc;
				end if;	
				
			when player_fc =>
				if (Player_total = "010101") then
					present_state <= Player_win;
				else
					present_state <= player_wait;
				end if;
			
			when player_wait =>
				if (stop = '1') then
					present_state <= dealer_wait;
				elsif (Request_Deal = '1') then
					present_state <= player_play;
				else 
					present_state <= player_wait;
				end if;
				
			when player_play =>
				present_state <= player_en;
				
			when player_en =>
				present_state <= player_test;
				
			when player_test =>
				if (Player_legal = '1' and Player_total /= "010101") then
					present_state <= player_wait;
				elsif (Player_legal = '1' and Player_total = "010101") then
					present_state <= player_win;
				elsif (Player_legal = '0') then
					present_state <= dealer_win;
				end if;
				
			when dealer_wait =>
				if (Dealer_total <= "010000") then
					present_state <= dealer_play;
				elsif (Dealer_total > "010000" and Dealer_total /= "010101") then 
					present_state <= compare;
				elsif (Dealer_total = "010101") then
					present_state <= dealer_win;
				end if;
				
			when dealer_play =>
				present_state <= dealer_en;
				
			when dealer_en =>
				present_state <= dealer_test;
				
			when dealer_test =>
				if (Dealer_total > "010101") then
					present_state <= player_win;
				else
					present_state <= dealer_wait;
				end if;
			 
			when compare =>
				if (Dealer_high = '1') then
					present_state <= dealer_win;
				elsif(Player_high = '1') then
					present_state <= player_win;
				end if;
				
			when dealer_win =>
				if (INIT = '1') then
					present_state <= ready;
				end if;
				
			when player_win =>
				if (INIT = '1') then
					present_state <= ready;
				end if;
					
		end case;
		end if;
	end process fsm;

	
	controller: process(Clock)
	begin
		
		if(Clock = '1' and Clock'event) then
			case present_state is
			
				when waiting =>
					--
					Rand_Enable <= '0';  
					Dealer_Enable <= '0';
					Player_Enable <= '0';	
				when ready =>
					--
					Rand_Enable <= '0';  
					Dealer_Enable <= '0';
					Player_Enable <= '0';
				when dealer_wait =>
					--
				when player_wait =>
					--
				when dealer_card1 =>
					--
					Dealer_Enable <= '1';
					Rand_Enable <= '1';
				when player_card1 =>
					-- 
					Player_Enable <= '1';
					Rand_Enable <= '1';
				when dealer_card2 =>
					--
					Dealer_Enable <= '1';
					Rand_Enable <= '1';
				when player_card2 =>
					--
					Player_Enable <= '1';
					Rand_Enable <= '1';
				when dealer_play =>
					--
				when dealer_fc =>
					--
					Rand_Enable <= '0';  
					Dealer_Enable <= '0';
					Player_Enable <= '0';
				when player_play =>
					--
				when player_fc =>
					--
					Rand_Enable <= '0';  
					Dealer_Enable <= '0';
					Player_Enable <= '0';
				when dealer_en =>
					--
					Dealer_Enable  <= '1';
					Rand_Enable <= '1';
				when player_en =>
					--
					Player_Enable <= '1';
					Rand_Enable <= '1';
				when dealer_test =>
					--
				when player_test =>
					--
				when dealer_win =>
					--
					dealer_wins <= dealer_wins + 1;
					Dealer_score <= std_logic_vector(to_unsigned(dealer_wins, Dealer_score'length));
				when player_win =>
					--
					player_wins <= player_wins + 1;
					Player_score <= std_logic_vector(to_unsigned(player_wins, Player_score'length));
				when compare =>
					--
					Compare_enable <= '1';
						
			end case;
		end if;
	end process controller;
	

	
end architecture;