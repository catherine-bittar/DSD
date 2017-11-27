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
		  reset        : in std_logic;
		  Clock        : in std_logic;
		  Rand_Enable  : out std_logic;
		  Dealer_Enable: out std_logic;
		  Player_Enable: out std_logic);
end Deal_FSM;

architecture deal_machine of Deal_FSM is

signal count: std_logic_vector(2 downto 0); 

begin

		  
	rand: process (reset, Clock, Request_Deal)
	begin 
	
		if (reset = '1') then
			Rand_Enable <= '0';
			Dealer_Enable <= '0';
			Player_Enable <= '0';
		elsif (Clock = '1' and Clock'event) then
			Rand_Enable <= Request_Deal;
		end if;
		
	end process;
	
	dealer_player: process(reset, Clock, Request_Deal)
	begin
	
	if (Clock = '1' and Clock'event) then
		Clock'event;
		wait until Clock = '1';
		Dealer_Enable <= '1';
		wait until Clock = '1';
		Dealer_Enable <= '0';
		wait until Clock = '1';
		Player_Enable <= '1';
		wait until Clock = '1';
		Player_Enable <= '0';
		wait until Clock = '1';
		Dealer_Enable <= '1';
		wait until Clock = '1';
		Dealer_Enable <= '0';
		wait until Clock = '1';
		Player_Enable <= '1';
		wait until Clock = '1';
		Player_Enable <= '0';
	end if;
	
	end process;
	
end architecture;