library verilog;
use verilog.vl_types.all;
entity g21_rules is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        play_pile_top_card: in     vl_logic_vector(5 downto 0);
        card_to_play    : in     vl_logic_vector(5 downto 0);
        legal_play      : out    vl_logic;
        total_value     : out    vl_logic_vector(5 downto 0)
    );
end g21_rules;
