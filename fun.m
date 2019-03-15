function [y]= fun(t)
    y = zeros(1,length(t));
    count = 1;
    for i = t 
        y(count)=4*exp(-0.5*i)*cos(pi*i);
        count = count+1;
    end
end