module ALUControl(ALU_Control, ALUOp, Function);
    output reg[3:0] ALU_Control;
input [1:0] ALUOp;
input [5:0] Function;
wire [5:0] ALUControlIn;
assign ALUCOntrolIn = {ALUOp, Function};
always@(ALUControlIn)
casex(ALUControlIn)
    8'b00xxxxxx: ALU_Control=4'b0010;// add for LW and SW
    8'b01xxxxxx: ALU_Control=4'b0110;// sub for branch equal
    8'b10100000: ALU_Control=4'b0010;// R type add
    8'b10100010: ALU_Control=4'b0110;// R type sub
    8'b10100100: ALU_Control=3'b0000;// R type and
    8'b10100101: ALU_Control=3'b0001;// R type or
    8'b10101010: ALU_Control=3'b0111;// R type slti
    
    default: ALU_Control=3'b000;
endcase
endmodule

module JR_Control(input [1:0] alu_op, input[5:0] funct, output JRControl);
    assign JR_Control=({alu_op,funct}==8b'11100000) ? 1'b1 : 1'b0;
endmodule
