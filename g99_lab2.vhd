library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g99_lab2 is
port (	x : in std_logic_vector(9 downto 0);
	y : in std_logic_vector(9 downto 0);
	N : in std_logic_vector(9 downto 0);
	clk : in std_logic;
	rst : in std_logic;
	mac : out std_logic_vector(19 downto 0);
	ready : out std_logic);
end g99_lab2;


architecture macUnit of g99_lab2 is
signal sum: signed (19 downto 0);  -- current mac sum
signal product: signed (19 downto 0);
signal i: std_logic_vector (9 downto 0); -- i=1:N
	begin
	
	adder: process(clk)
	begin

	if rising_edge(clk) then

		if rst='1' then
			sum <=(others => '0') ; --reset sum
			ready<='1';

		elsif i<N then
			product<=signed(x)*signed(y);
			sum<=sum+product;
			i<=std_logic_vector(signed(i)+1); -- i++
		elsif i=N then
			mac<=std_logic_vector(sum); --return output mac
			ready<='1';
		end if;

	end if;

	end process;


end macUnit;