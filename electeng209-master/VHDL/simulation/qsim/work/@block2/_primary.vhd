library verilog;
use verilog.vl_types.all;
entity Block2 is
    port(
        digit           : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rx              : in     vl_logic;
        pin_name1       : out    vl_logic;
        enable          : out    vl_logic_vector(3 downto 0);
        ssd             : out    vl_logic_vector(6 downto 0)
    );
end Block2;
