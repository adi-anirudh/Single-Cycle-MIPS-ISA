module control
(
    input[5:0] opcode,
    input reset,
    output reg[1:0] reg_dst, mem_to_reg, alu_op,
    output reg jump, branch, mem_read, mem_write, alu_src, reg_write, sign_or_zero

);
always@(*)
begin
    if(reset==1'b1) begin
        reg_dst=2'b00;
        mem_to_reg=2'b00;
        alu_op=2'b00;
        jump=1'b0;
        branch=1'b0;
        mem_read=1'b0;
        mem_write=1'b0;
        alu_src=1'b0;
        reg_write=1'b0;
        sign_or_zero=1'b1;
    end
    else begin
        case(opcode)
        6'b000000://add, sub, slt, and, or
            begin
                reg_dst = 2'b01;
                mem_to_reg=2'b00;
                alu_op=2'b10;
                jump=1'b0;
                branch=1'b0;
                mem_read=1'b0;
                mem_write=1'b0;
                alu_src =1'b0;
                reg_write=1'b1;
                sign_or_zero=1'b1;
            end
        6'b000010:
            begin//j
                reg_dst=2'b00;
                mem_to_reg=2'b00;
                alu_op=2'b00;
                jump=1'b1;
                branch=1'b0;
                mem_read=1'b0;
                mem_write=1'b0;
                alu_src=1'b0;
                reg_write=1'b0;
                sign_or_zero=1'b1;
            end
        4'b100011: 
            begin//lw
                reg_dst=2'b00;
                mem_to_reg=2'b01;
                alu_op=2'b11;
                jump=1'b0;
                branch=1'b0;
                mem_read=1'b1;
                mem_write=1'b0;
                alu_src=1'b1;
                reg_write=1'b1;
                sign_or_zero=1'b1;
            end
        6'b101011: 
            begin//sw
                reg_dst=2'b00;
                mem_to_reg=2'b00;
                alu_op=2'b11;
                jump=1'b0;
                branch=1'b0;
                mem_read=1'b0;
                mem_write=1'b1;
                alu_src=1'b1;
                reg_write=1'b0;
                sign_or_zero=1'b1;
            end
        6'b001000: 
            begin//addi
                reg_dst=2'b00;
                mem_to_reg=2'b00;
                alu_op=2'b00;
                jump=1'b0;
                branch=1'b0;
                mem_read=1'b0;
                mem_write=1'b0;
                alu_src=1'b0;
                reg_write=1'b1;
                sign_or_zero=1'b1;
            end
        default: 
            begin
                reg_dst=2'b01;
                mem_to_reg=2'b00;
                alu_op=2'b00;
                jump=1'b0;
                branch=1'b0;
                mem_read=1'b0;
                mem_write=1'b0;
                alu_src=1'b0;
                reg_write=1'b1;
                sign_or_zero=1'b1;
            end
        endcase
    end
end
endmodule  




        


        
