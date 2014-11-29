using DynamicalSystems
using Base.Test

# Test 1: harmonicOscillator.

omega0_test1 = 2.0;
beta_test1 = 0.5;
gamma_test1 = 1.5;
omega_test1 = 1.0;

t_test1 = 3.0;
x_test1 = [1.0, 2.0];

functions_test1 = harmonicOscillator(omega0_test1, beta=beta_test1, 
    gamma=gamma_test1, omega=omega_test1);

# Validate the results of the functions.
truth_test1 = [2.0, -4.788319987910199];
answer_test1 = map(fe -> fe(t_test1, x_test1), functions_test1);

@test_approx_eq answer_test1 truth_test1

# Test 2: duffingOscillator.

delta_test2 = 0.5;
gamma_test2 = 1.5;
alpha_test2 = 0.25;
beta_test2 = -0.75;
omega_test2 = 2.5;
t_test2 = 3.0;
x_test2 = [1.5, 3.5];

functions_test2 = duffingOscillator(delta_test2, gamma_test2,
    alpha=alpha_test2, beta=beta_test2, omega=omega_test2);

# Validate the results of the functions.
truth_test2 = [3.5, 1.8132499651621083];
answer_test2 = map(fe -> fe(t_test2, x_test2), functions_test2);

@test_approx_eq answer_test2 truth_test2
