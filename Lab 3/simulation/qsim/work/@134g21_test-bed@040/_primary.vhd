library verilog;
use verilog.vl_types.all;
entity \g21_test-bed\ is
    port(
        LEDfloor        : out    vl_logic_vector(6 downto 0);
        pushButton      : in     vl_logic;
        CLK             : in     vl_logic;
        dipswitch2      : in     vl_logic_vector(5 downto 0);
        dipswitch1      : in     vl_logic_vector(1 downto 0);
        LEDmod          : out    vl_logic_vector(6 downto 0)
    );
end \g21_test-bed\;
