% ============================================
% Question III - CORRECTED FINAL
% ============================================
clc; clear; close all;

tspan = [0 100];
y0_1 = [0];
y0_2 = [0 0];

ode1 = @(t,y) [-0.125*y(1) + 5];
ode2 = @(t,y) [y(2); -5*y(1) - 7*y(2) + 5*cos(0.01*pi*t)];
ode3 = @(t,y) [y(2); -5*y(1) - 4*y(2) + 5];
ode4 = @(t,y) [y(2); -5*y(1) + 4*y(2) + 5];

[t1,y1] = ode45(ode1, tspan, y0_1);
[t2,y2] = ode45(ode2, tspan, y0_2);
[t3,y3] = ode45(ode3, tspan, y0_2);
[t4,y4] = ode45(ode4, tspan, y0_2);

figure(1);
subplot(4,1,1); plot(t1,y1,'b','LineWidth',1.5);
title('Sys1: dy/dt + 0.125y = 5u(t)'); xlabel('t'); ylabel('y(t)'); grid on;
subplot(4,1,2); plot(t2,y2(:,1),'r','LineWidth',1.5);
title('Sys2: y'''' + 7y'' + 5y = 5cos(0.01\pit)'); xlabel('t'); ylabel('y(t)'); grid on;
subplot(4,1,3); plot(t3,y3(:,1),'g','LineWidth',1.5);
title('Sys3: y'''' + 4y'' + 5y = 5u(t)'); xlabel('t'); ylabel('y(t)'); grid on;
subplot(4,1,4); plot(t4,y4(:,1),'m','LineWidth',1.5);
title('Sys4: y'''' - 4y'' + 5y = 5u(t)'); xlabel('t'); ylabel('y(t)'); grid on;
sgtitle('Q III - Zero-State Responses');

fprintf('\n========== Stability & Steady-State Analysis ==========\n\n');

% --- System 1 ---
r1   = roots([1, 0.125]);
tau1 = -1/real(r1);
SS1  = 5/0.125;
fprintf('System 1: dy/dt + 0.125y = 5u(t)\n');
fprintf('  Root: %.4f\n', r1);
fprintf('  Stability: STABLE (root in left half-plane)\n');
fprintf('  Type: Asymptotically Stable\n');
fprintf('  tau = %.1f s,  4*tau = %.1f s\n', tau1, 4*tau1);
fprintf('  Steady State: EXISTS → CONSTANT = %.1f\n\n', SS1);

% --- System 2 ---
r2   = roots([1, 7, 5]);
tau2 = -1/max(real(r2));
w0   = 0.01*pi;
H2   = 5 / (-(w0^2) + 7j*w0 + 5);
SS2_amp   = abs(H2);
SS2_phase = angle(H2)*180/pi;
fprintf('System 2: y'''' + 7y'' + 5y = 5cos(0.01*pi*t)\n');
fprintf('  Roots: %.4f, %.4f\n', r2(1), r2(2));
fprintf('  Stability: STABLE (both roots negative)\n');
fprintf('  Type: Asymptotically Stable\n');
fprintf('  tau = %.4f s,  4*tau = %.4f s\n', tau2, 4*tau2);
fprintf('  Steady State: EXISTS → SINUSOIDAL\n');
fprintf('  SS Amplitude = %.4f, Phase = %.2f degrees\n\n', SS2_amp, SS2_phase);

% --- System 3 ---
r3   = roots([1, 4, 5]);
tau3 = -1/real(r3(1));
SS3  = 5/5;
fprintf('System 3: y'''' + 4y'' + 5y = 5u(t)\n');
fprintf('  Roots: %.4f +/- %.4fi\n', real(r3(1)), abs(imag(r3(1))));
fprintf('  Stability: STABLE (negative real part)\n');
fprintf('  Type: Asymptotically Stable (damped oscillation)\n');
fprintf('  tau = %.4f s,  4*tau = %.4f s\n', tau3, 4*tau3);
fprintf('  Steady State: EXISTS → CONSTANT = %.1f\n\n', SS3);

% --- System 4 ---
r4 = roots([1, -4, 5]);
fprintf('System 4: y'''' - 4y'' + 5y = 5u(t)\n');
fprintf('  Roots: %.4f +/- %.4fi\n', real(r4(1)), abs(imag(r4(1))));
fprintf('  Stability: UNSTABLE (positive real part)\n');
fprintf('  Type: Unstable\n');
fprintf('  Steady State: DOES NOT EXIST (response diverges)\n\n');