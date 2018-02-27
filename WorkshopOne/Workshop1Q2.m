% Written by Cheow Yeu Tyng (18816756), 25 February 2018

% Answer to the discussion
% There is a small error compared between the numerical and exact answer
% due to the following reasons:
% 1.  Low sampling rate
%     There is only 6 sampling points used in the numerical calculation, because
%     of that there's potential error with the actual result
% 
% 2.  Rounding error
%     As this calculation was done using MATLAB, values with too long matissa will
%     be rounded to the nearest value, causing rounding error to present during
%     calculation.

format long

%Producing Data Points
x = linspace((pi/2), (3*pi/2), 7);
y = cos(x).^3;

%Declaring empty array for assignment
multipleTwo = zeros(1, 7);
multipleFour = zeros(1, 7);

%Assigning data for proper multiple weightage
for i=2:6
    if (mod(i, 2) == 0)
        multipleFour(i) = y(i);
        continue
    else
        multipleTwo(i) = y(i);
        continue
    end
end

%Result
I = ((x(2) - x(1))/3)*(y(1) + y(7) + 2*sum(multipleTwo) + 4*sum(multipleFour))
    