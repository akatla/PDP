/*
// ���������������� ��������
// 38400���/���
// 8���, ��� ��������
module serial_rx(
    input wire reset,
    input wire clk,
    input wire rx,
    output reg [7:0]rxbyte,
    output ready
    );

//�������� ������ � �������� ������������ ���� ����������
//��� ���������� �� ���. �������� ������� 185,142857 Mhz � �������� �������� 38400
//��� (162000000)/38400 ~ 4219
//��� (152000000)/38400 ~ 3958 
//��� (153600000)/38400 = 4000 
//��� (156000000)/38400 ~ 4063
//��� (157714286)/38400 ~ 4107
//��� (185142857)/38400 ~ 4821
//��� (192000000)/38400 = 5000
// 920000000/38400 ~ 2396 
parameter RCONST = 2395; 

reg [3:0]num_bits = 9; //������� �������� ���
reg [7:0]shift_reg; //��������� ������� ���������
reg [11:0]cnt;
reg bit9 = 1'b0;
reg rxrd = 1'b0;

//assign rx_byte = shift_reg;

//������� ������������ ������������ ����
always @(posedge clk or negedge reset)
begin
    if(!reset)
        cnt <= 0;
    else
    begin
        if(cnt == RCONST || num_bits==9)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;
    end
end

assign ready = rxrd & !bit9;

//��������
always @(posedge clk or negedge reset)
begin
    if(!reset) begin
        num_bits <= 9;
        shift_reg <= 0;
                  bit9 <= 1'b0;
                  rxrd <= 1'b0;
    end
    else begin
        //����� ���������� ����� RX ������ � ����
        if(num_bits==9 && rx==1'b0) begin
            num_bits <= 0;
        end    
        else if(cnt == RCONST) begin
            num_bits <= num_bits + 1'b1;
                  end
        
        //�������� ��������� ���� ���-�� ����������
        if(cnt == RCONST/2) shift_reg <= {rx,shift_reg[7:1]};

        bit9 <= (bit9)? !(num_bits==9) : (num_bits == 8);
        rxrd <= bit9;
    end
end

//������ ���������� ��������� �����        
always@(posedge clk) begin
      rxbyte <= shift_reg;
end    
endmodule
*/

// ���������������� ��������
// 38400���/���
// 8���, ��� ��������
module serial_rx(
    input wire reset,
    input wire clk,
    input wire rx,
    input wire rxread,
    output [7:0]rxbyte,
    output reg ready = 0
);

//�������� ������ � �������� ������������ ���� ����������
//��� ���������� �� ���. �������� ������� 185,142857 Mhz � �������� �������� 38400
//��� (162000000)/38400 ~ 4219
//��� (152000000)/38400 ~ 3958 
//��� (153600000)/38400 = 4000 
//��� (156000000)/38400 ~ 4063
//��� (157714286)/38400 ~ 4107
//��� (185142857)/38400 ~ 4821
//��� (192000000)/38400 = 5000
// 920000000/38400 ~ 2396 
parameter RCONST = 2396; 

reg [3:0]num_bits = 10;     //������� �������� ���
reg [7:0]shift_reg = 0;    //��������� ������� ���������
reg [11:0]cnt = 0;         //������� ������������ ��������

assign rxbyte = shift_reg;

//��������
always @(posedge clk or negedge reset)
begin
    if(!reset) begin
        num_bits <= 4'd10;
        shift_reg <= 0;
        cnt <= 0;
        ready <= 0;
    end
    else begin
        //����� ���������� ����� RX ������ � ����
        if(num_bits == 4'd10 && rx == 1'b0)
            num_bits <= 4'd0;
        else if(cnt == RCONST)
		      num_bits <= num_bits + 1'b1;

        //�������� ��������� ���� ���-�� ����������, ���� ��� �� ����-���� (9 ���, � �.�)
        if(cnt == RCONST/2 && num_bits < 4'd9) shift_reg <= {rx,shift_reg[7:1]};

        //������� ������������ ������������ ����
        cnt <= (cnt == RCONST || num_bits == 4'd10)? 12'd0 : cnt + 1'b1;

        // �������� ���������� �� ������ ����-����
        ready <= (ready)? !rxread : (cnt == RCONST/2 && num_bits == 4'd9);
    end
end

endmodule


// ���������������� ���������� UART
// 38400���/���
// 8���, ��� ��������
module serial_tx(
    input reset,
    input clk,
    input [7:0]sbyte,
    input send,
    output tx,
    output reg busy = 1'b0
    );

parameter RCONST = 2396; 

//����������
reg [8:0]send_reg = 9'b1_1111_1111;
reg [3:0]send_num = 10;
reg [11:0]send_cnt;

wire send_time;
assign send_time = (send_cnt == RCONST);
assign tx = send_reg[0];

always @(posedge clk or negedge reset)
begin
        if(!reset)
        begin
//                send_reg <= 0; 
                send_num <= 10;
                send_cnt <= 0;
        end
        else
        begin
                //�������� ���������� �� ������� send
                if(send) begin
                        //��������� ������������ ���� � ��������� ������� �� ������� send
                        send_reg <= {sbyte,1'b0};
                        send_num <= 0;
                end
                else if(send_time && send_num != 10) begin
                        //��������� ������������ ����
                        send_reg <= {1'b1,send_reg[8:1]};
                        send_num <= send_num + 1'b1;
                end
                send_cnt <= (send | send_time)? 12'd0 : send_cnt + 1'b1; 
        end
end

always@(posedge clk)
begin
        busy <= (send_num != 10);
end
        
endmodule
