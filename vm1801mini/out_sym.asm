       mov  #140000,  R0           ; 15C0 C000
       mov  #1000,    R1           ; 15C1 0200
loop:
       movb (R1)+,    (R0)         ; 1050
       add  #8d,      R0           ; 
       cmp  #1010,    R1           ; 25C1 0208
       bne  loop                   ; 02FA
halt:
       jmp  halt                   ; 0077 FFFC

fffc_0077_02fc_0208_25C1_0008_65c0_9448_0200_15c1_C000_15c0

0000  15c0 | 003c  0000 | 0078  0000 | 00b4  0000
0002  c000 | 003e  0000 | 007a  0000 | 00b6  0000
0004  15c1 | 0040  0000 | 007c  0000 | 00b8  0000
0006  0200 | 0042  0000 | 007e  0000 | 00ba  0000
0008  9448 | 0044  0000 | 0080  0000 | 00bc  0000
000a  65c0 | 0046  0000 | 0082  0000 | 00be  0000
000c  0008 | 0048  0000 | 0084  0000 | 00c0  0000
000e  25c1 | 004a  0000 | 0086  0000 | 00c2  0000
0010  0208 | 004c  0000 | 0088  0000 | 00c4  0000
0012  02fa | 004e  0000 | 008a  0000 | 00c6  0000
0014  0077 | 0050  0000 | 008c  0000 | 00c8  0000
0016  fffc