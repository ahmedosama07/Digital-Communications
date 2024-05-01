function Mod_Manchester_UTD = Manchester(generatedSeq);
seqLength=length(generatedSeq);
len = 2*seqLength;
Mod_Manchester_UTD=zeros(1,len);
%Apply loop has condition to check whether it 1 or 0 bit 
%1 => Changing from high to low 
%0 => Changing from low to high
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