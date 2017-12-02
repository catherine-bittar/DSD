-- this circuit determines if a game is over for the final lab 5 controller.

-- entity name: game_over
-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-29-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity game_over is
	port(score_player   : in std_logic_vector(1 downto 0); -- player score
	     score_dealer   : in std_logic_vector(1 downto 0); -- dealer score
		  
		  game_player    : out std_logic;
		  game_dealer    : out std_logic;
		  
        game_is_over   : out std_logic);

end game_over;	

architecture is_game_over of game_over is

begin

determine_game_over: process(score_dealer, score_player)
	begin 
	
	if( score_dealer = "11") then
		game_is_over <=  '1';
		game_dealer <= '1';
		game_player <= '0';
	elsif(score_player = "11") then
		game_is_over <= '1';
		game_player <= '1';
		game_dealer <= '0';
	else	
		game_is_over <= '0';
		game_player <= '0';
		game_dealer <= '0';
		
	end if;
	
end process determine_game_over;

end architecture;