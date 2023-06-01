% Parameters
Fs = 1000; % Sampling frequency (Hz)
T = 1; % Signal duration (s)
N = T*Fs; % Number of samples
variance = 0.5; % Signal variance
fc1 = 50; % Cut-off frequency of filter 1 (Hz)
fc2 = 100; % Cut-off frequency of filter 2 (Hz)
fc3 = 200; % Cut-off frequency of filter 3 (Hz)

% Create random signal with zero mean and specified variance
x = sqrt(variance)*randn(N,1);

% Filter design
[b1, a1] = butter(4, fc1/(Fs/2)); % 4th order Butterworth filter with fc1 cut-off frequency
[b2, a2] = butter(4, fc2/(Fs/2)); % 4th order Butterworth filter with fc2 cut-off frequency
[b3, a3] = butter(4, fc3/(Fs/2)); % 4th order Butterworth filter with fc3 cut-off frequency

% Filter signal
y1 = filter(b1, a1, x); % Filtered signal with filter 1
y2 = filter(b2, a2, x); % Filtered signal with filter 2
y3 = filter(b3, a3, x); % Filtered signal with filter 3

% Calculate mean and variance of filtered signals
mean_y1 = mean(y1);
mean_y2 = mean(y2);
mean_y3 = mean(y3);
var_y1 = std(y1)^2;
var_y2 = std(y2)^2;
var_y3 = std(y3)^2;

% Display results
disp(['Mean of filtered signal with filter 1: ', num2str(mean_y1)]);
disp(['Variance of filtered signal with filter 1: ', num2str(var_y1)]);
disp(['Mean of filtered signal with filter 2: ', num2str(mean_y2)]);
disp(['Variance of filtered signal with filter 2: ', num2str(var_y2)]);
disp(['Mean of filtered signal with filter 3: ', num2str(mean_y3)]);
disp(['Variance of filtered signal with filter 3: ', num2str(var_y3)]);
