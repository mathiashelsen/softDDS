#!/opt/anaconda3/bin/python

import sys
import math

if(len(sys.argv) != 3):
    print("Usage: ./gen_sin_lut [INPUT_WIDTH] [OUTPUT_WIDTH]")
else:
    
    inputWidth = 2**int(sys.argv[1]);
    outputWidth = 2**int(sys.argv[2]);

    fileName = 'sin_lut_' + sys.argv[1] + 'x' + sys.argv[2] + '.v'
    fileOut = open(fileName, 'w')
    fileIn = open('sin_lut.template', 'r')

    stringOut = 'module sin_lut_' + sys.argv[1] + 'x' + sys.argv[2] + '( clk, addr, data );\n\n' 
    fileOut.write(stringOut)

    stringOut = '\nparameter INPUT_WIDTH\t= ' + sys.argv[1] + ';\n';
    fileOut.write(stringOut)
    stringOut = 'parameter OUTPUT_WIDTH\t= ' + sys.argv[2] + ';\n\n';
    fileOut.write(stringOut)

    for i in range(6):
        stringIn = fileIn.readline()
        fileOut.write(stringIn)

    stringOut = '\n'
    fileOut.write(stringOut)


    for i in range(inputWidth):
        floatValue  = math.sin(math.pi*float(i)/float(inputWidth-1)/2.0) 
        intValue    = round((outputWidth-1) * floatValue);
        stringOut = '\tlut[' + str(i) + ']\t\t=\t' + sys.argv[2] + '\'b' + bin(intValue)[2:] + ';\n';
        fileOut.write(stringOut)

    for line in fileIn:
        fileOut.write(line)

    fileOut.close()

