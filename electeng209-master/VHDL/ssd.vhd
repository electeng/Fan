-- SEVEN SEGMENT
library ieee;
use ieee.std_logic_1164.all ;

-- SET UP IO
entity seven_seg is
port(
	packet : in std_logic_vector(7 downto 0);
	disp : in std_logic;
	sel : out std_logic_vector(3 downto 0) ;
	dp : out std_logic;
	ssd : out std_logic_vector(6 downto 0)
);
end entity;

-- ARCHITECTURE
architecture beh of seven_seg is

signal current_ssd: std_logic_vector(6 downto 0) := "0000000";
signal current_dp: std_logic := '0';
signal current_sel: std_logic_vector(3 downto 0) := "0000";

begin
	process(disp, packet)
	
	begin
	
	-- WHEN RISING DISP
	if (disp = '1' AND disp'event) then
	
	-- SET SELECT FROM PACKET DATA BITS 
	case packet(2 downto 1) is
	when "00" =>
		current_sel <= "0001";
	when "10" =>
		current_sel <= "0010";
	when "01" =>
		current_sel <= "0100";
	when "11" =>
		current_sel <= "1000";
	when others =>
		current_sel <= "0000";
	end case;

	-- SET CHARACTER FROM 4-BIT PACKET DATA BITS
	case packet(7 downto 4) is
	when "0000" =>
		current_ssd <= "1111110";
	when "1000" =>
		current_ssd <= "0110000";
	when "0100" =>
		current_ssd <= "1101101";
	when "1100" =>
		current_ssd <= "1111001";
	when "0010" =>
		current_ssd <= "0110011";
	when "1010" =>
		current_ssd <= "1011011";
	when "0110" =>
		current_ssd <= "1011111";
	when "1110" =>
		current_ssd <= "1110000";
	when "0001" =>
		current_ssd <= "1111111";
	when "1001" =>
		current_ssd <= "1110011";
	when others =>
		current_ssd <= "0000000";
	end case;		
	
	-- SELECT DP FROM DP BIT IN PACKET
	case packet(3) is
	when '1' =>
		current_dp <= '1';
	when others =>
		current_dp <= '0';
	end case;
	end if;
	
end process;

	dp <= current_dp;
	ssd <= current_ssd;
	sel <= current_sel;

end architecture;
