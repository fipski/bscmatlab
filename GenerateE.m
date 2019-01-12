function E = GenerateE(x,y,a,b,h,I_0)
E = I_0*h.^2./((x-a).^2+(y-b).^2+h.^2).^2;
end