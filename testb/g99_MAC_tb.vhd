library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity g99_MAC_tb is
end g99_MAC_tb;

architecture test of g99_MAC_tb is

component g99_MAC is
port(x		: in	std_logic_vector(9 downto 0);
	y		: in std_logic_vector(9 downto 0);
	N 		: out std_logic_vector(9 downto 0);
	clk 	: in std_logic;
	rst 	: in std_logic;
	mac 	: in std_logic_vector(19 downto 0);
	ready 	: in std_logic);
end component G99_MAC;

file file_VECTORS_X : text;
file file_VECTORS_Y : text;
file file_RESULTS : text;

constant clk_PERIOD : time := 100 ns;

signal x_in 	: in  std_logic_vector(9 downto 0);
signal y_in		: in  std_logic_vector(9 downto 0);
signal N_in 	: out  std_logic_vector(9 downto 0);
signal clk_in 	: in  std_logic;
signal rst_in 	: in  std_logic;
signal mac_out 	: in  std_logic_vector(19 downto 0);
signal ready_out: in  std_logic;

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
	variable v_x_in : in std_logic_vector(9 downto 0);
	variable v_y_in : in std_logic_vector(9 downto 0);
  begin
  	N_in <= "1111101000";
  	rst <='1';
  	wait until rising_edge(clk);
  	wait until rising_edge(clk);
  	rst <= '0';

  	file_open(file_VECTORS_X,"lab1-x-fixed-point.txt",read_mode);
  	file_open(file_VECTORS_Y,"lab1-y-fixed-point.txt",read_mode);
  	file_open(file_RESULTS,"lab1-out.txt",write_mode);

  while not endfile(file_VECTORS_X) loop
  	readline(file_VECTORS_X,v_Iline1);
  	read(v_Iline1,v_x_in);
  	readline(file_VECTORS_Y,v_Iline2);
  	read(v_Ilinew,v_y_in);

  	x_in <= v_x_in;
  	y_in <= v_y_in;

  	wait until rising_edge(clk);
  end loop;

  if ready_out ='1' then
  	write(v_Oline,mac_out);
  	writeline(file_RESULTS, v_Oline);
  	wait;
  end if;
 end process;
end architecture test;

