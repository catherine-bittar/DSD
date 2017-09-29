library verilog;
use verilog.vl_types.all;
entity g21_RANDU is
    port(
        seed            : in     vl_logic_vector(31 downto 0);
        rand            : out    vl_logic_vector(31 downto 0)
    );
end g21_RANDU;
