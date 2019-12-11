module turn_control(clk,rst,num1,num2,win,lose,turn,rst_o);
input clk;
input [3:0] num1;
input [3:0] num2;
input [1:0] turn;
input rst;

output rst_o;
reg rst_o;

output win;
output lose;
reg win;
reg lose;

reg [3:0] turn1_num1;
reg [3:0] turn1_num2;

reg [3:0] state;

always@(posedge clk)begin
	case(state)
		4'b0000:begin
			win<=0;
			lose<=0;
		end
		2'b0001:begin
			if(turn==2'b01)begin
				if(num1+num2==4'b0101||num1+num2==4'b1011)begin
					win<=1;
					lose<=0;
				end
				else begin
					turn1_num1<=num1;
					turn1_num2<=num2;
					win<=0;
					lose<=0;
				end
			end
		end
		4'b0010:begin
				if(num1+num2==4'b0101||num1+num2==4'b1011)begin
					win<=0;
					lose<=1;
				end
				else if(turn1_num1+turn1_num2==num1+num2)begin
					win<=1;
					lose<=0;
				end
				else begin
					win<=0;
					lose<=0;
				end		
		end
	endcase
		
end

endmodule

