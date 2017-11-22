library verilog;
use verilog.vl_types.all;
entity g21_rules_2_again is
    port(
        card_to_add     : in     vl_logic_vector(5 downto 0);
        current_hand    : in     vl_logic_vector(5 downto 0);
        legal_play      : out    vl_logic;
        total_value     : out    vl_logic_vector(5 downto 0)
    );
end g21_rules_2_again;
