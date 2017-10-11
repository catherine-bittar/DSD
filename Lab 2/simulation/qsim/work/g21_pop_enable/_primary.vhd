library verilog;
use verilog.vl_types.all;
entity g21_pop_enable is
    port(
        N               : in     vl_logic_vector(5 downto 0);
        P_EN            : out    vl_logic_vector(51 downto 0);
        clk             : in     vl_logic
    );
end g21_pop_enable;
