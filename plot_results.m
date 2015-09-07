% Octave script to plot parallel and serial filter responses

x_s = textread('s_out.txt');
index = find(isnan(x_s));
x_s(index) = 0;

x_p = textread('p_out.txt');
index = find(isnan(x_p));
x_p(index) = 0;

figure
subplot(2,1,1)
plot(x_s)
title('Serial filter')
grid on
subplot(2,1,2)
plot(x_p)
title('Parallel filter')
grid on


X_s = fftshift(fft(x_s));

X_p = fftshift(fft(x_p));

figure
subplot(2,1,1)
plot(20*log10(abs(X_s)))
title('Serial filter frequency response')
grid on
subplot(2,1,2)
plot(20*log10(abs(X_p)))
title('Parallel filter frequency response')
grid on
