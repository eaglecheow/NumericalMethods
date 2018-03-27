clear all;
clc;

V0 = 500;
L = 15;
R = @(I) 500+250.*(I.^2);
h = 0.005;

t = 0:h:0.1;
Idiff = @(t, I) ((V0./L)-(R(I)./L).*I);

[t, I] = odeMidpoint(Idiff, 0, 0.1 , 0.005, 0);
Answer = [t; I]

plot(t, I);
title('Transient of I')
xlabel('Time (s)');
ylabel('Current (A)');