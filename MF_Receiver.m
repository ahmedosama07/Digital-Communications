function MF_Rx = MF_Receiver(Rx_sequence, s1, s2, num_bits, matchedFilter, m, T)
    Rx_MF = zeros(1, T);
    MF_Rx = zeros(1, num_bits);
    Rx_temp = zeros(1, T * 2);
    
    S1_o_p = conv(s1, matchedFilter, 'full');
    S2_o_p = conv(s2, matchedFilter, 'full');
    V_th_mf = 0.5 * (S1_o_p(T) + S2_o_p(T));

    for i = 0 : num_bits - 1
        Rx_MF = Rx_sequence(i * m + 1 : (i + 1) * m);
        Rx_temp = conv(Rx_MF, matchedFilter, 'full');

        if(Rx_temp(T) > V_th_mf)
           MF_Rx(i + 1) = 1;
        elseif(Rx_temp(T) < V_th_mf)
           MF_Rx(i + 1) = 0;
        end
    end
end  