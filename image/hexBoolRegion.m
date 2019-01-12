function B = hexBoolRegion()
ri=30;
ra=35;

L = linspace(0,2*pi,7);
xv = round(35*sin(L)');
yv = round(35*cos(L)');



xd = [-30 30 -30 -30]';
yd = [30 -30 -30 30]';

i=1;
for m = -ri:ri
    for n = -ra:ra
        xq(i) = m;
        yq(i) = n;
        i = i + 1;
    end
end

[inh,~] = inpolygon(xq,yq,xv,yv);

% figure

% plot(xv,yv) % polygon
% axis equal
% hold on
% plot(xd,yd)
% onh(ind)=false;
% plot(xq(inh),yq(inh),'r+') % points inside
% plot(xq(onh),yq(onh),'bo')
% %plot(xq(~in),yq(~in),'bo') % points outside
% hold off
B = false(2*ra+1,2*ri+1);
B(inh)=true;
B=B(2:71,2:61);

end