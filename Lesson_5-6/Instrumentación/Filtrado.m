fs = 1000; % Frecuencia de muestreo en Hz
t = 0:1/fs:2; % Tiempo de 0 a 2 segundos


f1 = 1; % Frecuencia fundamental en Hz
f2 = 2; % Segunda armónica en Hz
f3 = 3; % Tercera armónica en Hz
noise =0;
noise = 0.01 * randn(size(t));  % Ruido blanco gaussiano

heart_signal = 0.05*sin(2*pi*f1*t) + 0.03*sin(2*pi*f2*t) + 0.01*sin(2*pi*f3*t)+noise;

% Graficar la señal
figure;
plot(t, heart_signal);
title('Señal del Corazón');
xlabel('Tiempo (s)');
ylabel('Amplitud');
hold on

heart_signal_amplified=46*heart_signal;
plot(t, heart_signal_amplified);
title('Señal del Corazón Amplificada');

grid on;

order = 2; %<-- cambie el orden del filtro
fc = 2; 
Wn = fc / (fs/2); 
"a continuación se muestran los coeficientes de la función de transferencia del filtro"
[b, a] = butter(order, Wn, 'low') %<---high

heart_signal_filtered = filter(b, a, heart_signal_amplified);
figure; 
plot(t, heart_signal_amplified, 'b'); 
hold on;
plot(t, heart_signal_filtered, 'r', 'LineWidth', 2);
title('Comparación de Señal Amplificada vs. Señal Filtrada');
xlabel('Tiempo (s)');
ylabel('Amplitud');
legend('Señal Amplificada con Ruido', 'Señal Filtrada');
grid on;

%filterAnalyzer(b,a)