function [] = plotandsave(x_dir,fname)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
axis off
pbaspect([1 1 1])
hold on
plot(x_dir(1,:),x_dir(2,:),'-','LineWidth',1.5)
hold off
saveas(gcf,fname)
end