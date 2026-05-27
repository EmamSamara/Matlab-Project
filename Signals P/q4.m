% ============================================
% Question IV - Step Response using tf()
% ============================================
clc; clear; close all;

% --- System 1 ---
% 5y'''''+2y'''+6y'+4y = 2x''+3x'-6x
% Transfer Function: H(s) = (2s^2+3s-6)/(5s^5+2s^3+6s+4)
num1 = [2, 3, -6];
den1 = [5, 0, 2, 0, 6, 4];
sys1 = tf(num1, den1);

fprintf('=== System 1 Transfer Function ===\n');
sys1

% --- System 2 ---
% y''+2y'+4y = 5x+3x'
% H(s) = (3s+5)/(s^2+2s+4)
num2 = [3, 5];
den2 = [1, 2, 4];
sys2 = tf(num2, den2);

fprintf('=== System 2 Transfer Function ===\n');
sys2

% --- Step Responses ---
figure(1);
subplot(2,1,1);
step(sys1);
title('System 1 Step Response: H(s) = (2s^2+3s-6)/(5s^5+2s^3+6s+4)');
grid on;

subplot(2,1,2);
step(sys2);
title('System 2 Step Response: H(s) = (3s+5)/(s^2+2s+4)');
grid on;

sgtitle('Question IV - Step Responses');

% --- Pole-Zero Maps ---
figure(2);
subplot(2,1,1);
pzmap(sys1);
title('System 1 Pole-Zero Map');
grid on;

subplot(2,1,2);
pzmap(sys2);
title('System 2 Pole-Zero Map');
grid on;

sgtitle('Question IV - Pole-Zero Maps');

% --- Stability Analysis ---
fprintf('\n=== Stability Analysis ===\n');
p1 = pole(sys1);
p2 = pole(sys2);

fprintf('\nSystem 1 poles:\n'); disp(p1);
if all(real(p1) < 0)
    fprintf('System 1: STABLE\n');
else
    fprintf('System 1: UNSTABLE\n');
end

fprintf('\nSystem 2 poles:\n'); disp(p2);
if all(real(p2) < 0)
    fprintf('System 2: STABLE\n');
else
    fprintf('System 2: UNSTABLE\n');
end