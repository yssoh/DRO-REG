function [x_dir] = gauge2radial(u_dir,t)
% Converts the gauge function evaluations in t to a list of vectors in R2
% that represents the level set, given by u_dir
% Input : u_dir = list of unit vectors in R2
%       : t = vector of gauge function evaluations in the direction u_dir
[~,n_pts] = size(u_dir);
x_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    x_dir(:,ii) = u_dir(:,ii) / t(ii);
end
x_dir = [x_dir, x_dir(:,1)];

end