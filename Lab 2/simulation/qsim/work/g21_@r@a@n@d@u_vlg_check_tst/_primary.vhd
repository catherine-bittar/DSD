library verilog;
use verilog.vl_types.all;
entity g21_RANDU_vlg_check_tst is
    port(
        rand            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_RANDU_vlg_check_tst;
