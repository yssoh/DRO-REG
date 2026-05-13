function [t] = convex2dsolver_SOCP(a_weights)
% Numerical solver to compute optimal convex 2d-body
% Input     : a_weights = vector representing input probability distribution
%           : EPS = amount of distributional robustness
% Output    : t = vector of gauge function evaluations

[n_pts,~] = size(a_weights);

% Matrix constraint that enforces convexity D*t <= 0
D = zeros(n_pts,n_pts);
for ii = 1 : n_pts
    D(ii,ii) = sin(4*pi/n_pts);
    D(ii,mod(ii,n_pts)+1) = -sin(2*pi/n_pts);
    D(ii,mod(ii-2,n_pts)+1) = -sin(2*pi/n_pts);
end

% Formulate the problem in CVX
cvx_begin
    variable t(n_pts,1)
    variable u(1,n_pts)
    variable v(1,n_pts)
    minimize(a_weights'*t)
    subject to
        % Convexity
        D*t <= zeros(n_pts,1)
        
        % Volume constraint as a SOCP
        for i = 1 : n_pts
            norm( [2; v(1,i)-u(1,i)] ) <= v(1,i)+u(1,i);
        end
        for i = 1 : n_pts - 1
            norm( [2*u(1,i); t(i,1)-t(i+1,1)] ) <= t(i,1)+t(i+1,1);
        end
        norm( [2*u(1,n_pts); t(n_pts,1)-t(1,1)] ) <= t(n_pts,1)+t(1,1);
        norm(v) <= sqrt(2/sin(2*pi/n_pts));
cvx_end

end

