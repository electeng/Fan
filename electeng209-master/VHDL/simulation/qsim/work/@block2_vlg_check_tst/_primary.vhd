library verilog;
use verilog.vl_types.all;
entity Block2_vlg_check_tst is
    port(
        digit           : in     vl_logic;
        enable          : in     vl_logic_vector(3 downto 0);
        pin_name1       : in     vl_logic;
        ssd             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Block2_vlg_check_tst;
