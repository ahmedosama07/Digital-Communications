function recieved = simple_filter(rx_sequence, m, T, data_length)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
v_th = mean(rx_sequence);
recieved = zeros(1, data_length);

for i = 1 : data_length
    recieved(i) = rx_sequence(((i-1)*m)+T) >= v_th;
end
end

