function xy = pointyHexToPixel(qr, size)
q = qr(1);
r = qr(2);
x = size * (sqrt(3) * q  +  sqrt(3)/2 * r);
y = size * (                     3./2 * r);
xy = [x, y];
end