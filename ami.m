function [waveform, t] = ami(bits, bitrate)
%ami Summary of this function goes here
%   Function generates waveform for Alternative mark inversion (AMI) line 
%   coding technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(t));
prev = -1;
for i = 0: length(bits)- 1
    if bits(i+1) == 1
        waveform((i*Fs)+1 : (i+1)*Fs) = -prev;
        prev = -prev;
    else
        waveform((i*Fs)+1 : (i+1)*Fs) = 0;
    end
end
end

