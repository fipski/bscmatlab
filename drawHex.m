%% input A[x,y] vector, diameter d
%  draws hexagon around x,y of


function drawHex(A,d)
r=d/2;
xhex=[-r/2 -r -r/2 r/2 r r/2 -r/2]; % x-coordinates of the vertices
yhex=[r*sqrt(3)/2 0 -r*sqrt(3)/2 -r*sqrt(3)/2 0 r*sqrt(3)/2 r*sqrt(3)/2]; % y-coordinates of the vertices

line(xhex+A(1,1),yhex+A(2,1));

end