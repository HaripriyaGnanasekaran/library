%% Introduction to MATLAB script slope.m

% First derivative of a function y(x) w.r.t a variable x is computed
% y and x should be a vector of size m. 
% [dy_dx]=slope(y,x,m)

%% Definition of MATLAB function called slope

function [dy_dx] = slope(y,x,m)

%% Error checks
    if (~isvector(y) || ~isvector(x))
        error('Input variable must be a vector')
    end
    if ~isscalar(m)
        error('Dimension of vector should be a scalar')
    end
    [ysize,cy]=size(y);
    [xsize,cx]=size(x);
    if (ysize ~= m || xsize ~= m || cy~=cx)
        error('Dimension mismatch of vectors passed')
    end
    

%% Compution of derivative

% Initialize the derivative vector to zero.
    dy_dx=zeros(1,m);
    
% Forward difference (second order)
    for i=1:m
        if i==1
            dy_dx(i) = (-3*y(i)+4*y(i+1)-y(i+2))/(x(i+2)-x(i));
        elseif i==m
            dy_dx(i) = (3*y(i)-4*y(i-1)+y(i-2))/(x(i)-x(i-2));
        else
            dy_dx(i) = (y(i+1)-y(i))/(x(i+1)-x(i));
        end
    end
    
end
