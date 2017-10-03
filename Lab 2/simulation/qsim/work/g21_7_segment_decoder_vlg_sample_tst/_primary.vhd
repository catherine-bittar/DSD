library verilog;
use verilog.vl_types.all;
entity g21_7_segment_decoder_vlg_sample_tst is
    port(
        code            : in     vl_logic_vector(3 downto 0);
        mode            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g21_7_segment_decoder_vlg_sample_tst;
