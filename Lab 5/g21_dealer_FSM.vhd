-- this circuit implements the dealer FSM circuit as decribed in the Lab 4 instructions

-- entity name: g21_dealer_FSM

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-17-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g21_dealer_FSM is
	port(Request_Deal : in std_logic;
		  reset        : in std_logic;
		  Clock        : in std_logic;
		  Rand_Enable  : out std_logic);
end g21_dealer_FSM;

architecture deal_machine of g21_dealer_FSM is 
begin

	logic: process (reset, Clock, Request_Deal)
	begin 
	
		if (reset = '1') then
		Rand_Enable <= '0';
		elsif (Clock = '1' and Clock'event) then
		Rand_Enable <= Request_Deal;
		end if;
	
	end process;
	
end architecture;
	