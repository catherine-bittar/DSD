library verilog;
use verilog.vl_types.all;
entity g21_stack52 is
    port(
        EMPTY           : out    vl_logic;
        NUM             : out    vl_logic_vector(5 downto 0);
        ENABLE          : in     vl_logic;
        ADDR            : in     vl_logic_vector(5 downto 0);
        MODE            : in     vl_logic_vector(1 downto 0);
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        FULL            : out    vl_logic;
        VALUE           : out    vl_logic_vector(5 downto 0);
        DATA            : in     vl_logic_vector(5 downto 0)
    );
end g21_stack52;
