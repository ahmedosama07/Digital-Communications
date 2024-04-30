N = 10;
bits = randi([0, 1], 1, N);

bitrate = 1;

Fs = 100;
Ts = 1 / Fs;
T = length(bits)/bitrate;
t = 0 : Ts : T;
s = zeros(1, length(t));
for i = 0: length(bits)- 1
    if bits(i+1) == 1
        s((i*Fs)+1 : (i+1)*Fs) = 1;
    else
        s((i*Fs)+1 : (i+1)*Fs) = 0;
    end
end
figure(1);
plot(t, s);
grid on;

