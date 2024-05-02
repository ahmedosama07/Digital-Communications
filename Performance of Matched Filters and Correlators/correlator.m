function recieved = correlator(rx_sequence, s1, s2, m, data_length)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
mf = s1 - s2;
mf = mf(end:-1:1);

recieved = zeros(1, data_length);
for i = 1 : data_length
    recieved(i) = sum(rx_sequence((i-1)*m+1 : (i*m)) .* mf);
end

v_th = mean(recieved);
recieved = double(recieved > v_th);
end

