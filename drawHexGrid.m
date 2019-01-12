function drawHex(x0,y0,l,b,r)

    xhex=[-r/2 -r -r/2 r/2 r r/2 -r/2]; % x-coordinates of the vertices
    yhex=[r*sqrt(3)/2 0 -r*sqrt(3)/2 -r*sqrt(3)/2 0 r*sqrt(3)/2 r*sqrt(3)/2]; % y-coordinates of the vertices
    
    for i=1:l
        for j=1:b
            line(xhex+(i-1)*3*r,yhex+(j-1)*r*sqrt(3))
            line(xhex+3/2*r+(i-1)*3*r,yhex+r*sqrt(3)/2+(j-1)*r*sqrt(3))
            
            hold on
            
        end
    end
end