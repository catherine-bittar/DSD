library verilog;
use verilog.vl_types.all;
entity g21_SPG is
    port(
        SPG_ENABLE      : out    vl_logic;
        CLK             : in     vl_logic;
        SwitchEnable    : in     vl_logic;
        counter         : out    vl_logic_vector(20 downto 0)
    );
end g21_SPG;
