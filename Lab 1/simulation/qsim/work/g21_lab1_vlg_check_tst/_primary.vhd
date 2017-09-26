library verilog;
use verilog.vl_types.all;
entity g21_lab1_vlg_check_tst is
    port(
        AeqB            : in     vl_logic;
        Amod13          : in     vl_logic_vector(7 downto 0);
        Cout            : in     vl_logic;
        floor           : in     vl_logic_vector(2 downto 0);
        \out\           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_lab1_vlg_check_tst;
