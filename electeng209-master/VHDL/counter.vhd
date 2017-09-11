library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- SET UP IO
entity counter is
port(
	clk, reset, enable : in std_logic;
	count : out std_logic_vector(3 downto 0)

);
end entity;

-- ARCHITECTURE
architecture beh of counter is
begin
process(clk)
variable temp :std_logic_vector(3 downto 0);

begin
	-- ON RISING CLOCK
	if(clk'event and clk = '1') then
		if(reset= '1') then
			temp := "0000"; -- SYNC RESET
		elsif (enable = '1') then
			temp := temp + 1 ; -- IF ENABLE = '1', ADD 1 TO COUNTER
		end if;
	end if;
	
	count <= temp; -- LOAD COUNT TO OUTPUT
end process;
end architecture;
