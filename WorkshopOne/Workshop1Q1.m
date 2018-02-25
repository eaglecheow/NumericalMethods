%Define data points
z = 0:2.5:30;
d = [0 6.6 8.1 12.2 14.2 15.2 15.7 15.2 14.2 12.2 8.1 6.6 0];
r = d./2;
rSquare = r.^2;

%Find Numerical Integral
%Trapezoidal
rTrapezoidal = sum((2.5/2).*2.*r)-r(1) - r(30/2.5 + 1);
rSquareTrapezoidal = sum((2.5/2).*2.*rSquare)-rSquare(1) - rSquare(30/2.5 + 1);

%Simpson 1/3
multipleTwo = zeros(1, 13);
multipleFour = zeros(1, 13);

for i=2:12
    if (mod(i, 2) == 0)
        multipleFour(i) = r(i);
        continue
    else
        multipleTwo(i) = r(i);
        continue
    end
end

rSimpson = (2.5/3)*(r(1) + r(13) + sum(multipleFour)*4 + sum(multipleTwo)*2);

multipleTwo = zeros(1, 13);
multipleFour = zeros(1, 13);

for i=2:12
    if (mod(i, 2) == 0)
        multipleFour(i) = rSquare(i);
        continue
    else
        multipleTwo(i) = rSquare(i);
        continue
    end
end

rSquareSimpson = (2.5/3)*(rSquare(1) + rSquare(13) + sum(multipleFour)*4 + sum(multipleTwo)*2);

%Results
vTrapezoidal = pi*rSquareTrapezoidal
vSimpson = pi*rSquareSimpson
sTrapezoidal = 2*pi*rTrapezoidal
sSimpson = 2*pi*rSimpson