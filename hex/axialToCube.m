function xyz = axialToCube(qr)
x = qr(1);
z = qr(2);
y = -x-z;
xyz = [x,y,z];
end