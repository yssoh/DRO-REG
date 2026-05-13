function [t] = solver_DROREG(a_weights,C,EPS)
% Numerical solver to compute Distributionally Robust Optimal Regularizer
% Input     : a_weights = vector representing input probability distribution
%           : EPS = amount of distributional robustness
% Output    : t = vector of gauge function evaluations

[n_pts,~] = size(a_weights);
ee = ones(n_pts,1);
AREACONST = 0.5*sin(2*pi/n_pts);

% CVX Routine
cvx_begin
    variable s
    variable t(n_pts,1)
    variable l(n_pts,1)
    minimize (s*EPS + a_weights'*l)
    subject to
    s*C + l * ee' >= ee*t'
    s >= 0
    
    % Volume constraint via the sum(pow_p()) function
    sum(pow_p(t,-2)) <= 1.0/AREACONST
cvx_end

end

