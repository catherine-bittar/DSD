library verilog;
use verilog.vl_types.all;
entity g21_SPG is
    port(
        SPG_ENABLE      : out    vl_logic;
        CLK             : in     vl_logic;
        SwitchEnable    : in     vl_logic
    );
end g21_SPG;
