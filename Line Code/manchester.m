function [waveform, t, psd, f] = manchester(bits, bitrate)
% manchester generates waveform for Manchester line coding technique.
% 
% Inputs:
%   - bits: binary input sequence
%   - bitrate: bitrate of the signal
% 
% Outputs:
%   - waveform: Manchester waveform
%   - t: time vector for the waveform
%   - psd: power spectral density of the waveform
%   - f: frequency vector corresponding to the psd

Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = ones(1, length(bits) * 2);
for i = 1 : length(bits)
    if bits(i) == 1
        waveform((2*i)-1) = 1;
        waveform(2*i) = -1;
    else
        waveform((2*i)-1) = -1;
        waveform(2*i) = 1;
    end
end
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, 0.5 * Fs);
end