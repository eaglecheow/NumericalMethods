function [output] = Simpson38(func, a, b)
    previousIteration = 0;
    subIntervals = 3;
    percentageDifference = 100;
    
    checkStatus = 0;
    
    while (percentageDifference > 0.1 || checkStatus == 0)
        checkStatus = 1;
        
        dataPoints = subIntervals;
        h=(b-a)/dataPoints;
        multipleTwo = zeros(1, dataPoints);
        multipleThree = zeros(1, dataPoints);
        x = a:h:b;
        y = func(x);

        for i = 2:(dataPoints)
            if (mod(i-1, 3) == 0)
                multipleTwo(i) = y(i);
                continue
            else
                multipleThree(i) = y(i);
                continue
            end
        end    
        currentIteration = (3*(h)/8)*(y(1) + y(dataPoints+1) + 2*sum(multipleTwo) + 3*sum(multipleThree));
        
        percentageDifference = abs(currentIteration - previousIteration)/currentIteration*100;
        subIntervals = subIntervals*2
        previousIteration = currentIteration;
    end
    
    output = previousIteration;
end