function [x,y] = getMappingMatrixSize(x,y,size)

% h and w of a hex pixel, size is length of one side
height = 2*size;
width = size*sqrt(3);

% add border to avoid half pixels
x = x+1;
y = y+1; 

% define a size for the Matrix
x = round((x+2)*width);
y = round((y+2)*0.75*height);