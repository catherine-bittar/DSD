-- this circuit translates a score value to an LED output to be used in Lab 5

-- entity name: g21_show_score
-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 11-28-2017

library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g21_show_score is
	port( score : in std_logic_vector (1 downto 0);
			
			led_on  : out std_logic_vector (2 downto 0));
			
	end g21_show_score;

architecture show_score of g21_show_score is

begin

	assign_score: process (score)
		begin
			case score is
				when "00" =>
					led_on <= "000";
				when "01" =>
					led_on <= "001";
				when "10" =>
					led_on <= "011";
				when "11" =>
					led_on <= "111";
			end case;
		end process assign_score;
end architecture;
