function dpdt = ODEsys(t, p, ft, u1, u2, b1, b2, a1, a2, m12, m21, d1, d2, l12, l21)
    % Interpolates control and parameter values based on current time t
    u1 = interp1(ft, u1, t); % Control parameter for misinformation 1
    u2 = interp1(ft, u2, t); % Control parameter for misinformation 2
    b1 = interp1(ft, b1, t); % Modifier for the impact of control on misinformation 1
    b2 = interp1(ft, b2, t); % Modifier for the impact of control on misinformation 2
    a1 = interp1(ft, a1, t); % Rate from uninterested to susceptible for misinformation 1
    a2 = interp1(ft, a2, t); % Rate from uninterested to susceptible for misinformation 2
    m12 = interp1(ft, m12, t); % Transition rate from susceptible 1 to susceptible 2
    m21 = interp1(ft, m21, t); % Transition rate from susceptible 2 to susceptible 1
    d1 = interp1(ft, d1, t); % Transition rate from susceptible to infected for misinformation 1
    d2 = interp1(ft, d2, t); % Transition rate from susceptible to infected for misinformation 2
    l12 = interp1(ft, l12, t); % Rate from infected 1 to susceptible 2
    l21 = interp1(ft, l21, t); % Rate from infected 2 to susceptible 1

    % Computes the derivatives of the state variables using the model equations
    dpdt = [(a1.*p(5) - u1 + (m21-m12).*p(2) - d1.*p(3) + l21.*p(4)).*p(1); % Derivative for susepcitble 1 state
            (a2.*p(5) - u2 + (m12-m21).*p(1) - d2.*p(4) + l12.*p(3)).*p(2); % Derivative for susceptible 2 state
            (d1.*p(1) - b1.*u1 - l12.*p(2)).*p(3); % Derivative for infected 1 state
            (d2.*p(2) - b2.*u2 - l21.*p(1)).*p(4); % Derivative for infected 2 state
            b1.*u1.*p(3) + b2.*u2.*p(4) + u1.*p(1) + u2.*p(2) - a1.*p(1).*p(5) - a2.*p(2).*p(5)]; % Derivative for uninterested state
end
