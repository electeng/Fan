library verilog;
use verilog.vl_types.all;
entity testing_counter is
    port(
        cnt             : out    vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        enable          : in     vl_logic
    );
end testing_counter;
