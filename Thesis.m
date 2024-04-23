t0 = 0;
tfinal = 100;
p0 = [0.2; 0.01; 0.15; 0.01; 0.63];
u1 = zeros(1,50);
u2 = zeros(1,50);
b1 = 0.8*ones(1,50);
b2 = 0.8*ones(1,50);
a1 = 1*ones(1,50);
a2 = [zeros(1,3) 1*ones(1,47)];
m12 = [zeros(1,3) 0.2*ones(1,47)];
m21 = [zeros(1,3) 0.2*ones(1,47)];
d1 = 1*ones(1,50);
d2 = [zeros(1,3) 1*ones(1,47)];
l12 = [zeros(1,3) 1*ones(1,47)];
l21 = [zeros(1,3) 1*ones(1,47)];

ft = linspace(0, 100, 50);
[T, P] = ode45(@(t, p) ODEsys(t, p, ft, u1, u2, b1, b2, a1, a2, m12, m21, d1, d2, l12, l21), [t0 tfinal], p0);
plot(T, P(:,1),"b--",T, P(:,2),"r--",T, P(:,3),"b-",T, P(:,4),"r-", T, P(:,5),"k-",'LineWidth',2)

legend('suscptible1', 'susceptible2', 'infected1', 'infected2', 'uninterested')
xlabel("Time (s)")
ylabel("Proportion")