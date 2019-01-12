function qrMatrix = mapMatrix(cols,rows,M,size)

qrMatrix = zeros(rows,cols);

[n,m] = getMappingMatrixSize(cols,rows,size);
B = getEvenrMappingMatrix(m,n,size);


for col = 1:cols
    for row = 1:rows
        [rety retx] = find(B(:,:,1) == col & B(:,:,2) == row);
        
        rgbw = zeros(numel(retx),4);
        
        for i = 1:numel(retx)
            rgbw(i,:) = M(rety(i),retx(i),:) ;
        end
        
        qrMatrix(row,col,1:4) = round(mean(rgbw));

                
    end
end
end
