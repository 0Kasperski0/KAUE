`timescale 1ns/100ps

module prj_b_tb;
    parameter Nc = 2;  //ctrl bit size
    parameter N = 4;   //counter bit size
		//input
   	
  	reg clk=0;
    reg rst_n;
    reg [Nc-1:0] ctrl=0;
   		//output

    wire [N-1:0] out;

	always 
    	#10 clk = ~clk;

   
 	prj_b the_circuit(clk,rst_n,ctrl,out);

   	initial begin

      	$dumpfile("prj_b.vcd");
     	$dumpvars(0, prj_b_tb);
     	rst_n=0;
     	#5 rst_n=1;
      
      	#500 ctrl=2'b01;  // 1
      	#500 ctrl=2'b10;  //-2
      	#500 ctrl=2'b11;  //-1
     	#500 ctrl=3'b100;  //-4
     	#500 ctrl=3'b011;  //3

      #500 $finish;
   
  	 end 


endmodule 