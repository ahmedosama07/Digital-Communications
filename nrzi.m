function [waveform, t] = nrzi(bits, bitrate)
%nrzi Summary of this function goes here
%   Function generates waveform for polar non return to zero inverted line 
%   coding technique.
Fs = 100;
bits = [0 bits];
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = ones(1, length(t));
for i = 1: length(bits) - 1
    if bits(i+1) == 1
        waveform((i*Fs)+1 : (i+1)*Fs) = -waveform(i*Fs);
    else
        waveform((i*Fs)+1 : (i+1)*Fs) = waveform(i*Fs);
    end
end
end

