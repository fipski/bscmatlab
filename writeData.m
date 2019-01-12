function O = writeData(E,str)

for i=1:length(E(1,1,:))
    I = E(:,:,i).';
    file = ['tex/',str,num2str(i),'.png'];
    im = mat2gray(I).*256;
    imwrite(im,blackbody(256),file)
    
end
