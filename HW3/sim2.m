clc;clear;close all;

% Define the input signal
N = 1000;
dt = 0.001;
n = 2*randn(1,N); % random signal with zero mean and standard deviation of 2
x = 2.5*sin(2*pi*5*(0:N-1)*dt) + 10*sin(2*pi*100*(0:N-1)*dt) + n;

% Design the two low pass filters
fc = 10; % passband frequency
fs = 1/dt; % sampling frequency
[b1, a1] = butter(1, fc/(fs/2)); % 1st order filter
[b2, a2] = butter(2, fc/(fs/2)); % 2nd order filter

% Filter the input signal
y1 = filter(b1, a1, x); % 1st order filter output
y2 = filter(b2, a2, x); % 2nd order filter output

% Plot the time-domain and frequency-domain results
% Time-domain plots
figure;
subplot(3,1,1);
plot((0:N-1)*dt, x);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot((0:N-1)*dt, y1);
title('1st Order Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot((0:N-1)*dt, y2);
title('2nd Order Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Frequency-domain plots
Y = fft(y2); % FFT of 2nd order filtered signal
f = (0:N-1)*(fs/N); % frequency axis
figure;
subplot(2,1,1);
plot(f, abs(fft(x)));
hold on;
plot(f, abs(fft(y1)));
plot(f, abs(Y));
legend('Input Signal', '1st Order Filtered Signal', '2nd Order Filtered Signal');
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(f, angle(Y));
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
