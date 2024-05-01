function [waveform, t] = nrz(bits, bitrate)
%nrz Summary of this function goes here
%   Function generates waveform for polar non return to zero line coding
%   technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(t));
for i = 0: length(bits)- 1
    if bits(i+1) == 1
        waveform((i*Fs)+1 : (i+1)*Fs) = 1;
    else
        waveform((i*Fs)+1 : (i+1)*Fs) = -1;
    end
end
end

