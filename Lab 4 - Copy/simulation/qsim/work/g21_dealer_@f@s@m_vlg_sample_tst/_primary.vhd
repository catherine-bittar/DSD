library verilog;
use verilog.vl_types.all;
entity g21_dealer_FSM_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Request_Deal    : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g21_dealer_FSM_vlg_sample_tst;
