function [waveform, t, psd, f] = ami(bits, bitrate)
% ami generates waveform for Alternative Mark Inversion (AMI) line coding technique.
% 
% Inputs:
%   - bits: binary input sequence
%   - bitrate: bitrate of the signal
% 
% Outputs:
%   - waveform: AMI waveform
%   - t: time vector for the waveform
%   - psd: power spectral density of the waveform
%   - f: frequency vector corresponding to the psd

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