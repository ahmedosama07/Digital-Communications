% function to recieve CORRELATOR RECIEVER
function rec_bit_seq = corr_receiver(rec_sample_seq, m, matched_filter)
    number_bits = length(rec_sample_seq) / m;% no. of bits
    for i = 1:number_bits
        temp = rec_sample_seq((i - 1) * m + 1 : i * m);% determining the corresponding sample for each bit
        temp = temp.*matched_filter;% multipluying it with matched_filter
        temp = sum(temp);% adding to get the bit sequence
        rec_bit_seq(i) = temp;
    end
    
    v_th = mean(rec_bit_seq);% getting the threshold
    rec_bit_seq = rec_bit_seq > v_th;% if the sample is greater than the threshold then, equals 1
end