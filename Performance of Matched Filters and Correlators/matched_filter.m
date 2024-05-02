function recieved = matched_filter(rx_sequence, s1, s2, m, T, data_length)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
mf = s1 - s2;
mf = mf(end:-1:1);
S1 = conv(s1, mf, 'full');
S2 = conv(s2, mf, 'full');

v_th = (S1(T) + S2(T)) / 2;

recieved = zeros(1, data_length);
for i = 1 : data_length
    mf_conv = conv(rx_sequence(((i-1)*m)+1 : i*m), mf, 'full');
    recieved(i) = double(mf_conv(T) > v_th);
end

