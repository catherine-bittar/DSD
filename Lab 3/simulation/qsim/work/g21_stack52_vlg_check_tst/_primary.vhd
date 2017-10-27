library verilog;
use verilog.vl_types.all;
entity g21_stack52_vlg_check_tst is
    port(
        EMPTY           : in     vl_logic;
        FULL            : in     vl_logic;
        NUM             : in     vl_logic_vector(5 downto 0);
        VALUE           : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_stack52_vlg_check_tst;
