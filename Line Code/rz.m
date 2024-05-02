function [waveform, t, psd, f] = rz(bits, bitrate)
%rz Summary of this function goes here
%   Function generates waveform for polar return to zero line coding
%   technique.
Fs = 100;
T = length(bits)/bitrate;
t = linspace(0, T, Fs*length(bits));
waveform = zeros(1, length(bits) * 2);
for i = 1 : length(bits)
    if bits(i) == 1
        waveform((2*i)-1) = 1;
    else
        waveform((2*i)-1) = -1;
    end
end
[psd, f] = periodogram(waveform,[],[],Fs,'centered');
psd = 10 * log10(psd);
waveform = repelem(waveform, 0.5 * Fs);
end