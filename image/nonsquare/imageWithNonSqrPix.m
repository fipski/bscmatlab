function h = imageWithNonSqrPix(X,shape,pattern,ax)
%imageWithNonSqrPix Display image object with non-square pixels
%
%   imageWithNonSqrPix(X, SHAPE, PATTERN) displays matrix X as an image
%   with non-square pixels. SHAPE is a string that sets the shape of the
%   pixels. PATTERN is a scalar value that sets the pattern used to align
%   the pixels. See table below:
%
%                  +-------+--------------------+
%                  | Shape | Patterns available |
%        +---------+-------+--------------------+
%        | Disk    | 'dsk' | 1 2 3 4 5          |
%        | Hexagon | 'hex' | 1 2 3              |
%        | Octagon | 'oct' | 1                  |
%        | Rhombus | 'rhb' | 1 2 3 4 5          |
%        +---------+-------+--------------------+
%
%   Run the <a href="matlab:imageWithNonSqrPixDemo1;imageWithNonSqrPixDemo2;imageWithNonSqrPixDemo3;">demos</a> for better understanding of the pattern concept.      
%
%   handle = imageWithNonSqrPix(...) returns a patch object handle.
%
%   imageWithNonSqrPix mimics the high-level form of the function <a
%   href="matlab:help image">image</a>. 
%   Image data can be either indexed or true color. Image data can be of
%   class uint8, uint16, logical or double.
%
%   Example:
%
%       X = imread('matlabicon.png', 'png');
%       imageWithNonSqrPix(X,'hex',2);
%       axis off
%
%   See also image.
%

% Author  : Jerome Briot
%       http://www.mathworks.com/matlabcentral/fileexchange/authors/21984
% Contact : dutmatlab#at#yahoo#dot#fr
% Version : 1.0 - 12 Oct 2010
%           1.1 - 13 Oct 2010 : Add patterns for hexagonal shape
%           1.2 - 06 Nov 2013 : Add patterns for circular shape
%           2.0 - 18 Nov 2013 : New algorithm
%

narginchk(3,4);

if nargin==3
    ax = gca;
end

ndX = ndims(X);

if ndX == 2 %Indexed
    cdata = X(:).';
elseif ndX == 3 %RGB
    nX = size(X,1)*size(X,2);
    cdata = reshape(X,1,nX,3);
else
    error('imageWithNonSqrPix:WrongCData', ...
        'Indexed CData must be size [MxN], TrueColor CData must be size [MxNx3]')
end

switch class(X)
    
    case 'double'
        % Nothing to do
        
    case {'uint8' 'uint16'}
        if ndX==3
            v = intmax(class(X));
            cdata = double(cdata)/double(v);
        else
            cdata = double(cdata)+1;
        end  
        
    case 'logical'
        cdata = double(cdata); 
        
    otherwise
        error('imageWithNonSqrPix:WrongClass', ...
            'Image data msut be of class uint8, uint16, logical or double')
end

if ndX==3 && (any(cdata(:)<0) || any(cdata(:)>1))
    error('imageWithNonSqrPix:WrongTrueColorCData', ...
        'TrueColor CData contains element out of range 0.0 <= value <= 1.0')
end

offsetx = [];
offsety = [];

switch shape
    
    case 'dsk'
        
        th = linspace(0,2*pi,150);
        r = 0.5;
        
        if pattern==1
            dx = 1;
            dy = 1;
        elseif pattern==2
            dx = sqrt(3)/2;
            dy = 0.5;
        elseif pattern==3
            dx = sqrt(3)/2;
            dy = -0.5;
        elseif pattern==4
            dx = 0.5;
            dy = sqrt(3)/2;
        elseif pattern==5
            dx = -0.5;
            dy = sqrt(3)/2;
        else
            error('imageWithNonSqrPix:WrongLastArgCirc', ...
                'Last argument must be 1, 2, 3, 4 or 5 (disk)');
        end
        
    case 'rhb'
        
        th = linspace(0,2*pi,5);
        r = 0.5;
        
        if pattern==1
            dx = 1;
            dy = 1;
        elseif pattern==2
            dx = 0.5;
            dy = -0.5;
        elseif pattern==3
            dx = 0.5;
            dy = 0.5;
        elseif pattern==4
            dx = 0.5;
            dy = 0.5;
        elseif pattern==5
            dx = -0.5;
            dy = 0.5;
        else
            error('imageWithNonSqrPix:WrongLastArgRhb', ...
                'Last argument must be 1, 2, 3, 4 or 5 (rhombus)');
        end
        
    case 'hex'
        
        th = linspace(0,2*pi,7);
        r = 0.5;
        
        if pattern==1
            dx = 1;
            dy = sqrt(3)/2;
        elseif pattern==2
            dx = 1.5*r;
            dy = -r*cos(pi/6);
        elseif pattern==3
            dx = 1.5*r;
            dy = r*cos(pi/6);
        else
            error('imageWithNonSqrPix:WrongLastArgHex', ...
                'Last argument must be 1, 2 or 3 (hexagon)');
        end
        
    case 'oct'
        
        th = linspace(0,2*pi,9);
        r = 0.5;
        
        if pattern==1
            dx = 1;
            dy = 1;
        else
            error('imageWithNonSqrPix:WrongLastArgOct', ...
                'Last argument must be 1 (octagon)');
        end
        
    otherwise
        
        error('imageWithNonSqrPix:WrongShape', ...
            'The shape argument must be one of ''rhb'', ''oct'', ''hex'' or ''dsk''}')
        
end

getoffsets;

xshape = r*cos(th(:));
yshape = r*sin(th(:));

xshape = bsxfun(@plus, xshape, offsetx(:).');
yshape = bsxfun(@plus, yshape, offsety(:).');

h = patch(xshape, yshape, 'r', ...
    'facecolor', 'flat', ...
    'cdata', cdata, ...
    'edgecolor', 'none', ...
    'parent', ax);

% Set axes properties to mimics high-level form of image/imagesc
axis equal ij tight
set(ax, 'layer', 'top', 'box', 'on')
view(0,90);

    function getoffsets
        
        if pattern==1
            
            [offsetx,offsety] = meshgrid(0:size(X,2)-1, 0:size(X,1)-1);
            
            offsetx = offsetx*dx;
            offsety = offsety*dy;
            
        elseif pattern==2
            
            offsetx = 0:size(X,2)-1;
            offsetx = offsetx*dx;
            offsetx = repmat(offsetx, size(X,1),1);
            
            offsety = zeros(1, size(X,2));
            offsety(2:2:end) = dy;
            offsety = repmat(offsety, size(X,1),1);
            
            if strncmp(shape,'hex',3)
                offsety = bsxfun(@plus, offsety,sqrt(3)/2*(0:size(X,1)-1).');
            else
                offsety = bsxfun(@plus, offsety,(0:size(X,1)-1).');
            end
            
        elseif pattern==3
            
            offsetx = 0:size(X,2)-1;
            offsetx = offsetx*dx;
            offsetx = repmat(offsetx, size(X,1),1);
            
            offsety = zeros(1, size(X,2));
            offsety(2:2:end) = dy;
            offsety = repmat(offsety, size(X,1),1);
            
            if strncmp(shape,'hex',3)
                offsety = bsxfun(@plus, offsety, sqrt(3)/2*(0:size(X,1)-1).');
            else
                offsety = bsxfun(@plus, offsety, (0:size(X,1)-1).');
            end
            
        elseif pattern==4
            
            offsetx = zeros(1, size(X,1));
            offsetx(2:2:end) = dx;
            offsetx = repmat(offsetx, size(X,2),1);
            offsetx = bsxfun(@plus, offsetx, (0:size(X,2)-1).').';
            
            offsety = 0:size(X,1)-1;
            offsety = offsety*dy;
            offsety = repmat(offsety, size(X,2),1).';
            
        elseif pattern==5
            
            offsetx = zeros(1, size(X,1));
            offsetx(2:2:end) = dx;
            offsetx = repmat(offsetx, size(X,2),1);
            offsetx = bsxfun(@plus, offsetx, (0:size(X,2)-1).').';
            
            offsety = 0:size(X,1)-1;
            offsety = offsety*dy;
            offsety = repmat(offsety, size(X,2),1).';
            
        else
            
            error('imageWithNonSqrPix:WrongLastArg', ...
                'Last argument ''pattern'' must be 1, 2, 3, 4 or 5');
            
        end
        
    end

end