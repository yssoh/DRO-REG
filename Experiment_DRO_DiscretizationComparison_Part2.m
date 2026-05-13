%% Experiments for computing examples of DRO Regularizers
% Experiment to compare sensitivity to discretization
clear; clc;

% Choice of epsilon
EPS = 0.1;

%% Round 0 -- n_pts = 100
n_pts = 100;
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

% L0 Example
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 1;
a_weights(2*n_pts/4,1) = 1;
a_weights(3*n_pts/4,1) = 1;
a_weights(4*n_pts/4,1) = 1;

% Setting up the L2 cost 
C = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    for jj = 1 : n_pts
        C(ii,jj) = min([(ii-jj)^2,(ii-jj-n_pts)^2,(ii-jj+n_pts)^2])/n_pts;
    end
end

% Computing DRO for eps = 0.1
t_100 = solver_DROREG(a_weights,C,EPS);
x_dir_100 = gauge2radial(u_dir,t_100);

%% Round 1 -- n_pts = 500
n_pts = 500;
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

% L0 Example
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 1;
a_weights(2*n_pts/4,1) = 1;
a_weights(3*n_pts/4,1) = 1;
a_weights(4*n_pts/4,1) = 1;

% Setting up the L1 cost (W1-distance)
C = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    for jj = 1 : n_pts
        C(ii,jj) = min([(ii-jj)^2,(ii-jj-n_pts)^2,(ii-jj+n_pts)^2])/n_pts;
    end
end

% Computing DRO for eps = 0.01
t_500 = solver_DROREG(a_weights,C,EPS);
x_dir_500 = gauge2radial(u_dir,t_500);

%% Round 2 -- n_pts = 1000
n_pts = 1000;
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end
AREACONST = 0.5*sin(2*pi/n_pts);

% L0 Example
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 1;
a_weights(2*n_pts/4,1) = 1;
a_weights(3*n_pts/4,1) = 1;
a_weights(4*n_pts/4,1) = 1;

% Setting up the L1 cost (W1-distance)
ee = ones(n_pts,1);
C = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    for jj = 1 : n_pts
        C(ii,jj) = min([(ii-jj)^2,(ii-jj-n_pts)^2,(ii-jj+n_pts)^2])/n_pts;
    end
end

% Computing DRO for eps = 0.01
t_1000 = solver_DROREG(a_weights,C,EPS);
x_dir_1000 = gauge2radial(u_dir,t_1000);

%% Round 3 -- n_pts = 2000
n_pts = 2000;
u_dir = zeros(2,n_pts);
for ii = 1 : n_pts
    theta = 2*ii*pi/n_pts;
    u_dir(:,ii) = [cos(theta); sin(theta)];
end

% L0 Example
a_weights = zeros(n_pts,1);
a_weights(n_pts/4,1) = 1;
a_weights(2*n_pts/4,1) = 1;
a_weights(3*n_pts/4,1) = 1;
a_weights(4*n_pts/4,1) = 1;

% Setting up the L1 cost (W1-distance)
C = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    for jj = 1 : n_pts
        C(ii,jj) = min([(ii-jj)^2,(ii-jj-n_pts)^2,(ii-jj+n_pts)^2])/n_pts;
    end
end

% Computing DRO for eps = 0.01
t_2000 = solver_DROREG(a_weights,C,EPS);
x_dir_2000 = gauge2radial(u_dir,t_2000);

%%
axis off
ylim([-5,5]); xlim([-5,5]);
pbaspect([1 1 1])
hold on
plot(x_dir_1000(1,:),x_dir_1000(2,:),'-k','LineWidth',1.5)
plot(x_dir_500(1,:),x_dir_500(2,:),':k','LineWidth',1.0)
plot(x_dir_2000(1,:),x_dir_2000(2,:),':k','LineWidth',1.0)
plot(x_dir_100(1,:),x_dir_100(2,:),':k','LineWidth',1.0)
hold off
saveas(gcf,'images/dro_L0L2_eps01_sensitivity.png')

%%
axis off
ylim([-0.3,0.3]); xlim([-0.3,0.3]);
pbaspect([1 1 1])
hold on
plot(x_dir_1000(1,:),x_dir_1000(2,:),'-k','LineWidth',1.5)
plot(x_dir_500(1,:),x_dir_500(2,:),':k','LineWidth',1.5)
plot(x_dir_2000(1,:),x_dir_2000(2,:),':k','LineWidth',1.5)
plot(x_dir_100(1,:),x_dir_100(2,:),':k','LineWidth',1.5)
hold off
saveas(gcf,'images/dro_L0L2_eps01_zoomed_sensitivity.png')
