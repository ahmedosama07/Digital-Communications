function [waveform, t] = mlt3(bits, bitrate)
%mlt3 Summary of this function goes here
%   Function generates waveform for Multi-level transmission 3(MLT-3) line 
%   coding technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(t));
prev = 1;
dir = -1;
for i = 0: length(bits)- 1
    if bits(i+1) == 1
        waveform((i*Fs)+1 : (i+1)*Fs) = prev;
        prev = prev + dir * 1;
        if abs(prev) == 1
            dir = -dir;
        end
    else
        waveform((i*Fs)+1 : (i+1)*Fs) = waveform(i*Fs);
    end
end
end

