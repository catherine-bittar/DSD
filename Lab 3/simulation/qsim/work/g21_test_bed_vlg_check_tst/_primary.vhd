library verilog;
use verilog.vl_types.all;
entity g21_test_bed_vlg_check_tst is
    port(
        enable          : in     vl_logic;
        LEDfloor        : in     vl_logic_vector(6 downto 0);
        LEDmod          : in     vl_logic_vector(6 downto 0);
        VALUE           : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_test_bed_vlg_check_tst;
