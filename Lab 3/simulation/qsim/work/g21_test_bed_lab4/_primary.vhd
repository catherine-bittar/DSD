library verilog;
use verilog.vl_types.all;
entity g21_test_bed_lab4 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        enable          : out    vl_logic;
        Request_Deal    : in     vl_logic;
        CLK             : in     vl_logic;
        RSTButton       : in     vl_logic;
        pushButton      : in     vl_logic;
        EMPTY           : out    vl_logic;
        dipswitch2      : in     vl_logic_vector(5 downto 0);
        dipswitch1      : in     vl_logic_vector(1 downto 0);
        FULL            : out    vl_logic;
        pin_name1       : out    vl_logic;
        LED2            : out    vl_logic_vector(6 downto 0);
        LED3            : out    vl_logic_vector(6 downto 0);
        LEDfloor        : out    vl_logic_vector(6 downto 0);
        LEDmod          : out    vl_logic_vector(6 downto 0);
        VALUE           : out    vl_logic_vector(5 downto 0)
    );
end g21_test_bed_lab4;
