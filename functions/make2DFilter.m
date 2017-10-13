% function filt2D = make2DFilter(inputFilter,f)
% Makes 2D filter from 1D filter for filtering 2D signals/images
% J. Macoskey

l = length(inputFilter);
if l > 1000
    rate = round(l/1000);
    inputFilter = decimate(inputFilter,rate);
    fd = decimate(f,rate);
end

%%
fmax = max(fd);
maximum = max(inputFilter(:));

x = linspace(-pi,pi,length(inputFilter));
y = linspace(-pi,pi,length(inputFilter));
[xx,yy] = meshgrid(x,y);
F2 = zeros(size(xx));
for i = 1:length(xx)
    for j = 1:length(yy)
        r(i,j) = round(sqrt(xx(i,j).^2+yy(i,j).^2)./sqrt(2*pi^2)*1000);
        F2(i,j) = inputFilter(r(i,j));
    end
end
imagesc(fd,fd,F2), colormap gray
axis square

% end