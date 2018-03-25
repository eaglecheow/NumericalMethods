clear all;
clc;

V0 = 500;
L = 15;
R = @(I) 500+250.*(I.^2);
h = 0.005;

t = 0:h:0.1;
Idiff = @(t, I) ((V0./L)-(R(I)./L).*I);

[x1, y1] = odeMidpoint(Idiff, 0, 0.1 , 0.005, 0);

plot(x1, y1)


function [xOut, yOut] = odeMidpoint(func, a, b, h, init)
    x = a:h:b;
    y = zeros(1,(b-a)/h);
    y(1) = init;
    for i = 1:(b-a)/h
        K1 = func(x(i), y(i));
        K2 = func(x(i)+0.5.*h, y(i)+0.5.*K1.*h);
        y(i+1)=y(i)+K2.*h;
    end
    xOut = x
    yOut = y
end