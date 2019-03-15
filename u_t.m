function [y]=u_t(t)
    y = zeros(1,length(t));
    count = 1;
    for i=t
        y(count) = stepfun(i+2,0)-stepfun(i-5,0);
        count = count+1;
    end
end