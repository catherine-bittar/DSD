-- this circuit implements the segment decoder function as described in the Lab 2 PDF
-- entity name: g21_RANDU

-- Copyright (C) 2017 Catherine Bittar & Kevin Sorto-Ventura
-- Version 1.0
-- Author: Catherine Bittar & Kevin Sorto-Ventura; catherine.bittar@mail.mcgill.ca & kevin-rafael.sorto-ventura@mail.mcgill.ca
-- Date: 09/29-2017

library ieee; -- allows use of the std_logic_vector type 
use ieee.std_logic_1164.all;


entity g21_7_segment_decoder is -- begin description of g21_7_segment_decoder entity

	port (code : in std_logic_vector(3 downto 0); -- define input port code (4-bit)
			mode : in std_logic; -- define input port mode (1-bit)
			segments_out : out std_logic_vector(6 downto 0)); -- define output port segments_out (7-bit)
			
end g21_7_segment_decoder;

architecture g21_7_segment_decoder_arch of g21_7_segment_decoder is -- begin description of g21_7_segment_decoder_arch architecture

	signal xcode : std_logic_vector(4 downto 0); -- create internal signal xcode (5-bit)

	begin
	xcode(4 downto 1) <= code; xcode(0) <= mode; -- define xcode: bits 4 downto 1 = code & bit 0 = mode

	with xcode select -- begin "select when" satement assigning segments_out values based on xcode
	segments_out <=
		"1000000" when "00000",
		"0001000" when "00001",
		"0000011" when "00010",
		"0100100" when "00011",
		"0100100" when "00100",
		"0110000" when "00101",
		"0110000" when "00110",
		"0001001" when "00111",
		"0001001" when "01000",
		"0010010" when "01001",
		"0010010" when "01010",
		"0000010" when "01011",
		"0000010" when "01100",
		"1110000" when "01101",
		"1110000" when "01110",
		"0000000" when "01111",
		"0000000" when "10000",
		"0010000" when "10001",
		"0010000" when "10010",
		"1000000" when "10011",
		"0001000" when "10100",
		"1100001" when "10101",
		"0000011" when "10110",
		"0100011" when "10111",
		"1000110" when "11000",
		"0001001" when "11001",
		"0100001" when "11010",
		"1111111" when "11011",
		"0000110" when "11100",
		"1111111" when "11101",
		"0001110" when "11110",
		"1111111" when "11111";
		
end architecture g21_7_segment_decoder_arch;
	
