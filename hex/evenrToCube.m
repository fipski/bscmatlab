function xyz = evenrToCube(qr)
q = qr(1);
r = qr(2);
x = q - (r + mod(r,2)) / 2;
z = r;
y = -x-z;
xyz = [x,y,z];