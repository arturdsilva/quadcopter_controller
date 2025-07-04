% Traça gráficos de uma simulação de voo do multicóptero.
function tracarGraficos(simulacao)

formato = 'png'; % para usuarios de Word
% formato = 'eps'; % para usuarios de LaTeX

% Trajetória 3D
figure;
plot3(simulacao.xr.signals.values, simulacao.yr.signals.values, simulacao.zr.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot3(simulacao.x.signals.values, simulacao.y.signals.values, simulacao.z.signals.values, 'b', 'LineWidth', 2);
xlabel('X (m)', 'FontSize', 14);
ylabel('Y (m)', 'FontSize', 14);
zlabel('Z (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Referência', 'Executado');
grid on;
axis equal;
salvarGrafico(sprintf('trajetoria3D_%c', simulacao.experimento), formato);

% X, Y, Z vs Tempo
figure;
plot(simulacao.tout, simulacao.xr.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.x.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('X (m)', 'FontSize', 14);
legend('X_{ref}', 'X');
grid on;
salvarGrafico(sprintf('t_x_%c', simulacao.experimento), formato);

figure;
plot(simulacao.tout, simulacao.yr.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.y.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Y (m)', 'FontSize', 14);
legend('Y_{ref}', 'Y');
grid on;
salvarGrafico(sprintf('t_y_%c', simulacao.experimento), formato);

figure;
plot(simulacao.tout, simulacao.zr.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.z.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Z (m)', 'FontSize', 14);
legend('Z_{ref}', 'Z');
grid on;
salvarGrafico(sprintf('t_z_%c', simulacao.experimento), formato);

% Ângulos theta, phi e psi vs Tempo
figure;
plot(simulacao.tout, simulacao.thetar.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.theta.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\theta (rad)', 'FontSize', 14);
legend('\theta_{ref}', '\theta');
grid on;
salvarGrafico(sprintf('t_theta_%c', simulacao.experimento), formato);

figure;
plot(simulacao.tout, simulacao.phir.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.phi.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\phi (rad)', 'FontSize', 14);
legend('\phi_{ref}', '\phi');
grid on;
salvarGrafico(sprintf('t_phi_%c', simulacao.experimento), formato);

figure;
plot(simulacao.tout, simulacao.psir.signals.values, 'r--', 'LineWidth', 2);
hold on;
plot(simulacao.tout, simulacao.psi.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\psi (rad)', 'FontSize', 14);
legend('\psi_{ref}', '\psi');
grid on;
salvarGrafico(sprintf('t_psi_%c', simulacao.experimento), formato);

% Força total
figure;
plot(simulacao.tout, simulacao.f.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('f (N)', 'FontSize', 14);
grid on;
salvarGrafico(sprintf('t_f_%c', simulacao.experimento), formato);

% Torques taux, tauy, tauz
figure;
hold on;
plot(simulacao.tout, simulacao.taux.signals.values, 'r', 'LineWidth', 2);
plot(simulacao.tout, simulacao.tauy.signals.values, 'g', 'LineWidth', 2);
plot(simulacao.tout, simulacao.tauz.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\tau (N m)', 'FontSize', 14);
legend('\tau_x', '\tau_y', '\tau_z');
grid on;
salvarGrafico(sprintf('t_torques_%c', simulacao.experimento), formato);

end

% Salva o gráfico na pasta resultados.
function salvarGrafico(nome, formato)
if ~exist('../resultados', 'dir')
    mkdir('../resultados');
end
nomeCompleto = fullfile('../resultados', nome);
if strcmp(formato, 'png')
    print('-dpng', '-r400', nomeCompleto);
else
    print('-depsc2', nomeCompleto);
end
end