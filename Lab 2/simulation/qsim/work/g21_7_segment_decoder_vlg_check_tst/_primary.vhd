library verilog;
use verilog.vl_types.all;
entity g21_7_segment_decoder_vlg_check_tst is
    port(
        segments_out    : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end g21_7_segment_decoder_vlg_check_tst;
