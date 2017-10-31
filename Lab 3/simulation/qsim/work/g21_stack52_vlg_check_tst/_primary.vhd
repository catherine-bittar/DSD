library verilog;
use verilog.vl_types.all;
entity g21_stack52_vlg_check_tst is
    port(
        EMPTY           : in     vl_logic;
        en              : in     vl_logic_vector(51 downto 0);
        FULL            : in     vl_logic;
        NUM             : in     vl_logic_vector(5 downto 0);
        sset            : in     vl_logic;
        VALUE           : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_stack52_vlg_check_tst;
