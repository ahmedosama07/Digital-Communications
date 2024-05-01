function [waveform, t, psd, f] = nrzi(bits, bitrate)
%nrzi Summary of this function goes here
%   Function generates waveform for polar non return to zero inverted line 
%   coding technique.
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