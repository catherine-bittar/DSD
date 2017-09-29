-- this circuit implements th IBM RANDU version of a linear congruential generator

-- entity name: g21_RANDU

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 09/29-2017

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_RANDU is
	port (seed : in std_logic_vector(31 downto 0);
	      rand : out std_logic_vector(31 downto 0));
end g21_RANDU;