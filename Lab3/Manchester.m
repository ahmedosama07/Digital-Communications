function Mod_Manchester_UTD = Manchester(generatedSeq);
seqLength=length(generatedSeq);
len = 2*seqLength;
Mod_Manchester_UTD=zeros(1,len);
     for i = 1:seqLength
         if generatedSeq(i)==1
             Mod_Manchester_UTD(2*i-1) = 1;
             Mod_Manchester_UTD(2*i) = -1;
         else
             Mod_Manchester_UTD(2*i-1) = -1;
             Mod_Manchester_UTD(2*i) = 1;
         end
               
     end
end