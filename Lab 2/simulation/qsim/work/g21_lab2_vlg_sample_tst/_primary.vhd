library verilog;
use verilog.vl_types.all;
entity g21_lab2_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        N               : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end g21_lab2_vlg_sample_tst;
