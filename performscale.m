function [x_dir] = performscale(u_dir,t)
% Scale direction vectors in u_dir by values in t 
x_dir = u_dir;
[~,n_pts] = size(x_dir);
for ii = 1 : n_pts
    x_dir(:,ii) = x_dir(:,ii) * t(ii,1);
end
end