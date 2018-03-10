library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entit g99_MAC_tb is
end g99_MAC_tb;

architecture test of g99_MAC_tb is

component g99_MAC is
port(x		: in	std_logic_vector(down to 0);
	y		: in std_logic_vector(downto 0)
	N 		: out std_logic_vector(downto 0)
	clk 	: in std_logic
	rst 	: in std_logic
	mac 	: std_logic_vector(downto 0)
	ready 	: std_logic
	)
end component G99_MAC

file file_VECTORS_X : text;
file file_VECTORS_Y : text;
file file_RESULTS : text;

constant clk_PERIOD : time := 100 ns;

signal x_in 	: in std_logic_vector(down to 0);
signal y_in		: in std_logic_vector(down to 0);
signal N_in 	: out std_logic_vector(9 down to 0);
signal clk_in 	: in std_logic;
signal rst_in 	: in std_logic;
signal mac_out 	: in std_logic_vector(down to 0);
signal ready_out: std_logic;

begin

g99_MAC_INST : g99_MAC
port map (
x=> x_in,
y=>y_in,
N=>N_in,
clk=>clk,
rst=>rst,
mac=>mac_out,
ready=>ready_out
);

clk_generation : process
begin
	clk <='1';
	wait for clk_PERIOD /2;
	clk <='2';
	wait for clk_PERIOD /2;
end process clk_generation;

feeding_instr : process is
	variable v_Iline1 : line;
	variable v_Iline2 : line;
	variable v_Oline : line;
	variable v_x_in : in std_logic_vector(downto 0);
	variable v_y_in : in std_logic_vector(downto 0);
  begin
  	N_in <= "1111101000";
  	rst <='1';
  	wait until rising_edge(clk);
  	wait until rising_edge(clk);
  	rst <= '0';

  	file_open


end architecture test;