-- this circuit implements a comparator to determine the winner to be used in Lab 5

-- entity name: g21_determine_winner

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-28-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g21_determine_winner is
	port( total_player : in std_logic_vector (5 downto 0);
			total_dealer : in std_logic_vector (5 downto 0);
			enable       : in std_logic;
			
			dealer_high  : out std_logic;
			player_high  : out std_logic);
			
	end g21_determine_winner;

architecture determine_winner of g21_determine_winner is

begin

	assign_winner: process(total_dealer, total_player)
	begin
		
		if(total_player > total_dealer and enable = '1') then 
			dealer_high <= '0';
			player_high <= '1';
		elsif (total_dealer >= total_player and enable = '1') then
			dealer_high <= '1';
			player_high <= '0';
		else
			dealer_high <= '0';
			player_high <= '0';
		end if;
	
	end process assign_winner;

end architecture;
	