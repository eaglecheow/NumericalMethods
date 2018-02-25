%Producing Data Points
x = linspace((pi/2), (3*pi/2), 6);
y = cos(x).^3;

%Declaring empty array for assignment
multipleTwo = zeros(1, 6);
multipleFour = zeros(1, 6);

%Assigning data for proper multiple weightage
for i=2:5
    if (mod(i, 2) == 0)
        multipleFour(i) = y(i);
        continue
    else
        multipleTwo(i) = y(i);
        continue
    end
end

%Result
I = ((x(2) - x(1))/3)*(y(1) + y(6) + 2*sum(multipleTwo) + 4*sum(multipleFour))
    