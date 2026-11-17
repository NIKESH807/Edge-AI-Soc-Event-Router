`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2026 23:05:02
// Design Name: 
// Module Name: routing_lut
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module routing_lut(
    input logic [3:0] source_addr,
    output logic [3:0] target_addr,
    output logic match
    );
    logic [3:0] source_table [0:3];
    logic [3:0] target_table [0:3];
    initial begin
        source_table[0] = 4'b0001;
        target_table[0] = 4'b0010;
        source_table[1] = 4'b0010;
        target_table[1] = 4'b0100;
        source_table[2] = 4'b0011;
        target_table[2] = 4'b0110;
        source_table[3] = 4'b0100;
        target_table[3] = 4'b1000;
     end
     always_comb begin
         target_addr=4'b0000;
         match=1'b0;
         for(int i=0;i<4;i++)
            if(source_addr==source_table[i])begin
               target_addr=target_table[i];
               match=1'b1;
            end
        end
endmodule
