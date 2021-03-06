module sel_driver(
    input wire clk,
	 input wire rst_n,
	 
	 
	 output reg [5:0]sel
);
parameter max_num=10'd999;
reg[9:0] cnt;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
	   cnt<=10'd0;
	 end
	 else if(cnt==max_num)begin
	   cnt<=10'd0;
	 end
	 else begin
	   cnt<=cnt +1'd1;
		end
end
//位选信号位移操作
always@(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
  sel<=6'b011111;
 end
 else if(cnt==max_num)begin
   sel<={sel[0],sel[5:1]};
	end
  else begin
    sel<=sel;
	end
end
endmodule
