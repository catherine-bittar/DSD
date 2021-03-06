-- this circuit implements the deal FSM circuit used in Lab 5

-- entity name: g21_dealer_FSM

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-27-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
library lpm;
use lpm.lpm_components.all;

entity Deal_FSM is
	port(Request_Deal : in std_logic;
		  Stop         : in std_logic;
		  INIT         : in std_logic;
		  reset        : in std_logic;
		  Clock        : in std_logic;
		  --Dealer_legal : in std_logic; -- TODO: take legal_play output from dealer rules module
		  --Player_legal : in std_logic; -- TODO: similarly like above
		  Dealer_total : in std_logic_vector (4 downto 0);
		  Player_total : in std_logic_vector (4 downto 0);
		  Dealer_high  : in std_logic; -- TODO: 1 when dealer sum > player sum (would require a comparator module)
		  Player_high  : in std_logic; -- TODO: similarly like above
		  Game_over    : in std_logic;
		  score_player : in std_logic_vector(1 downto 0);
		  score_dealer : in std_logic_vector(1 downto 0);
		  
		  rand_seed    : out std_logic;
		  Clear_count  : out std_logic;
		  Dealer_Enable: out std_logic; -- TODO: add eneable condition to rules (and most likely a clock too)
		  Player_Enable: out std_logic;-- TODO: similarly like above
		  --Dealer_score : out std_logic_vector(1 downto 0);
		  --Player_score : out std_logic_vector(1 downto 0);
		  player_turn  : out std_logic; -- activate rightmost gree LED to indicate player's turn
		  Compare_enable: out std_logic;
		  count_dealer: out std_logic;
		  count_gp    : out std_logic;
		  count_gd    : out std_logic;
		  count_player: out std_logic);
end Deal_FSM;

architecture deal_machine of Deal_FSM is

type state is (rand_start, waiting, ready, dealer_wait, player_wait, dealer_card1,
               dealer_card2, player_card1, player_card2, dealer_play, 
					dealer_fc, player_fc, player_play, dealer_en,player_en,
					dealer_test, player_test, dealer_win, player_win, compare); 

signal present_state: state;
signal temp_dealer, temp_player : std_logic_vector(4 downto 0);
signal dealer_change, player_change : std_logic;

begin
	
	  
	fsm: process (reset, Clock, present_state, INIT, Stop, Request_Deal, Dealer_total, Player_total, Dealer_high, Player_high, Game_over, score_dealer, score_player)
	begin 
		if (reset = '1') then
			present_state <= rand_start;
		elsif (rising_edge(Clock)) then
		
		case present_state is
			
			when rand_start =>
				present_state <= waiting;
			
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
				if (Dealer_total = "10101") then
					present_state <= Dealer_win;
				else
					present_state <= player_fc;
				end if;	
				
			when player_fc =>
				if (Player_total = "10101") then
					present_state <= Player_win;
				else
					present_state <= player_wait;
				end if;
			
			when player_wait =>
				if (Stop = '1') then
					present_state <= dealer_wait;
				elsif (Request_Deal = '1') then
					present_state <= player_play;
				else 
					present_state <= player_wait;
				end if;
				
			when player_play =>
				present_state <= player_en;
				
			when player_en =>
				--player_change <= or_reduce(player_total xor temp_player);
				--if(player_change = '1') then
					present_state <= player_test;
				--end if;
				
			when player_test =>
				if (Player_total < "10101") then
					present_state <= player_wait;
				elsif (Player_total = "10101") then
					present_state <= player_win;
				elsif (Player_total > "10101") then
					present_state <= dealer_win;
				end if;
				
			when dealer_wait =>
				if (Dealer_total <= "10000") then
					present_state <= dealer_play;
				elsif (Dealer_total > "10000" and Dealer_total < "10101") then 
					present_state <= compare;
				elsif (Dealer_total = "10101") then
					present_state <= dealer_win;
				end if;
				
			when dealer_play =>
				present_state <= dealer_en;
				
			when dealer_en =>
				--dealer_change <= or_reduce(Dealer_total xor temp_dealer);
				--if (dealer_change = '1') then
					present_state <= dealer_test;
				--end if;
				
			when dealer_test =>
				if (Dealer_total > "10101") then
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
					present_state <= waiting;
				
			when player_win =>
					present_state <= waiting;
					
		end case;
		temp_dealer <= Dealer_total;
		temp_player <= Player_total;
		end if;
	end process fsm;
	

	
	controller: process(Clock)
	begin
		
		if(Clock = '1' and Clock'event) then
			case present_state is
			
				when rand_start =>
					rand_seed <= '1';
			
				when waiting =>
					Dealer_Enable <= '0'; 
					Player_Enable <= '0';
					count_dealer <= '0';
					count_player <= '0'; 
					Compare_enable <= '0'; 
					player_turn <= '0';
					count_gp <= '0';
					count_gd <= '0';
					rand_seed <= '0';
				
				when ready =>
					
					if (Game_over = '0') then
						Dealer_Enable <= '0'; 
						Player_Enable <= '0'; 
						count_dealer <= '0';
						count_player <= '0';
						Compare_enable <= '0';
						player_turn <= '0';
						Clear_count <= '0';
						count_gp <= '0';
						count_gd <= '0';
					elsif (Game_over = '1' and score_dealer = "11") then
						Dealer_Enable <= '0'; 
						Player_Enable <= '0';
						count_dealer <= '0';
						count_player <= '0'; 
						Compare_enable <= '0';
						player_turn <= '0';
						Clear_count <= '0';
						count_gp <= '0';
						count_gd <= '1';
					elsif (Game_over = '1' and score_player = "11") then
						Dealer_Enable <= '0'; 
						Player_Enable <= '0';
						count_dealer <= '0';
						count_player <= '0'; 
						Compare_enable <= '0';
						player_turn <= '0';
						Clear_count <= '0';
						count_gp <= '1';
						count_gd <= '0';
					else
						Dealer_Enable <= '0'; 
						Player_Enable <= '0';
						count_dealer <= '0';
						count_player <= '0'; 
						Compare_enable <= '0';
						player_turn <= '0';
						Clear_count <= '1';
						count_gp <= '0';
						count_gd <= '0';
					end if;
				
				when dealer_wait =>
					player_turn <= '0';
				
				when player_wait =>
					player_turn <= '1';
				
				when dealer_card1 =>	
					Dealer_Enable <= '1';
					Clear_count <= '0';
					count_gp <= '0';
					count_gd <= '0';
					if (Game_over = '1') then
						Clear_count <= '1';
					end if;
	
				when player_card1 =>
					Player_Enable <= '1';
					Dealer_Enable <= '0';
					Clear_count <= '0';
				
				when dealer_card2 =>
					Dealer_Enable <= '1';
					Player_Enable <= '0';
				
				when player_card2 =>
					Player_Enable <= '1';
					Dealer_Enable <= '0';
				
				when dealer_play =>
					Dealer_Enable  <= '1';
				
				when dealer_fc => 
					Dealer_Enable <= '0';
					Player_Enable <= '0';
				
				when player_play =>
					Player_Enable <= '1';
					player_turn <= '0';
				
				when player_fc =>  
					Dealer_Enable <= '0';
					Player_Enable <= '0';
				
				when dealer_en =>
					Dealer_Enable  <= '0';
				
				when player_en =>
					Player_Enable <= '0';
					player_turn <= '0';
					
				
				when dealer_test =>
					Dealer_Enable <= '0';
				
				when player_test =>
					Player_Enable <= '0';
				
				when dealer_win =>
					count_dealer <= '1';
					
					--dealer_wins <= dealer_wins + 1;
					--Dealer_score <= std_logic_vector(to_unsigned(dealer_wins, Dealer_score'length));
				
				when player_win =>
					count_player <= '1';	
					
					--player_wins <= player_wins + 1;
					--Player_score <= std_logic_vector(to_unsigned(player_wins, Player_score'length));
				
				when compare =>
					Compare_enable <= '1';
						
			end case;
		end if;
	end process controller;
	
end architecture;