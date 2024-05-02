function [waveform, t, psd, f] = nrz(bits, bitrate)
% nrz generates waveform for Polar Non-Return-to-Zero (NRZ) line coding technique.
% 
% Inputs:
%   - bits: binary input sequence
%   - bitrate: bitrate of the signal
% 
% Outputs:
%   - waveform: NRZ waveform
%   - t: time vector for the waveform
%   - psd: power spectral density of the waveform
%   - f: frequency vector corresponding to the psd

Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = 2 * bits - 1;
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, Fs);
end