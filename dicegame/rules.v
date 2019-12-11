module rules(win1,win2,en_out_count,en_out_radom,turn,rst,num,clk);
  input clk,rst;
  input [4:0]num;
  input [3:0]turn;
  output win1,win2;
  output en_out_count,en_out_radom;
  reg en_out_count,en_out_radom;
  reg [4:0]e;
  reg win1,win2;
  reg [0:3]a;
always @(posedge clk)
begin
	if(rst==0)begin
	case(a)
		4'b0000:begin
			en_out_count<=1;
			if(turn==1&&num==0)
				a<=4'b0001;
		end
		4'b0001:begin
			en_out_count<=0;
			if(num!=0)
				a<=4'b0010;
		end
		4'b0010:begin
			en_out_count<=1;
			if(num==11||num==5)
				begin
					win1<=1;
					win2<=0;
					a<=4'b0110;
				end
			else
				begin
					win1<=0;
					win2<=0;
					e<=num;
					a<=4'b0011;
				end
		end
		4'b0011:begin
			en_out_count<=1;
			if(turn==2&&num==0)
				a<=4'b0100;
		end
		4'b0100:begin
			en_out_count<=0;
			if(num!=0)
				a<=4'b0101;
		end
		4'b0101:begin
			en_out_count<=1;
			if(e==num)
				begin
					win1<=1;
					win2<=0;
					a<=4'b0110;
				end
			else
				begin
					if(num==5||num==11)
					begin
						win1<=0;
						win2<=1;
						a<=4'b0110;
					end
					else
					begin
						win1<=0;
						win2<=0;
						e<=0;
						a<=4'b0000;
					end
				end
		end
		4'b0110:begin
			a<=4'b0110;
			en_out_radom<=1;
			en_out_count<=0;
		end
	endcase
	end
	else
		begin
			en_out_radom<=0;
			en_out_count<=1;
			win1<=0;
			win2<=0;
			e<=0;
			a<=4'b0000;
		end
end
endmodule
