function qr = pixelToPointyHex(xy, size)
q = (sqrt(3)/3 * xy(1)  -  1./3 * xy(2)) / size;
r = (                      2./3 * xy(2)) / size;
qr = [q,r];
end