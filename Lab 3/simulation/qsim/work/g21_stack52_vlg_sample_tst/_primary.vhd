library verilog;
use verilog.vl_types.all;
entity g21_stack52_vlg_sample_tst is
    port(
        ADDR            : in     vl_logic_vector(5 downto 0);
        CLK             : in     vl_logic;
        DATA            : in     vl_logic_vector(5 downto 0);
        ENABLE          : in     vl_logic;
        MODE            : in     vl_logic_vector(1 downto 0);
        RST             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g21_stack52_vlg_sample_tst;
