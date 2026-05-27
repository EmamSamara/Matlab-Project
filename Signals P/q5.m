% ============================================
% Question V - Convolution Integral
% ============================================
clc; clear; close all;

dt = 0.01;
rect = @(t) (abs(t) <= 0.5);

%% --- Pair 1: y1 and y2 ---
t1 = -20:dt:20;

y1 = (10 * exp(2*t1)) .* rect((t1-3)/6);
y2 = 12 * sin(0.25*pi*t1) .* rect((t1-1)/2);

conv1 = conv(y1, y2, 'full') * dt;
n1 = length(conv1);
t_c1 = (0:n1-1)*dt + 2*t1(1);

figure(1);
subplot(3,1,1);
plot(t1, y1, 'b', 'LineWidth', 1.5);
title('y1(t)'); xlabel('t'); grid on;

subplot(3,1,2);
plot(t1, y2, 'r', 'LineWidth', 1.5);
title('y2(t)'); xlabel('t'); grid on;

subplot(3,1,3);
plot(t_c1, conv1, 'g', 'LineWidth', 1.5);
title('Convolution y1 * y2'); xlabel('t'); grid on;

sgtitle('Question V - Pair 1');

%% --- Pair 2: y3 and y4 ---
t2 = -5:dt:5;

y3 = (10 * exp(2*t2)) .* rect((t2-0.1)/0.1);
y4 = rect((t2-1)/2);

conv2 = conv(y3, y4, 'full') * dt;
n2 = length(conv2);
t_c2 = (0:n2-1)*dt + 2*t2(1);

figure(2);
subplot(3,1,1);
plot(t2, y3, 'b', 'LineWidth', 1.5);
title('y3(t)'); xlabel('t'); grid on;

subplot(3,1,2);
plot(t2, y4, 'r', 'LineWidth', 1.5);
title('y4(t)'); xlabel('t'); grid on;

subplot(3,1,3);
plot(t_c2, conv2, 'g', 'LineWidth', 1.5);
title('Convolution y3 * y4'); xlabel('t'); grid on;

sgtitle('Question V - Pair 2');