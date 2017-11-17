library verilog;
use verilog.vl_types.all;
entity g21_dealer_FSM is
    port(
        Request_Deal    : in     vl_logic;
        reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Rand_Enable     : out    vl_logic
    );
end g21_dealer_FSM;
