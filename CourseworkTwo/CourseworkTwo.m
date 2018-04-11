function [] = Main()
    
    matrix = PerformCalculation(1, 3, 2);
    matrix
    
    figure(1)
    surf(matrix,'FaceColor','flat','EdgeColor','k','Marker','x','MarkerEdgeColor','k')
    xlabel('X','fontSize',12);
    ylabel('Y','fontSize',12);
    zlabel('Voltage (V)','fontSize',12);
    title('Electric Potential','fontsize',12);
    color = colorbar('location','eastoutside','fontsize',12,'Ticks',[-1,1],'TickLabels',{'Low','High'});
    color.Label.String = 'Electric Field Intensity';
    colormap('jet');
    
    figure(2)
    [FX,FY] = gradient(-matrix);
    quiver(FX,FY);
    xlabel('X','fontSize',12);
    ylabel('Y','fontSize',12);
    zlabel('Voltage/V','fontSize',12);
    title('Electric Potential','fontsize',12);
    grid on;
    grid minor;

end

function [resultMatrix] = PerformCalculation(a, b, N)
    inputMatrix = createMatrix(a, b, N);
    [rowSize, columnSize] = size(inputMatrix);
    newMatrix = zeros(rowSize, columnSize);
    loopStatus = 1;
    
    while (loopStatus == 1)
        loopStatus = 0;
        newMatrix(:) = -1;
        for j=2:(columnSize-1)
            for i=2:(rowSize-1)
                newMatrix(j, i) = FindAverage(inputMatrix(j, i - 1), inputMatrix(j - 1, i), inputMatrix(j, i + 1), inputMatrix(j + 1, i));
                if (newMatrix(j, i) - inputMatrix(j, i) > (10^-8))
                    loopStatus = 1;
                end
            end
        end
        %newMatrix(N+1:(2+N)+1, N+1:(2*N)+1) = 1;
        newMatrix(floor(rowSize/b + 1):floor(rowSize-rowSize/b + 1), floor(columnSize/b + 1):floor(columnSize-columnSize/b + 1)) = 1;
        inputMatrix = newMatrix;
    end
    
    resultMatrix = inputMatrix;
end

function [outputMatrix] = createMatrix(a, b, N)
    d = a/N;
    size = (b/d) + 1;
    matrix = zeros(size, size);
    matrix(:) = -1;
    %matrix(2:size-1, 2:size-1) = 0;
    matrix(floor(size/b + 1):floor(size-size/b + 1), floor(size/b + 1):floor(size-size/b + 1)) = 1;
    matrix(N+1:(2+N)+1, N+1:(2*N)+1) = 1;
    outputMatrix = matrix;
end

function [average] = FindAverage(left, top, right, bottom)
    average = (left + top + right + bottom)/4;
end