function imageWithNonSqrPixDemo2

narginchk(0,0);

X = reshape(1:20, 4, []).';

figure('Color', 'w', 'NumberTitle', 'Off', ...
    'Name', 'Demo 2 - imageWithNonSqrPix.m - Indexed colors')
colormap(jet(20));

subplot(351);
image(X);
title('image(X)')
axis image

subplot(352);
imageWithNonSqrPix(X,'dsk',1);
axis equal tight
title('imageWithNonSqrPix(X, ''dsk'', 1)')

subplot(353);
imageWithNonSqrPix(X,'dsk',2);
axis equal tight
title('imageWithNonSqrPix(X, ''dsk'', 2)')

subplot(354);
imageWithNonSqrPix(X,'dsk',3);
axis equal tight
title('imageWithNonSqrPix(X, ''dsk'', 3)')

subplot(355);
imageWithNonSqrPix(X,'dsk',4);
axis equal tight
title('imageWithNonSqrPix(X, ''dsk'', 4)')

subplot(356);
imageWithNonSqrPix(X,'dsk',5);
axis equal tight
title('imageWithNonSqrPix(X, ''dsk'', 5)')

subplot(357);
imageWithNonSqrPix(X,'rhb',1);
axis equal tight
title('imageWithNonSqrPix(X, ''rhb'', 1)')

subplot(358);
imageWithNonSqrPix(X,'rhb',2);
axis equal tight
title('imageWithNonSqrPix(X, ''rhb'', 2)')

subplot(359);
imageWithNonSqrPix(X,'rhb',3);
axis equal tight
title('imageWithNonSqrPix(X, ''rhb'', 3)')

subplot(3,5,10);
imageWithNonSqrPix(X,'rhb',4);
axis equal tight
title('imageWithNonSqrPix(X, ''rhb'', 4)')

subplot(3,5,11);
imageWithNonSqrPix(X,'rhb',5);
axis equal tight
title('imageWithNonSqrPix(X, ''rhb'', 5)')

subplot(3,5,12);
imageWithNonSqrPix(X,'hex',1);
axis equal tight
title('imageWithNonSqrPix(X, ''hex'', 1)')

subplot(3,5,13);
imageWithNonSqrPix(X,'hex',2);
axis equal tight
title('imageWithNonSqrPix(X, ''hex'', 2)')

subplot(3,5,14);
imageWithNonSqrPix(X,'hex',3);
axis equal tight
title('imageWithNonSqrPix(X, ''hex'', 3)')

subplot(3,5,15);
imageWithNonSqrPix(X,'oct',1);
axis equal tight
title('imageWithNonSqrPix(X, ''oct'', 1)')
