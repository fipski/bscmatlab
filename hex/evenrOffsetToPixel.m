function xy = evenrOffsetToPixel(qr,size)
q = qr(1);
r = qr(2);
x = size * sqrt(3) * (q - 0.5 * mod(r,2));
y = size * 3/2 * r;
xy = [x,y];
end