# DRO-REG
Code for paper *Optimal Regularization Under Uncertainty: Distributional Robustness and Convexity Constraints* [https://arxiv.org/abs/2510.03464]

Codes are provided in MATLAB and require CVX installed [https://cvxr.com/cvx/download/]. 

To replicate the experiments in the paper, run the files Experiment_*.m as it is.

The main solvers are
- solver_DROREG : Computes the distributionally robust optimal regularizer given probability weights (Section 3 of paper)
- solver_optcvxREG : Computes the optimal convex given probability weights (Section 4 of paper)

If you run into any issues, contact me at matsys@nus.edu.sg.
