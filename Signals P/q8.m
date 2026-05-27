% ============================================
% Question VIII - H(s) = 10000(s+2)/(s^2+4s+5)
% ============================================
clc; clear; close all;

num = 10000 * [1, 2];
den = [1, 4, 5];
sys = tf(num, den);

fprintf('=== Transfer Function ===\n');
sys

% --- Pole-Zero Map ---
p = pole(sys);
z = zero(sys);
fprintf('\nPoles: '); disp(p);
fprintf('Zeros: '); disp(z);

fprintf('\n=== Stability ===\n');
if all(real(p) < 0)
    fprintf('STABLE - all poles in left half-plane\n');
    fprintf('Poles: %.4f ± %.4fi\n', real(p(1)), abs(imag(p(1))));
else
    fprintf('UNSTABLE\n');
end

figure(1);
pzmap(sys);
title('Question VIII - Pole-Zero Map');
grid on;

% --- Step Response ---
figure(2);
subplot(2,1,1);
step(sys);
title('Step Response: H(s) = 10000(s+2)/(s^2+4s+5)');
grid on;

% --- Ramp Response ---
s = tf('s');
sys_ramp = sys / s;

subplot(2,1,2);
step(sys_ramp, 10);
title('Ramp Response');
grid on;

sgtitle('Question VIII - Step and Ramp Responses');