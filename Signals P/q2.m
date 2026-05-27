% ============================================
% Question II - CORRECTED FINAL
% ============================================
clc; clear; close all;

t = 0:0.001:64;

y1 = 10 * sin(0.25*pi*t);
y2 = 5  * cos(0.125*pi*t);
y3 = 8  * sin(2*pi*t);

% --- Part 2: Subplots ---
figure(1);
subplot(3,1,1); plot(t,y1,'b','LineWidth',1.2);
title('y1(t)=10sin(0.25\pit) [T=8s]'); xlabel('t'); grid on;
subplot(3,1,2); plot(t,y2,'r','LineWidth',1.2);
title('y2(t)=5cos(0.125\pit) [T=16s]'); xlabel('t'); grid on;
subplot(3,1,3); plot(t,y3,'g','LineWidth',1.2);
title('y3(t)=8sin(2\pit) [T=1s]'); xlabel('t'); grid on;
sgtitle('Q II - Part 2: Individual Signals');

% --- Part 3: Combined on same figure ---
m1 = y1 + y2;
m2 = y1 - y2;
m3 = y2 .* y3;
m4 = y1 .* y3;

figure(2);
plot(t,m1,'b','LineWidth',1.2); hold on;
plot(t,m2,'r','LineWidth',1.2);
plot(t,m3,'g','LineWidth',1.2);
plot(t,m4,'m','LineWidth',1.2);
legend('m1=y1+y2','m2=y1-y2','m3=y2*y3','m4=y1*y3');
title('Q II - Part 3: Combined Signals'); xlabel('t'); grid on;

% --- Part 4: Periodicity Analysis ---
fprintf('\n========== Part 4: Signal Analysis ==========\n\n');

T_y1=8; T_y2=16; T_y3=1;

T_m1 = lcm(T_y1, T_y2);
fprintf('m1 = y1+y2:\n');
fprintf('  Periodic: YES, T = LCM(%d,%d) = %d s\n', T_y1,T_y2,T_m1);
fprintf('  Alternating: YES (oscillates around zero)\n');
fprintf('  Half-wave odd symmetry: NO\n');
fprintf('  Proof: m1(t+8)=10sin(0.25pi*t)-5cos(0.125pi*t) != -m1(t)\n\n');

T_m2 = lcm(T_y1, T_y2);
fprintf('m2 = y1-y2:\n');
fprintf('  Periodic: YES, T = %d s\n', T_m2);
fprintf('  Alternating: YES\n');
fprintf('  Half-wave odd symmetry: NO\n\n');

T_m3 = lcm(T_y2, T_y3);
fprintf('m3 = y2*y3:\n');
fprintf('  Periodic: YES, T = LCM(%d,%d) = %d s\n', T_y2,T_y3,T_m3);
fprintf('  Alternating: YES\n');
fprintf('  Half-wave odd symmetry: YES\n');
fprintf('  Proof: m3(t+8)=40sin(2pi*t)*(-cos(0.125pi*t))=-m3(t)\n\n');

T_m4 = lcm(T_y1, T_y3);
fprintf('m4 = y1*y3:\n');
fprintf('  Periodic: YES, T = LCM(%d,%d) = %d s\n', T_y1,T_y3,T_m4);
fprintf('  Alternating: YES\n');
fprintf('  Half-wave odd symmetry: YES\n');
fprintf('  Proof: m4(t+4)=80*(-sin(0.25pi*t))*sin(2pi*t)=-m4(t)\n\n');

% --- Part 5: Amplitude Spectrum ---
Fs = 1/0.001;
N  = length(t);
f  = (0:floor(N/2)) * (Fs/N);

signals = {m1, m2, m3, m4};
names   = {'m1=y1+y2','m2=y1-y2','m3=y2*y3','m4=y1*y3'};

figure(3);
for k = 1:4
    Y   = fft(signals{k}, N);
    amp = (2/N)*abs(Y(1:floor(N/2)+1));
    amp(1) = amp(1)/2;
    subplot(4,1,k);
    stem(f, amp, 'filled','MarkerSize',3);
    xlim([0 3]);
    title(['Amplitude Spectrum of ' names{k}]);
    xlabel('f (Hz)'); ylabel('|X(f)|'); grid on;
end
sgtitle('Q II - Part 5: Amplitude Spectra');