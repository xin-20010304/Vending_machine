module beep(
     input wire clk,
	  input wire rst_n,
	  input wire [1:0] number_zhuangtai,
	  
	  output reg beep
);

//0.2s计数器，10_000_000 , 50_000_000为1s
reg[23:0] cnt;

//定义4个LED的状态切换，0-1-2-3,00-01-10-11
reg [1:0]  flag;

//0.1s计数器
always @(posedge clk or negedge rst_n)begin
if(!rst_n)
    cnt<=1'b0;
else
    if(cnt==24'd10_000_000 -1)
	     cnt<=1'b0;
	 else 
	     cnt<=cnt+1'b1;
end


//状态切换计数器模块
always @(posedge clk or negedge rst_n)begin
      if(!rst_n)
		   flag<=1'b0;
		else if(cnt==24'd10_000_000 -1)
		    flag<=flag+1'b1;
		else 
		     flag<=flag;

end

//蜂鸣器控制模块
always @(posedge clk or negedge rst_n)begin
      if(!rst_n)begin
		   beep<=1'b1;
		end
		
		else if(number_zhuangtai ==1'b1)begin
		case(flag) 
			      2'b00: beep<=1'b1;
					2'b01: beep<=1'b0;
					2'b10: beep<=1'b1;
					2'b11: beep<=1'b0;
					default : beep<=1'b0;
			 
			 endcase
		end
		
		else if(number_zhuangtai ==2'b11)begin
		case(flag) 
			      2'b00: beep<=1'b0;
					2'b01: beep<=1'b0;
					2'b10: beep<=1'b1;
					2'b11: beep<=1'b1;
					default : beep<=1'b0;
			 
			 endcase
		end
		
		else begin
		   beep<=1'b1;
		end
end


endmodule 