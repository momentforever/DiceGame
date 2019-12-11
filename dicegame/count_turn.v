module count_turn(rst,keyf,count);
input keyf;
input rst;
output [3:0] count;
reg [3:0] count;


always@(posedge keyf or posedge rst)begin
	if(rst==1)count=0;
	else count=count%2+1;
end

endmodule
