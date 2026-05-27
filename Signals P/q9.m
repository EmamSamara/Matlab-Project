% ============================================
% Question IX - MISO System
% ============================================
clc; clear; close all;

% H1(s) = 10000(s+3) / (s^2+6s+8)
num1 = 10000 * [1, 3];
den1 = [1, 6, 8];
sys1 = tf(num1, den1);

% H2(s) = 100(s-3) / (s^2+2s+1)
num2 = 100 * [1, -3];
den2 = [1, 2, 1];
sys2 = tf(num2, den2);

fprintf('=== H1(s) ===\n'); sys1
fprintf('=== H2(s) ===\n'); sys2

% --- Poles & Stability ---
p1 = pole(sys1); p2 = pole(sys2);
fprintf('\nH1 poles: '); disp(p1.');
fprintf('H2 poles: '); disp(p2.');

fprintf('\n=== Stability ===\n');
if all(real(p1) < 0)
    fprintf('H1: STABLE\n');
else
    fprintf('H1: UNSTABLE\n');
end
if all(real(p2) < 0)
    fprintf('H2: STABLE\n');
else
    fprintf('H2: UNSTABLE\n');
end

% --- Step Responses ---
figure(1);
subplot(2,1,1);
step(sys1);
title('Step Response H1(s) = 10000(s+3)/(s^2+6s+8)');
grid on;

subplot(2,1,2);
step(sys2);
title('Step Response H2(s) = 100(s-3)/(s^2+2s+1)');
grid on;
sgtitle('Question IX - Step Responses');

% --- Frequency Response H1(w) ---
figure(2);
w = logspace(-2, 4, 1000);
[mag, phase] = bode(sys1, w);
mag = squeeze(mag);
phase = squeeze(phase);

subplot(2,1,1);
semilogx(w, 20*log10(mag), 'b', 'LineWidth', 1.5);
title('H1(\omega) - Magnitude (Bode)');
xlabel('\omega (rad/s)'); ylabel('|H1| (dB)'); grid on;

subplot(2,1,2);
semilogx(w, phase, 'r', 'LineWidth', 1.5);
title('H1(\omega) - Phase');
xlabel('\omega (rad/s)'); ylabel('Phase (deg)'); grid on;

sgtitle('Question IX - Frequency Response H1(\omega)');