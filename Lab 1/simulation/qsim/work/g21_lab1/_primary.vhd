library verilog;
use verilog.vl_types.all;
entity g21_lab1 is
    port(
        AeqB            : out    vl_logic;
        A               : in     vl_logic_vector(6 downto 0);
        B               : in     vl_logic_vector(6 downto 0);
        Cout            : out    vl_logic;
        in_1            : in     vl_logic_vector(7 downto 0);
        in_2            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end g21_lab1;
