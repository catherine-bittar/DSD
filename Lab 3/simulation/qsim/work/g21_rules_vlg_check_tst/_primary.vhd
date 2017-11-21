library verilog;
use verilog.vl_types.all;
entity g21_rules_vlg_check_tst is
    port(
        legal_play      : in     vl_logic;
        total_value     : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_rules_vlg_check_tst;
