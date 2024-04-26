function [Mod_Bipolar_NRZ,Mod_Bipolar_RZ] = AMI(generatedSeq);
seqLength = length(generatedSeq);
Mod_Bipolar_NRZ=generatedSeq;
toggle = 1; %Initiallize the value of first one is positive one
 for i = 1:seqLength
     
        if generatedSeq(i) == 1
            Mod_Bipolar_NRZ(i) = toggle;
            toggle= -toggle;
        end
 end
    len = 2* seqLength;
    Mod_Bipolar_RZ=zeros(1,len);
    j=1;
    for i=1:seqLength;
       Mod_Bipolar_RZ(j) = Mod_Bipolar_NRZ(i);
       j=j+2;
    end

end