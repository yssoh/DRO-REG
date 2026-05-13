%% Experiment with convex bodies
clear all; close all; 

n_pts = 100; % Number of points
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

%% L1-norm example
%% Algorithm, Plot

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 0.25;
a_weights(2*n_pts/4,1) = 0.25;
a_weights(3*n_pts/4,1) = 0.25;
a_weights(4*n_pts/4,1) = 0.25;
w_dir = performradialprojections(u_dir,1./a_weights);
t = solver_optcvxSOCP(a_weights);
x_dir = performradialprojections(u_dir,t);

w_dir = [w_dir, w_dir(:,1)];
x_dir = [x_dir, x_dir(:,1)];

hold on
axis off
plot(w_dir(1,:),w_dir(2,:),'LineWidth',2,'Color','k');
plot(x_dir(1,:),x_dir(2,:),'LineWidth',2,'Color','k');
pbaspect([1,1,1])
hold off
exportgraphics(gcf,'images/cvx_L1orig_data_DRO.png')

%% L1-norm example

% Data supported on standard basis vectors
a_weights = zeros(n_pts,1);
a_weights(n_pts/4-2,1) = 0.25;
a_weights(2*n_pts/4,1) = 0.25;
a_weights(3*n_pts/4,1) = 0.25;
a_weights(4*n_pts/4,1) = 0.25;
w_dir = performradialprojections(u_dir,1./a_weights);
t = solver_optcvxSOCP(a_weights);
x_dir = performradialprojections(u_dir,t);

w_dir = [w_dir, w_dir(:,1)];
x_dir = [x_dir, x_dir(:,1)];


hold on
axis off
plot(w_dir(1,:),w_dir(2,:),'LineWidth',2,'Color','k');
plot(x_dir(1,:),x_dir(2,:),'LineWidth',2,'Color','k');
pbaspect([1,1,1])
hold off
exportgraphics(gcf,'images/cvx_L1shift_data_DRO.png')

