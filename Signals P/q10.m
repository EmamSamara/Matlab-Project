% ============================================
% Question X - AM Modulation
% ============================================
clc; clear; close all;

% Parameters
fm = 0.25;   % Message frequency (Hz)
fc = 8;      % Carrier frequency (Hz)
Am = 10;     % Message amplitude
Ac = 15;     % Carrier amplitude

% Time vector (4 cycles of lowest frequency = message)
t = 0:0.001:16;

% Signals
msg     = Am * sin(2*pi*fm*t);
carrier = Ac * cos(2*pi*fc*t);

% Standard AM: s(t) = [Ac + m(t)] * cos(2*pi*fc*t)
modulated = (Ac + msg) .* cos(2*pi*fc*t);

% --- Periodicity Check ---
fprintf('=== Periodicity Analysis ===\n');
fprintf('Message period:    Tm = 1/%.2f = %.2f s\n', fm, 1/fm);
fprintf('Carrier period:    Tc = 1/%.2f = %.4f s\n', fc, 1/fc);
fprintf('Ratio Tm/Tc = %.1f (integer) → Modulated signal IS PERIODIC\n', (1/fm)/(1/fc));
fprintf('Fundamental period = Tm = %.2f s\n\n', 1/fm);

% --- Spectrum Function ---
Fs = 1/0.001;
N  = length(t);
f  = (-N/2:N/2-1) * (Fs/N);

spec = @(x) fftshift(abs(fft(x,N)/N));

S_msg  = spec(msg);
S_car  = spec(carrier);
S_mod  = spec(modulated);

% --- Plots ---
figure(1);
subplot(3,2,1);
plot(t, msg, 'b', 'LineWidth', 1.2);
title('Message m(t) = 10sin(2\pi·0.25t)');
xlabel('t (s)'); ylabel('Amplitude'); grid on;

subplot(3,2,2);
stem(f, S_msg, 'b', 'filled', 'MarkerSize', 2);
xlim([-15 15]);
title('Spectrum of Message');
xlabel('f (Hz)'); ylabel('|M(f)|'); grid on;

subplot(3,2,3);
plot(t, carrier, 'r', 'LineWidth', 1.2);
title('Carrier c(t) = 15cos(2\pi·8t)');
xlabel('t (s)'); ylabel('Amplitude'); grid on;

subplot(3,2,4);
stem(f, S_car, 'r', 'filled', 'MarkerSize', 2);
xlim([-15 15]);
title('Spectrum of Carrier');
xlabel('f (Hz)'); ylabel('|C(f)|'); grid on;

subplot(3,2,5);
plot(t, modulated, 'g', 'LineWidth', 1.2);
title('AM Signal s(t) = [15 + m(t)]cos(2\pi·8t)');
xlabel('t (s)'); ylabel('Amplitude'); grid on;

subplot(3,2,6);
stem(f, S_mod, 'g', 'filled', 'MarkerSize', 2);
xlim([-15 15]);
title('Spectrum of AM Signal');
xlabel('f (Hz)'); ylabel('|S(f)|'); grid on;

sgtitle('Question X - AM Modulation');