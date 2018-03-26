clear all;
clc;

somePerimeter = EllipsePer(31, 55)

function [output] = EllipsePer(a, b)
    k = sqrt((a.^2) - (b.^2))./a;
    func = @(x) sqrt(1-(k.^2).*(sin(x).^2));
    i = Simpson38(func, 0, pi/2);
    output = 4*a*i;
end

function [output] = Simpson38(func, a, b)
    previousIteration = 0;
    subIntervals = 3;
    percentageDifference = 100;
    while (percentageDifference > 0.1)
        dataPoints = (subIntervals * 2) + 2;
        multipleTwo = zeros(1, dataPoints);
        multipleThree = zeros(1, dataPoints);
        x = linspace(a, b, dataPoints);
        y = func(x);

        for i = 2:(dataPoints-1)
            if (mod(i-1, 3) == 0)
                multipleTwo(i) = y(i);
                continue
            else
                multipleThree(i) = y(i);
                continue
            end
        end    
        currentIteration = (3*(x(2) - x(1))/8)*(y(1) + y(dataPoints) + 2*sum(multipleTwo) + 3*sum(multipleThree));
        
        percentageDifference = abs(currentIteration - previousIteration)/currentIteration*100;
        subIntervals = subIntervals*2;
        previousIteration = currentIteration;
    end
    
    output = previousIteration;
end