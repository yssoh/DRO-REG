%% Experiment with convex bodies
clear; close all; clc;

n_pts = 100; % Number of points
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

%% L1-norm example

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 0.25;
a_weights(2*n_pts/4,1) = 0.25;
a_weights(3*n_pts/4,1) = 0.25;
a_weights(4*n_pts/4,1) = 0.25;
w_dir = performradialprojections(u_dir,1./a_weights);

visualize_radialbody(w_dir)
axis off
xlim([-0.3,0.3])
ylim([-0.3,0.3])
saveas(gcf,'images/cvx_L1_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.7,0.7])
ylim([-0.7,0.7])
saveas(gcf,'images/cvx_L1_homodata.png')

%% Algorithm, Plot

t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,100,2000);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-4.5,4.5])
ylim([-4.5,4.5])
saveas(gcf,'images/cvx_L1_reg.png')

%% Uneven L1-norm example

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 0.1;
a_weights(2*n_pts/4,1) = 0.2;
a_weights(3*n_pts/4,1) = 0.3;
a_weights(4*n_pts/4,1) = 0.4;
w_dir = performradialprojections(u_dir,1./a_weights);

visualize_radialbody(w_dir)
axis off
xlim([-0.5,0.5])
ylim([-0.5,0.5])
saveas(gcf,'images/cvx_unevenL1_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.8,0.8])
ylim([-0.8,0.8])
saveas(gcf,'images/cvx_unevenL1_homodata.png')

%%

t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,100,20000);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-6,6])
ylim([-6,6])
saveas(gcf,'images/cvx_unevenL1_reg.png')

%% Uniform ball

% Data supported on standard basis vectors
a_weights = ones(n_pts,1)/(2*pi);
w_dir = performradialprojections(u_dir,1./a_weights);

visualize_radialbody(w_dir)
axis off
xlim([-0.18,0.18])
ylim([-0.18,0.18])
saveas(gcf,'images/cvx_L2_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.6,0.6])
ylim([-0.6,0.6])
saveas(gcf,'images/cvx_L2_homodata.png')

%%

t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,100,200);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-3.5,3.5])
ylim([-3.5,3.5])
saveas(gcf,'images/cvx_L2_reg.png')

%% Laplace L1

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
for ii = 1 : n_pts
    arg = 2*pi*ii/n_pts;
    c = cos(arg); s = sin(arg);
    a_weights(ii) = 2/(abs(c)+abs(s))^3;
end
a_weights = a_weights/sum(a_weights);
w_dir = performscale(u_dir,a_weights);

visualize_radialbody(w_dir)
axis off
xlim([-0.02,0.02])
ylim([-0.02,0.02])
saveas(gcf,'images/cvx_L1Laplace_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.3,0.3])
ylim([-0.3,0.3])
saveas(gcf,'images/cvx_L1Laplace_homodata.png')

%%

t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,500,2000);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-4.5,4.5])
ylim([-4.5,4.5])
saveas(gcf,'images/cvx_L1Laplace_reg.png')

%% L1

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
for ii = 1 : n_pts
    arg = 2*pi*ii/n_pts;
    c = cos(arg); s = sin(arg);
    a_weights(ii) = 1/(abs(c)+abs(s));
end
a_weights = a_weights/sum(a_weights);
w_dir = performscale(u_dir,a_weights);

visualize_radialbody(w_dir)
axis off
xlim([-0.014,0.014])
ylim([-0.014,0.014])
saveas(gcf,'images/cvx_L1full_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.25,0.25])
ylim([-0.25,0.25])
saveas(gcf,'images/cvx_L1full_homodata.png')

%%
t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,500,2000);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-4,4])
ylim([-4,4])
saveas(gcf,'images/cvx_L1full_reg.png')

%% Laplace L0.5

% Data supported on standard basis vectors
p = 0.5;
a_weights = zeros(n_pts,1);
for ii = 1 : n_pts
    arg = 2*pi*ii/n_pts;
    c = cos(arg); s = sin(arg);
    vv = (abs(c)^p + abs(s)^p)^(1/p);
    a_weights(ii) = 2/(vv)^3;
end
a_weights = a_weights/sum(a_weights);
w_dir = performscale(u_dir,a_weights);

visualize_radialbody(w_dir)
axis off
%xlim([-0.02,0.02])
%ylim([-0.02,0.02])
saveas(gcf,'images/cvx_L05Laplace_data.png')

%%
a_weights = a_weights.^(1/3);
w_dir = performradialprojections(u_dir,1./a_weights);
visualize_radialbody(w_dir)
axis off
xlim([-0.45,0.45])
ylim([-0.45,0.45])
saveas(gcf,'images/cvx_L05Laplace_homodata.png')

%%

t = convex2dsolver_SOCP(a_weights);
%t = convex2dsolver(a_weights,0.2,500,2000);
x_dir = performradialprojections(u_dir,t);

visualize_radialbody(x_dir)
axis off
xlim([-4.5,4.5])
ylim([-4.5,4.5])
saveas(gcf,'images/cvx_L05Laplace_reg.png')
