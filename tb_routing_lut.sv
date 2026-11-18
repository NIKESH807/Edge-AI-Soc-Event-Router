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
    logic clk;
    logic reset;
    logic event_valid;
    logic [3:0] source_addr;
    logic event_ready;
    logic output_ready;
    logic [3:0] target_addr;
    logic match;
    logic output_valid;
    logic fifo_full;
    logic fifo_empty;
    routing_lut DUT (
        .clk(clk),
        .reset(reset),
        .event_valid(event_valid),
        .source_addr(source_addr),
        .event_ready(event_ready),
        .output_ready(output_ready),
        .target_addr(target_addr),
        .match(match),
        .output_valid(output_valid),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty)
    );
    always #5 clk = ~clk;
    always @(posedge clk) begin
        if (output_valid && output_ready) begin

            $display(
                "TIME=%0t SOURCE=%b TARGET=%b MATCH=%b",
                $time,
                DUT.fifo_data,
                target_addr,
                match
            );
        end
    end
    task send_event(input logic [3:0] addr);
        begin
            @(negedge clk);
            while (!event_ready)
                @(negedge clk);
            source_addr = addr;
            event_valid = 1;
            @(negedge clk);
            event_valid = 0;
        end
    endtask
    initial begin
        clk = 0;
        reset = 1;
        event_valid = 0;
        source_addr = 0;
        output_ready = 0;
        #20;
        reset = 0;
        send_event(4'b0001);
        send_event(4'b0010);
        send_event(4'b0011);
        send_event(4'b0100);
        #10;
        $display("FIFO FULL = %b", fifo_full);
        output_ready = 1;
        wait(fifo_empty);
        #20;
        send_event(4'b1111);
        wait(fifo_empty);
        #20;
        $display("SIMULATION COMPLETED");
        $finish;
    end
endmodule

