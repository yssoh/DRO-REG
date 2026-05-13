%% Experiments for computing examples of DRO Regularizers
% Generating the directions for the dataset
% n=2000pts - takes a while!
clear; clc;
n_pts = 2000;
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

%% L0 Example
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 1;
a_weights(2*n_pts/4,1) = 1;
a_weights(3*n_pts/4,1) = 1;
a_weights(4*n_pts/4,1) = 1;

%% Setting up the L1 cost (W1-distance)
C = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    for jj = 1 : n_pts
        C(ii,jj) = min([abs(ii-jj),abs(ii-jj-n_pts),abs(ii-jj+n_pts)])/n_pts;
    end
end

%% Computing DRO for eps = 0.01
EPS = 0.01;
t = solver_DROREG(a_weights,C,EPS);
x_dir = gauge2radial(u_dir,t);
plotandsave(x_dir,'images/dro_L0_eps001_n2000.png')
