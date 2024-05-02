function [waveform, t, psd, f] = mlt3(bits, bitrate)
% mlt3 generates waveform for Multi-Level Transmission 3 (MLT-3) line coding technique.
% 
% Inputs:
%   - bits: binary input sequence
%   - bitrate: bitrate of the signal
% 
% Outputs:
%   - waveform: MLT-3 waveform
%   - t: time vector for the waveform
%   - psd: power spectral density of the waveform
%   - f: frequency vector corresponding to the psd

Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(bits));
prev = 1;
dir = -1;
val = 0;
for i = 1: length(bits)
    if bits(i) == 1
        waveform(i) = prev;
        prev = prev + dir * 1;
        if abs(prev) == 1
            dir = -dir;
        end
    else
        if i > 1
            val = waveform(i-1);
        end
        waveform(i) = val;
    end
end
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, Fs);
end