%
O20001 (Surface probe a part)
(Do not use this code without g54 in lower left corner)

(user input area)
#10010= 27. (width of part in inches)
#10011= 11. (height of part in inches)
#10001= 1. (scan distance in inches)
#10004= 1. (SCAN IN Y SPACING) 
#10012= 10 (probe is what tool number)

(initilize variables, alter #10004 if not isotropic spacing)
#10002= 0. (Start postion in x)
#10003= 0. (Spacing in Y)

(MOVE TO CORNER TO START SCAN )
G43 G54 H#10012 
G1 G54 X0. Y0. Z1. F300. 

G65 P9832 (enable Probe)
G103 P1  (stop look ahead)
G65 P9810 Z.25 F80.

WHILE[#10003 LE [ #10011 ] ] DO2

WHILE[#10002 LT #10010]  DO1
G65 P9810 X[ #10002 ] F400. 
G65 P9811 Z-0.05 
DPRNT[#5041[24]*#5042[24]*#10187[24]] 
#10002=#10002+#10001
END1

#10002= 0. 
#10003= #10003 + #10004 
IF [ #10003 LE #10011 ] GOTO10 
IF [ #10003 GT #10011 ] GOTO20 
N10 G65 P9810 Y[#10003] X#10002 F400. 
N20 
END2

G65 P9833 (TURN PROBE OFF)
G103 P0. (enable look ahead)

M30
%