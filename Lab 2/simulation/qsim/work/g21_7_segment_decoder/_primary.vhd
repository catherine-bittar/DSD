library verilog;
use verilog.vl_types.all;
entity g21_7_segment_decoder is
    port(
        code            : in     vl_logic_vector(3 downto 0);
        mode            : in     vl_logic;
        segments_out    : out    vl_logic_vector(6 downto 0)
    );
end g21_7_segment_decoder;
