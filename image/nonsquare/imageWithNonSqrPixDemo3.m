function imageWithNonSqrPixDemo3

narginchk(0,0);

figure('Color', 'w', 'NumberTitle', 'Off', ...
    'Name', 'Demo 3 - imageWithNonSqrPix.m - MATLAB logo with hexagonal pixels')

X = imread('matlabicon.png', 'png');
imageWithNonSqrPix(X,'hex',2);
axis off