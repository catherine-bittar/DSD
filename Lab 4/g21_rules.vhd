-- this circuit implements the rules of the '21' game as decribed in the Lab 4 instructions

-- entity name: g21_rules

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-12-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_rules is
	port(play_pile_top_card: in std_logic_vector(5 downto 0);
	     card_to_play      : in std_logic_vector(5 downto 0);
        legal_play        : out std_logic);
end g21_rules;		  