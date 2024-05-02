% Define the number of bits
N = 10;

% Generate random bits (0s and 1s)
bits = randi([0, 1], 1, N);

% Set the bitrate
bitrate = 1;

% Perform different encoding schemes and store waveforms and spectra
[waveform_nrz, t_nrz, psd_nrz, f_nrz] = nrz(bits, bitrate);
[waveform_nrzi, t_nrzi, psd_nrzi, f_nrzi] = nrzi(bits, bitrate);
[waveform_rz, t_rz, psd_rz, f_rz] = rz(bits, bitrate);
[waveform_ami, t_ami, psd_ami, f_ami] = ami(bits, bitrate);
[waveform_manchester, t_manchester, psd_manchester, f_manchester] = manchester(bits, bitrate);
[waveform_mlt3, t_mlt3, psd_mlt3, f_mlt3] = mlt3(bits, bitrate);

% Plot waveforms for different encoding schemes
figure(1);
subplot(6, 1, 1);
plot(t_nrz, waveform_nrz, 'LineWidth', 3);
axis([0 t_nrz(end) min(waveform_nrz)-0.1 max(waveform_nrz)+0.1]);
grid on;
title(['Polar NRZ: [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

subplot(6, 1, 2);
plot(t_nrzi, waveform_nrzi, 'LineWidth', 3);
axis([0 t_nrzi(end) min(waveform_nrzi)-0.1 max(waveform_nrzi)+0.1]);
grid on;
title(['Polar NRZI: [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

subplot(6, 1, 3);
plot(t_rz, waveform_rz, 'LineWidth', 3);
axis([0 t_rz(end) min(waveform_rz)-0.1 max(waveform_rz)+0.1]);
grid on;
title(['Polar RZ: [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

subplot(6, 1, 4);
plot(t_ami, waveform_ami, 'LineWidth', 3);
axis([0 t_ami(end) min(waveform_ami)-0.1 max(waveform_ami)+0.1]);
grid on;
title(['Alternative mark inversion (AMI): [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

subplot(6, 1, 5);
plot(t_manchester, waveform_manchester, 'LineWidth', 3);
axis([0 t_manchester(end) min(waveform_manchester)-0.1 max(waveform_manchester)+0.1]);
grid on;
title(['Manchester coding: [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

subplot(6, 1, 6);
plot(t_mlt3, waveform_mlt3, 'LineWidth', 3);
axis([0 t_mlt3(end) min(waveform_mlt3)-0.1 max(waveform_mlt3)+0.1]);
grid on;
title(['Multi-level transmission 3: [' num2str(bits) ']']);
xlabel('time (s))');
ylabel('level');

saveas(gcf, '..\figures\line-code\line-codes.png');


% Plot power spectral density (PSD) for different encoding schemes
figure(2);
subplot(6, 1, 1);
plot(f_nrz, psd_nrz, 'LineWidth', 2);
axis([f_nrz(1) f_nrz(end) min(psd_nrz)-10 max(psd_nrz)+10]);
grid on;
title(['Polar NRZ: [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

subplot(6, 1, 2);
plot(f_nrzi, psd_nrzi, 'LineWidth', 2);
axis([f_nrzi(1) f_nrzi(end) min(psd_nrzi)-10 max(psd_nrzi)+10]);
grid on;
title(['Polar NRZI: [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

subplot(6, 1, 3);
plot(f_rz, psd_rz, 'LineWidth', 2);
axis([f_rz(1) f_rz(end) min(psd_rz)-10 max(psd_rz)+10]);
grid on;
title(['Polar RZ: [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

subplot(6, 1, 4);
plot(f_ami, psd_ami, 'LineWidth', 2);
axis([f_ami(1) f_ami(end) min(psd_ami)-10 max(psd_ami)+10]);
grid on;
title(['Alternative mark inversion (AMI): [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

subplot(6, 1, 5);
plot(f_manchester, psd_manchester, 'LineWidth', 2);
axis([f_manchester(1) f_manchester(end) min(psd_manchester)-10 max(psd_manchester)+10]);
grid on;
title(['Manchester coding: [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

subplot(6, 1, 6);
plot(f_mlt3, psd_mlt3, 'LineWidth', 2);
axis([f_mlt3(1) f_mlt3(end) min(psd_mlt3)-10 max(psd_mlt3)+10]);
grid on;
title(['Multi-level transmission 3: [' num2str(bits) ']']);
xlabel('frequency (Hz))');
ylabel('power (dB)');

saveas(gcf, '..\figures\line-code\psd.png');

