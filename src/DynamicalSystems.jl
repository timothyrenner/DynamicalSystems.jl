module DynamicalSystems

# Creates the functions for the harmonic oscillator with a sinusoidal driving
# force.
#
# x'' + beta x' + omega^2 x = gamma sin(omega t)
#
# Args:
#   omega0: The frequency term.
#   beta: The damping term (default: 0.0).
#   gamma: The driving force amplitude (default: 0.0).
#   omega: The driving force frequency (default: 1.0).
#
# Returns: An array of two functions defining the harmonic oscillator system.
function harmonicOscillator(omega0::FloatingPoint;
    beta::FloatingPoint=0.0, gamma::FloatingPoint=0.0,
    omega::FloatingPoint=1.0)

    return [(t,x) -> x[2],
            (t,x) -> (gamma*sin(omega*t) -
                 beta*x[2] -
                 (omega0^2)*x[1])];

end #Close simpleHarmonicOscillator.

# Creates the functions for a Duffing oscillator.
#
# x'' + delta x' + alpha x + beta x^3 = gamma sin(omega t)
# 
# Args:
#   delta: The damping term.
#   gamma: The driving amplitude.
#   alpha: The stiffness (default: 1.0).
#   beta: The restoring force non-linearity (default: -1.0).
#   omega: The driving force frequency (default: 1.0).
#
# Returns: An array of two functions defining the Duffing oscillator system.
function duffingOscillator(delta::FloatingPoint, gamma::FloatingPoint;
    alpha::FloatingPoint=-1.0, beta::FloatingPoint=1.0,
    omega::FloatingPoint=1.0)

    return [(t,x) -> x[2],
     (t,x) -> (gamma*sin(omega*t) -
              delta*x[2] -
              alpha*x[1] -
              beta*(x[1]^3))];

end #Close duffingOscillator.

# Creates the functions for a Lorenz attractor.
#
# x' = sigma (y - x)
# y' = x (rho - z) - y
# z' = x y - beta z
#
# Args:
#   sigma: The sigma parameter of the system.
#   rho: The rho parameter of the system.
#   beta: The beta parameter of the system.
#
# Returns: An array of three function defining the Lorenz attractor system.
function lorenzAttractor(sigma::FloatingPoint, rho::FloatingPoint,
    beta::FloatingPoint)

    return [(t,x) -> sigma*(x[2] - x[1]),
            (t,x) -> x[1]*(rho - x[3]) - x[2],
            (t,x) -> x[1]*x[2] - beta*x[3]];
end

export harmonicOscillator, duffingOscillator, lorenzAttractor

end # module
