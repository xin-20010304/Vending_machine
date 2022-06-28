module seg_decode(
  input wire clk,
  input wire rst_n,
  input wire [5:0] sel,
  
  input wire [19:0] number,
  
  output reg [7:0] seg
);
reg [3:0] seg_value;
always@(*)begin
  case(sel)
     6'b011111: seg_value = number%10;
     6'b101111: seg_value = (number%100)/10;
	  default:seg_value=4'd0;
	  endcase
  end
always@(*)begin
if (sel==6'b011111)begin
  case(seg_value)
			4'd0:		   seg <= 8'b1100_0000;//数码管显示0
			4'd1:		   seg <= 8'b1111_1001;//数码管显示1
			4'd2: 		seg <= 8'b1010_0100;//数码管显示2
			4'd3: 		seg <= 8'b1011_0000;//数码管显示3
			4'd4: 		seg <= 8'b1001_1001;//数码管显示4
			4'd5: 		seg <= 8'b1001_0010;//数码管显示5
			4'd6: 		seg <= 8'b1000_0010;//数码管显示6
			4'd7: 		seg <= 8'b1111_1000;//数码管显示7
			4'd8: 		seg <= 8'b1000_0000;//数码管显示8
			4'd9:    	seg <= 8'b1001_0000;//数码管显示9
        default:     seg <= 8'b1100_0000;
  endcase
  end
  else if(sel==6'b101111)begin
    case(seg_value)
			4'd0:		   seg <= 8'b0100_0000;//数码管显示0
			4'd1:		   seg <= 8'b0111_1001;//数码管显示1
			4'd2: 		seg <= 8'b0010_0100;//数码管显示2
			4'd3: 		seg <= 8'b1011_0000;//数码管显示3
			4'd4: 		seg <= 8'b1001_1001;//数码管显示4
			4'd5: 		seg <= 8'b1001_0010;//数码管显示5
			4'd6: 		seg <= 8'b1000_0010;//数码管显示6
			4'd7: 		seg <= 8'b1111_1000;//数码管显示7
			4'd8: 		seg <= 8'b1000_0000;//数码管显示8
			4'd9:    	seg <= 8'b1001_0000;//数码管显示9
        default:     seg <= 8'b1100_0000;
  endcase
 end
 
 else begin
     seg<= 8'b0100_0000;
 end
end
endmodule
