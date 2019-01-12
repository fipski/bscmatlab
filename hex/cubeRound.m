function rXYZ = cubeRound(xyz)
x = xyz(1);
y = xyz(2);
z = xyz(3);
rx = round(x);
ry = round(y);
rz = round(z);

x_diff = abs(rx - x);
y_diff = abs(ry - y);
z_diff = abs(rz - z);

if and(x_diff > y_diff, x_diff > z_diff)
    rx = -ry-rz;
else if y_diff > z_diff
        ry = -rx-rz;
    else
        rz = -rx-ry;
    end
end
rXYZ = [rx, ry, rz];
end