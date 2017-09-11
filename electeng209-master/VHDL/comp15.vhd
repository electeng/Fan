-- COMPARATOR 15
library ieee;
use ieee.std_logic_1164.all;

-- SET UP IO
entity comp15 is
port(
	s : in std_logic_vector(3 downto 0);
	comp : out std_logic
);
end entity;

-- ARCHITECTURE
architecture beh of comp15 is
begin
	-- IF s = 15, OUTPUT 1
	comp <= '1' when s = "1111" else '0';
end architecture ;


