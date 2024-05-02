function [waveform, t, psd, f] = ami(bits, bitrate)
%ami Summary of this function goes here
%   Function generates waveform for Alternative mark inversion (AMI) line 
%   coding technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(bits));
prev = -1;
for i = 1 : length(bits)
    if bits(i) == 1
        waveform(i) = -prev;
        prev = -prev;
    end
end

[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, Fs);
end