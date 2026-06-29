module alu( 
	input [3:0] a,
       	input [3:0] b ,
       	input [3:0] op,
       	output reg [3:0] result,
	output zero,
	output carry ,
	output ovfl
);
assign zero=( result == 4'b0000);
always @(*) begin 
	result = 4'b0000;
	case (op)
		4'b0000 : result = (a + b) ; 
		4'b0001 : result = (a - b) ;
		4'b0010 : result = ( a && b);
		4'b0011 : result = ( a || b);
		4'b0101 : result = ( a ^ b );
		4'b0100 : result = ( ! a );
		4'b0110 : result = ( a << 1 );
		4'b0111 : result = ( a >> 1 );
	endcase
end 
endmodule






