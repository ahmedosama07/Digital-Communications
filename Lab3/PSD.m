function [PSD_MAG,freq] = PSD(modulatedSeq);
BPS=1;%bitspersecond       Samplespersecond=BPS*samples_per_bits
samples_per_bit=100; %samples per bit
%Repeating each bit in modulated sequence N-times to be able to get
%clearly PSD
totalSamples = length(modulatedSeq).* samples_per_bit;
arr=zeros(1,totalSamples);
     for i= 1:length(modulatedSeq)
         starrt=(i-1)*samples_per_bit+1; 
         endd=starrt+samples_per_bit-1;
         arr(starrt:endd)= modulatedSeq(i);
     end
frequency_spacing= samples_per_bit/totalSamples; %samplespersecond/total samples
fft_seq = fft(arr);
PSD_MAG =(abs(fft_seq).^2) /(2*frequency_spacing);
PSD_MAG=fftshift(PSD_MAG);
freq = (0:totalSamples-1)*frequency_spacing;
freq = fftshift(freq - samples_per_bit / 2);
end
