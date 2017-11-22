library verilog;
use verilog.vl_types.all;
entity g21_rules_2_again_vlg_sample_tst is
    port(
        card_to_add     : in     vl_logic_vector(5 downto 0);
        current_hand    : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end g21_rules_2_again_vlg_sample_tst;
