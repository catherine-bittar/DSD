library verilog;
use verilog.vl_types.all;
entity g21_lab1_vlg_check_tst is
    port(
        AeqB            : in     vl_logic;
        Cout            : in     vl_logic;
        \out\           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_lab1_vlg_check_tst;
