function qr = cubeToEvenr(xyz)
x = xyz(1);
y = xyz(2);
z = xyz(3);
q = x + (z + mod(z,2)) / 2;
r = z;
qr = [q,r];
end