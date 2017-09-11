library ieee ;
use ieee.std_logic_1164.all ;

-- SET UP IO
entity uart_receiver is
port(
	clk, reset, rx, s_comp7, n_comp7, s_comp15 : in std_logic;
	n_count, s_count, clear_s, shift, clear_n, disp : out std_logic
);
end entity;

-- ARCHITECTURE
architecture beh of uart_receiver is
type state_type is (idle,start,data,stop);
signal state: state_type :=idle;

begin 

process(clk,reset)
begin
	-- ASYNC RESET
	if(reset = '1') then 
		state <= idle;
		
	-- ON RISING CLOCK CHANGE STATE
	elsif(clk'event and clk ='1' ) then
		case state is
			when idle =>	
				if(rx = '0') then
					state <= start; -- transition to start state on start bit
				else
					state <= idle; -- else do nothing
				end if;
			
			when start =>
				if(s_comp7 = '1') then
					state <= data; -- when middle of transmission, move to data state
				else
					state <= start; -- else remain in start state
				end if;
				
			when data =>
				if(s_comp15 = '1' and n_comp7 ='1') then
					state <= stop; -- when middle of last bit, move to stop state
				else
					state <= data; -- else stay in data state
				end if;
				
			when stop =>
				if(s_comp15 = '0') then
					state <= stop; -- if not end of stop bit, stay in stop state
				else
					state <= idle; -- otherwise, return to idle state
				end if;
				
		end case ;
	end if ;
end process;

-- INPUT/OUTPUT for each transition state
process(state,rx,n_comp7,s_comp15,s_comp7)
begin
	case state is
		when idle =>
			if(rx = '0') then
				clear_s <= '1';
				n_count <= '0';
				s_count <= '0';
				clear_n <= '1';
				shift <= '0';
				disp <= '1';
			else
				clear_s <='0';
				n_count <= '0';
				s_count <= '0';
				clear_n <= '0';
				shift <= '0';
				disp <= '1';			
			end if;
			
		when start =>
			if(s_comp7 ='1') then
				clear_s <= '1';
				n_count <= '0';
				s_count <= '0';
				clear_n <= '1';
				shift <= '0';
				disp <= '1';			
			else
				clear_s <= '0';
				n_count <='0';
				s_count <='1';
				clear_n <= '0';
				shift <= '0';
				disp <= '1';
			end if;
			
		when data =>
			if(s_comp15 = '1' and n_comp7='1') then
				clear_s <= '1';
				n_count <= '0';
				s_count <= '0';
				clear_n <= '0';
				shift <= '1';
				disp <= '0';
			elsif(s_comp15 = '1' and n_comp7 = '0') then
				clear_s <= '1';
				n_count <= '1';
				shift <= '1';
				clear_n <= '0';
				s_count <= '0';
				disp <= '0';
			elsif(s_comp15 = '0') then
				s_count <= '1';
				n_count <='0';
				clear_s <= '0';
				clear_n <= '0';
				shift <= '0';
				disp <= '0';
			end if;
			
		when stop =>
			if(s_comp15 ='0') then
				s_count <= '1';
				n_count <= '0';
				shift <='0';
				clear_s <= '0';
				clear_n <='0';
				disp <= '1';
			else
				s_count <= '0';
				n_count <= '0';
				shift <= '0';
				clear_s <= '0';
				clear_n <='0';
				disp <= '1';
			end if;
		end case;
end process;

end architecture;
				