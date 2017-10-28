library verilog;
use verilog.vl_types.all;
entity g21_test_bed_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        dipswitch1      : in     vl_logic_vector(1 downto 0);
        dipswitch2      : in     vl_logic_vector(5 downto 0);
        pushButton      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g21_test_bed_vlg_sample_tst;
