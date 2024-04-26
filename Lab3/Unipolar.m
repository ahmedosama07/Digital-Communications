function [Mod_Unipolar_NRZ , Mod_Unipolar_RZ] = Unipolar(generatedSeq);
Mod_Unipolar_NRZ = generatedSeq;
seqLength=length(generatedSeq);
len = 2*seqLength;
Mod_Unipolar_RZ=zeros(1,len);
j=1;
for i=1:seqLength;
    Mod_Unipolar_RZ(j) = generatedSeq(i);
    j=j+2;
end
end