function  [Mod_Polar_NRZ , Mod_Polar_RZ] = Polar(generatedSeq);
%Apply loop has condition to check on current bit and assign to 0=>-1 and
%dont change 1 to obtair Polar NRZ
    for i = 1:length(generatedSeq)
        if generatedSeq(i) == 0
            generatedSeq(i) = -1;
        end
    end
    Mod_Polar_NRZ = generatedSeq;
    %Adding zeros between each bit to obtain RZ
    seqLength=length(generatedSeq);
    len = 2* seqLength;
    Mod_Polar_RZ=zeros(1,len);
    j=1;
    for i=1:seqLength;
       Mod_Polar_RZ(j) = generatedSeq(i);
       j=j+2;
    end
end
