`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2026 23:28:52
// Design Name: 
// Module Name: tb_routing_lut
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
module tb_routing_lut;
    logic [3:0] source_addr;
    logic [3:0] target_addr;
    logic match;
    routing_lut DUT (
        .source_addr(source_addr),
        .target_addr(target_addr),
        .match(match)
    );
    initial begin
        source_addr = 4'b0001;
        #10;
        $display("Source=%b Target=%b Match=%b",
                  source_addr, target_addr, match);
        source_addr = 4'b0011;
        #10;
        $display("Source=%b Target=%b Match=%b",
                  source_addr, target_addr, match);
        source_addr = 4'b1111;
        #10;
        $display("Source=%b Target=%b Match=%b",
                  source_addr, target_addr, match);
        $finish;
    end
endmodule

