function [waveform, t, psd, f] = nrzi(bits, bitrate)
% nrzi generates waveform for Polar Non-Return-to-Zero Inverted (NRZI) line coding technique.
% 
% Inputs:
%   - bits: binary input sequence
%   - bitrate: bitrate of the signal
% 
% Outputs:
%   - waveform: NRZI waveform
%   - t: time vector for the waveform
%   - psd: power spectral density of the waveform
%   - f: frequency vector corresponding to the psd

Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = ones(1, length(bits));
for i = 2 : length(bits)
    waveform(i) = waveform(i - 1) * (-1) ^ bits(i);
end
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, Fs);
end