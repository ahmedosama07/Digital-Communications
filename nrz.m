function [waveform, t, psd, f] = nrz(bits, bitrate)
%nrz Summary of this function goes here
%   Function generates waveform for polar non return to zero line coding
%   technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = 2 * bits - 1;
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, Fs);
end