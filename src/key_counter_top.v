module key_counter_top(
   input wire clk,
	input wire rst_n,
	input wire [1:0] key,
	
	output wire [5:0] sel,
	output wire [7:0] seg,
	output wire [3:0] numberled,
	output wire number_beep
);
wire [1:0] flag;
wire [1:0] key_value;
wire [19:0] number;

wire [1:0] number_zhuangtai;
key_count key_count_inst(
.clk(clk),
.rst_n(rst_n),
.key({flag[1]&&~key_value[1],flag[0]&&~key_value[0]}),
.number(number),

.number_zhuangtai(number_zhuangtai)
);
seg_decode seg_decode_inst(
.clk(clk),
.rst_n(rst_n),
.sel(sel),
.number(number),
.seg(seg)
);
sel_driver sel_driver_inst(
.clk(clk),
.rst_n(rst_n),
.sel(sel)
);
key_debouce key_debouce1(
.clk(clk),
.rst_n(rst_n),
.key(key[0]),
.flag(flag[0]),
.key_value(key_value[0])
);
key_debouce key_debouce2(
.clk(clk),
.rst_n(rst_n),
.key(key[1]),
.flag(flag[1]),
.key_value(key_value[1])
);

led number_led(
.clk(clk),
.rst_n(rst_n),
.number_zhuangtai(number_zhuangtai),

.led(numberled)
);

beep numberbeep(
.clk(clk),
.rst_n(rst_n),
.number_zhuangtai(number_zhuangtai),

.beep(number_beep)
);

endmodule
