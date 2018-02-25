x = [-0.77459667 0 0.77459667];
a = 0;
b = 10;

normalizedX = ((b - a).*x + a + b)./2;

y = 1 - exp(-0.18355.*normalizedX);

normalizedY = y.*(b-a)./2;

integralResult = sum([y(1)*0.5555556 y(2)*0.8888889 y(3)*0.5555556]);

result = 53.3904*integralResult