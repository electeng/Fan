-- 8-BIT SHIFT REGISTER

library ieee;
use ieee.std_logic_1164.all;

-- SET UP IO
entity shift_reg is
port(
	rx, clk, enable, clear : in std_logic ;
	q : out std_logic_vector(7 downto 0)
);
end entity ;

-- ARCHITECTURE
architecture beh of shift_reg is
begin

process(clk, clear)
variable temp : std_logic_vector(7 downto 0);
begin
	-- RESET
	if(clear = '1') then
		temp := "00000000";
	-- SHIFT RX TO TEMP ON RISING CLOCK
	elsif(clk'event and clk = '1') then
		if(enable='1') then
			temp := rx & temp(7 downto 1);
		end if;
	end if;
	-- OUTPUT NEW VALUE
	q <= temp;
end process;
end architecture ;

