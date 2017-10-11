library ieee; -- allows use of the std_logic_vector type and lpm components
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g21_pop_enable is
	port( N	  : in std_logic_vector(5 downto 0);
			P_EN : out std_logic_vector (51 downto 0);
			clk  : in std_logic);
end g21_pop_enable;

architecture g21_pop_enable_arch of g21_pop_enable is

	component g21_lab2_rom1 --identify rom component
		port(address : in  std_logic_vector (5 downto 0); -- addresses ranges from 0-64 2^6
			  clock   : in  std_logic;                     -- clock signal
			  q       : out std_logic_vector (51 downto 0)); -- output has 52 bits
	end component;
	
begin

	R1: g21_lab2_rom1 port map (address => N, clock => clk, q => P_EN); --map inputs and outputs to ROM

end architecture g21_pop_enable_arch;
