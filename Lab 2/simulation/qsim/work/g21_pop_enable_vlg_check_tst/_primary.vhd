library verilog;
use verilog.vl_types.all;
entity g21_pop_enable_vlg_check_tst is
    port(
        P_EN            : in     vl_logic_vector(51 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_pop_enable_vlg_check_tst;
