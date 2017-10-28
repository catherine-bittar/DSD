library verilog;
use verilog.vl_types.all;
entity g21_SPG_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        SwitchEnable    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g21_SPG_vlg_sample_tst;
