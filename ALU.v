module alu
(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_control,
    output reg[31:0] result,
    output zero
);

always@(*)
begin
    case(alu_control)
    4'b0010: result = a+b;
    4'b0110: result = a-b;
    4'b0000: result = a&b;
    4'b0001: result = a|b;
    4'b0111: begin
                 if (a<b) result = 16'd1;
                 else
                    result = 16'd0;
            end
    default: result = a+b;
    endcase
end

assign zero=(result==16'd0)? 1'b1: 1'b0;
endmodule

