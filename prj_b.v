module prj_b 
#(parameter Nc = 2,parameter N = 4)
(input clk,input rst_n, input [Nc-1:0] ctrl, output [N-1:0] out);

reg [N-1:0] i;

always @(posedge clk, negedge rst_n)
	if (rst_n==0) begin
		i<=0;
	end

	else begin
		if (ctrl==0) begin
			i<=i-1;
		end
		else begin
			i<=i+(-(2**(Nc-1))*ctrl[Nc-1]+ctrl[Nc-2:0]);
		end
		
		
	end

assign out = {i[N-1], i[N-1:1] ^ i[N-2:0]};

endmodule

 
