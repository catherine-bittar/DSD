library verilog;
use verilog.vl_types.all;
entity g21_dealer_FSM is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        Request_Deal    : in     vl_logic;
        reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Rand_Enable     : out    vl_logic
    );
end g21_dealer_FSM;
