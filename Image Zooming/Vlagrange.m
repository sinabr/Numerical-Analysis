function y0 = Vlagrange(x0 ,x, y)
% x is the vector of abscissas.
% y is the matching vector of ordinates.
% x0 represents the target to be interpolated
% y0 represents the solution from the Lagrange interpolation
y0 = 0;
n = size(x);
for j = 1 : n
    t = 1;
    for i = 1 : n
        if i~=j
            t = t * double((x0-x(i))/(x(j)-x(i)));
        end
    end
    y0 = y0 + t*y(j);
end 
