function  [Mod_Polar_NRZ , Mod_Polar_RZ] = Polar(generatedSeq);
    for i = 1:length(generatedSeq)
        if generatedSeq(i) == 0
            generatedSeq(i) = -1;
        end
    end
    Mod_Polar_NRZ = generatedSeq;
    
    seqLength=length(generatedSeq);
    len = 2* seqLength;
    Mod_Polar_RZ=zeros(1,len);
    j=1;
    for i=1:seqLength;
       Mod_Polar_RZ(j) = generatedSeq(i);
       j=j+2;
    end
end
