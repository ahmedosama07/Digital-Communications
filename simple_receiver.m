% function to recieve SIMPLE and MATCHED 
function rec_bit_seq = simple_receiver(rec_sample_seq, m, v_th, T)
    number_bits = length(rec_sample_seq) / m;% no. of bits
    rec_bit_seq = zeros(1, number_bits);

    for i = 1:number_bits
        if rec_sample_seq((i - 1) * m + T) >= v_th % determining the corresponding sample for each bit
            rec_bit_seq(i) = 1;% if the sample is greater than the threshold then, equals 1
        end
    end
end