% ============================================
% Question VII - CORRECTED FINAL
% ============================================
clc; clear; close all;

% 6y^(5) - 7y''' + 2y' + 9y = 10x' + 5x
% H(s) = (10s + 5) / (6s^5 - 7s^3 + 2s + 9)
num = [10, 5];
den = [6, 0, -7, 0, 2, 9];
sys = tf(num, den);

fprintf('=== Transfer Function H(s) ===\n');
sys

p = pole(sys);
z = zero(sys);
fprintf('Poles:\n'); disp(p);
fprintf('Zeros:\n'); disp(z);

fprintf('\n=== Stability Analysis ===\n');
if all(real(p) < 0)
    fprintf('System is STABLE (all poles in left half-plane)\n');
elseif all(real(p) <= 0)
    fprintf('System is MARGINALLY STABLE\n');
else
    fprintf('System is UNSTABLE (poles in right half-plane)\n');
    fprintf('Unstable poles:\n');
    disp(p(real(p) > 0));
end

% --- Pole-Zero Map ---
figure(1);
pzmap(sys);
title('Q VII - Pole-Zero Map');
grid on;

% --- Step and Ramp Response (short time since unstable) ---
figure(2);
subplot(2,1,1);
step(sys, 2);
title('Step Response of H(s)  [Unstable - diverges]');
grid on;

s_tf = tf('s');
sys_ramp = sys / s_tf;
subplot(2,1,2);
step(sys_ramp, 2);
title('Ramp Response [x(t)=r(t)]  [Unstable - diverges]');
grid on;

sgtitle('Q VII - System Responses');