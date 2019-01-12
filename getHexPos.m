%% See https://www.redblobgames.com/grids/hexagons/
%  flat Rectangle, odd columns offset
%  d = distance between centers
%  i = x elem
%  A(1,1) x value A(1,2) y value input
%  X(1,1) x value X(1,2) y value output

function X = getHexPos(A,d)

h=sqrt(3)/2*d;
i=A(1,1); % x
j=A(2,1); % y

X(1,1) = i*d*0.75;
if(mod(i,2)==0)
    X(2,1) = j*h; %gerade reihen y wert
else
    X(2,1) = j*h+h/2; %ungerade reiehn y wert
end

end