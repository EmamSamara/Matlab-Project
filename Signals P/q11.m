% ============================================
% Question XI - CORRECTED FINAL
% ============================================
clc; clear; close all;

dt   = 0.001;
Fs   = 1/dt;
rect = @(t) (abs(t) <= 0.5);

%% --- Signal 1: x(t) = π(t/5) ---
t1 = -10:dt:10;
x1 = rect(t1/5);
N1 = length(t1);
f1 = (-N1/2:N1/2-1)*(Fs/N1);
X1 = fftshift(fft(x1)*dt);
X1_th = 5*sinc(5*f1);

figure(1);
subplot(3,1,1);
plot(t1, x1, 'b', 'LineWidth',1.5);
title('Signal 1: x(t) = \pi(t/5)');
xlabel('t'); ylabel('x(t)'); grid on; xlim([-8 8]);

subplot(3,1,2);
plot(f1, abs(X1), 'r', 'LineWidth',1.5); hold on;
plot(f1, abs(X1_th), 'g--', 'LineWidth',1.2);
legend('Numerical FFT','Theoretical: 5sinc(5f)');
title('|X1(f)| - Magnitude Spectrum');
xlabel('f (Hz)'); ylabel('|X(f)|'); grid on; xlim([-2 2]);

subplot(3,1,3);
plot(f1, angle(X1), 'r', 'LineWidth',1.2);
title('Phase Spectrum of X1(f)');
xlabel('f (Hz)'); ylabel('Phase (rad)'); grid on; xlim([-2 2]);
sgtitle('Q XI - Signal 1: \pi(t/5)');

fprintf('Signal 1: X(f) = 5*sinc(5f)  [rect of width 5 → sinc scaled by 5]\n\n');

%% --- Signal 2: x(t) = 10sin(2πt)*cos(40πt) ---
% Identity: 10sin(A)cos(B) = 5[sin(A+B)+sin(A-B)]
% = 5sin(42πt) + 5sin(-38πt) = 5sin(42πt) - 5sin(38πt)
% Frequencies: f = 21 Hz and f = 19 Hz

t2  = -50:dt:50;   % Long time for good frequency resolution
x2  = 10*sin(2*pi*t2) .* cos(40*pi*t2);
N2  = length(t2);
f2  = (-N2/2:N2/2-1)*(Fs/N2);
X2  = fftshift(fft(x2)*dt);

figure(2);
subplot(2,1,1);
plot(t2, x2, 'b', 'LineWidth',1.0);
title('Signal 2: x(t) = 10sin(2\pit)cos(40\pit)');
xlabel('t'); ylabel('x(t)'); grid on; xlim([-5 5]);

subplot(2,1,2);
plot(f2, abs(X2), 'r', 'LineWidth',1.5);
xlim([-25 25]);
xline( 19,'--k','LineWidth',1.2);
xline(-19,'--k','LineWidth',1.2);
xline( 21,'--k','LineWidth',1.2);
xline(-21,'--k','LineWidth',1.2);
text( 19.2, max(abs(X2))*0.85, '19 Hz','FontSize',9,'Color','k');
text( 21.2, max(abs(X2))*0.85, '21 Hz','FontSize',9,'Color','k');
title('|X2(f)| - Peaks at \pm19 Hz and \pm21 Hz');
xlabel('f (Hz)'); ylabel('|X(f)|'); grid on;
sgtitle('Q XI - Signal 2');

fprintf('Signal 2: 10sin(2πt)cos(40πt) = 5sin(42πt) - 5sin(38πt)\n');
fprintf('Theoretical frequencies: ±19 Hz and ±21 Hz\n\n');

%% --- Signal 3: x(t) = 10e^(-3t)*u(t) ---
% Theoretical: X(f) = 10/(3 + j2πf)
t3  = 0:dt:10;
x3  = 10*exp(-3*t3);
N3  = length(t3);
f3  = (-N3/2:N3/2-1)*(Fs/N3);
X3  = fftshift(fft(x3)*dt);
X3_th = 10 ./ (3 + 1j*2*pi*f3);

figure(3);
subplot(2,1,1);
plot(t3, x3, 'b', 'LineWidth',1.5);
title('Signal 3: x(t) = 10e^{-3t}u(t)');
xlabel('t'); ylabel('x(t)'); grid on;

subplot(2,1,2);
plot(f3, abs(X3),    'r',  'LineWidth',1.5); hold on;
plot(f3, abs(X3_th), 'g--','LineWidth',1.2);
legend('Numerical FFT','Theoretical: 10/(3+j2\pif)');
title('|X3(f)| - Magnitude Spectrum');
xlabel('f (Hz)'); ylabel('|X(f)|'); grid on; xlim([-10 10]);
sgtitle('Q XI - Signal 3: 10e^{-3t}u(t)');

fprintf('Signal 3: X(f) = 10/(3 + j2πf)\n');
fprintf('|X(f)| = 10/sqrt(9 + (2πf)^2)\n');