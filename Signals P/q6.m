% ============================================
% Question VI - Laplace Transform
% ============================================
clc; clear; close all;

syms t s

% --- Signal 3: y(t) = (10 - 10e^(-0.25t)) u(t) ---
y3 = 10 - 10*exp(-0.25*t);
Y3 = laplace(y3, t, s);
fprintf('=== Signal 3 ===\n');
fprintf('y(t) = (10 - 10e^(-0.25t))u(t)\n');
fprintf('Y(s) = '); disp(Y3);
fprintf('Simplified: '); disp(simplify(Y3));

% --- Signal 4: y(t) = (8 + 4e^(-0.0625t)*cos(0.125πt)) u(t) ---
y4 = 8 + 4*exp(-0.0625*t)*cos(0.125*pi*t);
Y4 = laplace(y4, t, s);
fprintf('=== Signal 4 ===\n');
fprintf('y(t) = (8 + 4e^(-0.0625t)cos(0.125πt))u(t)\n');
fprintf('Y(s) = '); disp(Y4);
fprintf('Simplified: '); disp(simplify(Y4));

% --- Verification: Plot original signals ---
t_num = 0:0.01:60;
y3_num = 10 - 10*exp(-0.25*t_num);
y4_num = 8 + 4*exp(-0.0625*t_num).*cos(0.125*pi*t_num);

figure(1);
subplot(2,1,1);
plot(t_num, y3_num, 'b', 'LineWidth', 1.5);
title('Signal 3: y(t) = (10 - 10e^{-0.25t})u(t)');
xlabel('t'); ylabel('y(t)'); grid on;

subplot(2,1,2);
plot(t_num, y4_num, 'r', 'LineWidth', 1.5);
title('Signal 4: y(t) = (8 + 4e^{-0.0625t}cos(0.125\pit))u(t)');
xlabel('t'); ylabel('y(t)'); grid on;

sgtitle('Question VI - Original Signals');