% Define initial conditions and simulation time span
t0 = 0;                 % Start time of the simulation
tfinal = 100;           % End time of the simulation
p0 = [0.2; 0.01; 0.15; 0.01; 0.63]; % Initial state vector [susceptible1, susceptible2, infected1, infected2, uninterested]

% Define control and parameter vectors
u1 = zeros(1,50);       % Control parameter vector for misinformation 1 (no control applied)
u2 = zeros(1,50);       % Control parameter vector for misinformation 2 (no control applied)
b1 = 0.8*ones(1,50);    % Impact modifier for control on misinformation 1
b2 = 0.8*ones(1,50);    % Impact modifier for control on misinformation 2
a1 = 1*ones(1,50);      % Rate from uninterested to susceptible for misinformation 1
a2 = [zeros(1,3) 1*ones(1,47)]; % Rate from uninterested to susceptible for misinformation 2, activated after initial delay
m12 = [zeros(1,3) 0.2*ones(1,47)]; % Transition rate from susceptible 1 to susceptible 2, activated after initial delay
m21 = [zeros(1,3) 0.2*ones(1,47)]; % Transition rate from susceptible 2 to susceptible 1, activated after initial delay
d1 = 1*ones(1,50);      % Transition rate from susceptible to infected for misinformation 1
d2 = [zeros(1,3) 1*ones(1,47)]; % Transition rate from susceptible to infected for misinformation 2, activated after initial delay
l12 = [zeros(1,3) 1*ones(1,47)]; % Rate from infected 1 to susceptible 2, activated after initial delay
l21 = [zeros(1,3) 1*ones(1,47)]; % Rate from infected 2 to susceptible 1, activated after initial delay

% Time vector for parameter interpolation
ft = linspace(0, 100, 50); % Linearly spaced time vector for interpolation

% Solve the system of ODEs using ode45
[T, P] = ode45(@(t, p) ODEsys(t, p, ft, u1, u2, b1, b2, a1, a2, m12, m21, d1, d2, l12, l21), [t0 tfinal], p0);

% Plot the results
plot(T, P(:,1),"b--",T, P(:,2),"r--",T, P(:,3),"b-",T, P(:,4),"r-", T, P(:,5),"k-",'LineWidth',2)
legend('suscptible1', 'susceptible2', 'infected1', 'infected2', 'uninterested') % Legend for the plot
xlabel("Time (s)") % Label for the x-axis
ylabel("Proportion") % Label for the y-axis
