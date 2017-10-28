library verilog;
use verilog.vl_types.all;
entity g21_SPG_vlg_check_tst is
    port(
        counter         : in     vl_logic_vector(20 downto 0);
        SPG_ENABLE      : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end g21_SPG_vlg_check_tst;
