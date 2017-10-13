library verilog;
use verilog.vl_types.all;
entity g21_lab2 is
    port(
        P_EN            : out    vl_logic_vector(51 downto 0);
        clk             : in     vl_logic;
        N               : in     vl_logic_vector(5 downto 0);
        rand            : out    vl_logic_vector(31 downto 0);
        seed            : in     vl_logic_vector(31 downto 0);
        segments_out    : out    vl_logic_vector(6 downto 0);
        mode            : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0)
    );
end g21_lab2;
