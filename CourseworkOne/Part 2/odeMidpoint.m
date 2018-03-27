function [xOut, yOut] = odeMidpoint(func, a, b, h, init)
    x = a:h:b;
    y = zeros(1,(b-a)/h);
    y(1) = init;
    for i = 1:(b-a)/h
        K1 = func(x(i), y(i));
        K2 = func(x(i)+0.5.*h, y(i)+0.5.*K1.*h);
        y(i+1)=y(i)+K2.*h;
    end
    xOut = x;
    yOut = y;
end