function [PSD_MAG,freq] = PSD(modulatedSeq,seqLength);
BPS=length(modulatedSeq)/seqLength;%bitspersecond       Samplespersecond=BPS*samples_per_bits
samples_per_bit=10; %samples per bit
%Repeating each bit in modulated sequence N-times to be able to get
%clearly PSD
totalSamples = length(modulatedSeq).* samples_per_bit;
arr=zeros(1,totalSamples);
     for i= 1:length(modulatedSeq)
         starrt=(i-1)*samples_per_bit+1; 
         endd=starrt+samples_per_bit-1;
         arr(starrt:endd)= modulatedSeq(i);
     end
   fs=samples_per_bit*BPS;
 [PSD_MAG,freq]= pwelch(arr, [], [], [],fs,'centered','power');

end
