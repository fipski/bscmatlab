%% Draws Square around X
%  X is center point
%  a length of Square
function drawRec(X,a)

xhex=[-a/2 -a/2 a/2 a/2 -a/2]; % x-coordinates of the vertices
yhex=[a/2 -a/2 -a/2 a/2 a/2]; % y-coordinates of the vertices

line(xhex+X(1,1),yhex+X(2,1))

end