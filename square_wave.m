function [summ]=square_wave(n,t)
    summ=0;
    for k = 1:n
        summ = summ + (sin((2*k-1)*t))/(2*k-1);
    end
end
