function ret = readLdata(filename)
% read LMK Labsoft csv Data
copyfile( filename, 'comma2point.txt' );
comma2point_overwrite( 'comma2point.txt' );
ret = dlmread('comma2point.txt');
end