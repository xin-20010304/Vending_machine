module key_debouce(
    input wire clk,
	 input wire rst_n,
	 
	 input wire key,
	 
	 
	 
	 output reg flag,
	 output reg key_value
);
parameter  cnt_max = 20'd1_000_000;
reg [19:0] cnt_delay;
reg key_reg;
always@(posedge clk or negedge rst_n)begin
   if(!rst_n)begin
	  key_reg<=1'b1;
	  cnt_delay<=20'd0;
	end
	else begin
	  key_reg <=key;//key_reg保留上一个时刻的
   if(key_reg == 1'b1 && key ==1'b0)begin
	  cnt_delay<=cnt_max;
    end
	 else if(cnt_delay<=20'd0)begin
	   cnt_delay<=20'd0;
    end
	 else begin
	 cnt_delay<=cnt_delay - 1'd1;
    end
  end
end

always@(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
  flag<=1'b0;
  end
  else if(cnt_delay == 20'd1)begin
  flag<=1'b1;
  end
  else begin
    flag<=1'b0;
  end
end
always@(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
    key_value<=1'd1;
	 end
	else if(cnt_delay ==20'd1)begin
	  key_value<=key;
	  end
	else begin
	  key_value<=key_value;
 end
end
endmodule





