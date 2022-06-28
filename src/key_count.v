module key_count(
   input wire clk,
	input wire rst_n,
	input wire [1:0] key,
	
	output reg [19:0] number,
	output reg [1:0] number_zhuangtai
);

always@(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
  number<=20'd0;
  end
  else if(key[0])begin
  number<=number+3'd5;
  end
  else if(key[1])begin
  number<=number+4'd10;
  end
  else if(number>=5'd30)begin
  number<=3'd5;
  end
  else if(number==5'd25)begin
  number<=20'd0;
  end
  else begin
  number<=number;
  end
end


//2s计数器，10_000_000 , 50_000_000为1s
reg[26:0] cnt;

always @(posedge clk or negedge rst_n)begin
if(!rst_n)begin
    cnt<=1'b0;
	 number_zhuangtai=1'b0;
end

else if (number == 5'd25)begin
        cnt<=1'b0;
		  number_zhuangtai<=1'b1;
end

else if (number == 5'd30)begin
        cnt<=1'b0;
		  number_zhuangtai<=2'b11;
end

else if(cnt==26'd100_000_000 -1)begin
	     cnt<=1'b0;
		  number_zhuangtai=1'b0;
end

else begin
	     cnt<=cnt+1'b1;
		  number_zhuangtai<=number_zhuangtai;
end

end
endmodule
