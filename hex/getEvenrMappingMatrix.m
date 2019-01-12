function B = getEvenrMappingMatrix(n,m,size)
% [n,m] = getMappingMatrixSize(n,m,size);

B = zeros(n,m);

for i = 1:m
    for j = 1:n
        ret = pixelToPointyHex([i,j], size);
        ret = axialToCube(ret);
        ret = cubeRound(ret);
        ret = cubeToEvenr(ret);
        B(j,i,1) = ret(1);
        B(j,i,2) = ret(2);
    end
end

end