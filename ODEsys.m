function dpdt = ODEsys(t, p, ft, u1, u2, b1, b2, a1, a2, m12, m21, d1, d2, l12, l21)
u1 = interp1(ft, u1, t);
u2 = interp1(ft, u2, t);
b1 = interp1(ft, b1, t);
b2 = interp1(ft, b2, t);
a1 = interp1(ft, a1, t);
a2 = interp1(ft, a2, t);
m12 = interp1(ft, m12, t);
m21 = interp1(ft, m21, t);
d1 = interp1(ft, d1, t);
d2 = interp1(ft, d2, t);
l12 = interp1(ft, l12, t);
l21 = interp1(ft, l21, t);

dpdt = [(a1.*p(5) - u1 + (m21-m12).*p(2) - d1.*p(3) + l21.*p(4)).*p(1);
        (a2.*p(5) - u2 + (m12-m21).*p(1) - d2.*p(4) + l12.*p(3)).*p(2);
        (d1.*p(1) - b1.*u1 - l12.*p(2)).*p(3);
        (d2.*p(2) - b2.*u2 - l21.*p(1)).*p(4);
        b1.*u1.*p(3) + b2.*u2.*p(4) + u1.*p(1) + u2.*p(2) - a1.*p(1).*p(5) - a2.*p(2).*p(5)];


end 