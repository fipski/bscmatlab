function C = blackbody(N)
%VIRIDIS Blue-green-yellow colour map
%   VIRIDIS(N) returns an N-by-3 matrix containing a colormap. 
%   The colors begin with dark purplish-blue and blue, range
%   through green and end with yellow. 
%   
%   VIRIDIS is the new default colormap for matplotlib
%  
  

mat = csvread('black-body-table-float-0256.csv',1,1)

P = size(mat,1);

if nargin < 1
   N = P;
end

N = min(N,P);
C = interp1(1:P, mat, linspace(1,P,N), 'linear');
