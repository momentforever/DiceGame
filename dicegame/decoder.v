module decoder(data_in,data_out);
input [3:0]data_in;
output [7:0]data_out;
reg [7:0]data_out;
always@(data_in)
  begin
    case(data_in)
      4'b0000:data_out=8'b00111111;//0
      4'b0001:data_out=8'b00000110;//1
      4'b0010:data_out=8'b01011011;//2
	  4'b0011:data_out=8'b01001111;//3
	  4'b0100:data_out=8'b01100110;//4
	  4'b0101:data_out=8'b01101101;//5
	  4'b0110:data_out=8'b01111101;//6
	  4'b0111:data_out=8'b00000111;//7
	  4'b1000:data_out=8'b01111111;//8
	  4'b1001:data_out=8'b01101111;//9
	  4'b1010:data_out=8'b01110111;//A
	  4'b1011:data_out=8'b01111100;//B
	  4'b1100:data_out=8'b00111001;//C
	  4'b1101:data_out=8'b01011110;//D
	  4'b1110:data_out=8'b01111001;//E
	  4'b1111:data_out=8'b01110001;//F
	  default:data_out=8'b00000000;
    endcase
  end
endmodule
