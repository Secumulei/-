function [y]=fun_fun(k)
    count = 1
    y = zeros(1,length(k))
    for i=k
        y(count) = 7*(0.6^i)*cos(0.9*pi*i)
        count = count+1
    end
end
