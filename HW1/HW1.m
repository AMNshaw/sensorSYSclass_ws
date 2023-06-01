clc;close all; clear

% Set the parameters
num_sets = 100; % number of sets of random signals
num_points = 1000; % number of points in each set of signals
std_dev = 2; % standard deviation of the random signals
sampling_time = 1e-3; % sampling time of each signal
total_time = 1; % total integration time

% Generate the random signals
signals = std_dev * randn(num_points, num_sets);

% Integrate each set of signals
integrated_signals = cumsum(signals, 1) * sampling_time;

% Plot the mean value and standard deviation of the signals as a function of time
time_axis = linspace(0, total_time, num_points);
mean_values = mean(integrated_signals, 2);
std_dev_values = std(integrated_signals, 0, 2);
figure;
plot(time_axis, mean_values);
hold on;
plot(time_axis, std_dev_values);
xlabel('Time (s)');
ylabel('Signal value');
legend('Mean value', 'Standard deviation');
title('Standard deviation & mean value of 100 sets of random signals');

% Perform curve fitting for standard deviation

A = [log(0.001:0.001:1)', ones(num_points, 1)];
b = log(std_dev_values);
x = lsqr(A,b);
c2 = x(1);
c1 = exp(x(2));
disp(['c2 = ' num2str(c2)]);
% Plot the curve fitting result
fit_std_dev_values = c1 * time_axis .^ c2;
figure;
loglog(time_axis, std_dev_values, 'o');
hold on;
loglog(time_axis, fit_std_dev_values);
xlabel('Time (s)');
ylabel('Standard deviation');
legend('Actual values', 'Curve fitting');
c2_str = ['c2 = ' num2str(c2(1), '%.2f')];
title({'Standard deviation of 100 sets of random signals', c2_str}, 'Interpreter', 'none');
