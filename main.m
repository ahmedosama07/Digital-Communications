N = 10;
bits = randi([0, 1], 1, N);
bitrate = 1;

figure(1);
subplot(6, 1, 1);
[waveform_nrz, t] = nrz(bits, bitrate);
plot(t, waveform_nrz, 'LineWidth', 3);
axis([0 t(end) min(waveform_nrz)-0.1 max(waveform_nrz)+0.1]);
grid on;
title(['Polar NRZ: [' num2str(bits) ']']);

subplot(6, 1, 2);
[waveform_nrzi, t] = nrzi(bits, bitrate);
plot(t, waveform_nrzi, 'LineWidth', 3);
axis([0 t(end) min(waveform_nrzi)-0.1 max(waveform_nrzi)+0.1]);
grid on;
title(['Polar NRZI: [' num2str(bits) ']']);

subplot(6, 1, 3);
[waveform_rz, t] = rz(bits, bitrate);
plot(t, waveform_rz, 'LineWidth', 3);
axis([0 t(end) min(waveform_rz)-0.1 max(waveform_rz)+0.1]);
grid on;
title(['Polar RZ: [' num2str(bits) ']']);

subplot(6, 1, 4);
[waveform_ami, t] = ami(bits, bitrate);
plot(t, waveform_ami, 'LineWidth', 3);
axis([0 t(end) min(waveform_ami)-0.1 max(waveform_ami)+0.1]);
grid on;
title(['Alternative mark inversion (AMI): [' num2str(bits) ']']);

subplot(6, 1, 5);
[waveform_manchester, t] = manchester(bits, bitrate);
plot(t, waveform_manchester, 'LineWidth', 3);
axis([0 t(end) min(waveform_manchester)-0.1 max(waveform_manchester)+0.1]);
grid on;
title(['Manchester coding: [' num2str(bits) ']']);

subplot(6, 1, 6);
[waveform_mlt3, t] = mlt3(bits, bitrate);
plot(t, waveform_mlt3, 'LineWidth', 3);
axis([0 t(end) min(waveform_mlt3)-0.1 max(waveform_mlt3)+0.1]);
grid on;
title(['Multi-level transmission 3: [' num2str(bits) ']']);