function [output] = EllipsePer(a, b)
    k = sqrt((a.^2) - (b.^2))./a;
    func = @(x) sqrt(1-(k.^2).*(sin(x).^2));
    i = Simpson38(func, 0, pi/2);
    output = 4*a*i;
end