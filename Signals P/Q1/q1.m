% ============================================
% Question I - Signal Generation
% ============================================
clc; clear; close all;

t = -20:0.01:30;

% --- Helper functions ---
u = @(t) (t >= 0);                          % Unit step
r = @(t) t .* (t >= 0);                     % Ramp
rect = @(t) (abs(t) <= 0.5);               % Rectangle (pi function)

% --- Signal 1: rect((t-10)/6) * 5 ---
s1 = 5 * rect((t - 10) / 6);

% --- Signal 2: u(t-1) - r(-t+7) + r(t+4) + rect((t+1)/6) ---
s2 = u(t-1) - r(-t+7) + r(t+4) + rect((t+1)/6);

% --- Signal 3: rect((t-3)/6) - r(t-7) + r(t-13) - u(t-13) ---
t3 = 0:0.01:22;
s3 = rect((t3-3)/6) - r(t3-7) + r(t3-13) - u(t3-13);

% ============================================
% Plot all on ONE figure
% ============================================
figure(1);
plot(t, s1, 'r', 'LineWidth', 1.5); hold on;
plot(t, s2, 'b', 'LineWidth', 1.5);
plot(t3, s3, 'g', 'LineWidth', 1.5);
legend('Signal 1','Signal 2','Signal 3');
title('Question I - All Signals');
xlabel('t'); ylabel('Amplitude'); grid on;

% ============================================
% Plot as SUBPLOTS
% ============================================
figure(2);
subplot(3,1,1);
plot(t, s1, 'r', 'LineWidth', 1.5);
title('Signal 1: 5\pi((t-10)/6)');
xlabel('t'); ylabel('x(t)'); grid on;

subplot(3,1,2);
plot(t, s2, 'b', 'LineWidth', 1.5);
title('Signal 2: u(t-1) - r(-t+7) + r(t+4) + \pi((t+1)/6)');
xlabel('t'); ylabel('x(t)'); grid on;

subplot(3,1,3);
plot(t3, s3, 'g', 'LineWidth', 1.5);
title('Signal 3: \pi((t-3)/6) - r(t-7) + r(t-13) - u(t-13)');
xlabel('t'); ylabel('x(t)'); grid on;