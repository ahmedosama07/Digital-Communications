%function to caclulate BER
function BER = ComputeBER(bit_seq, rec_bit_seq)
    n = min(length(bit_seq), length(rec_bit_seq));
    bit_seq = bit_seq(1:n); % Ensure both arrays have the same size
    rec_bit_seq = rec_bit_seq(1:n); % Ensure both arrays have the same size
    BER = sum(xor(bit_seq, rec_bit_seq)) / n;% xor-ing x and y
end