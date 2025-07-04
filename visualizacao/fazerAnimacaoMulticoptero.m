% Geração de gráficos e animações

function fazerAnimacaoMulticoptero(simulacao, planta)

t = simulacao.x.time;
xr = simulacao.xr.signals.values;
yr = simulacao.yr.signals.values;
zr = simulacao.zr.signals.values;
x = simulacao.x.signals.values;
y = simulacao.y.signals.values;
z = simulacao.z.signals.values;
theta = simulacao.theta.signals.values;
phi = simulacao.phi.signals.values;
psi = simulacao.psi.signals.values;
f = simulacao.f.signals.values;
tauy = simulacao.tauy.signals.values;
taux = simulacao.taux.signals.values;
l = planta.l;

% Para ajustar os eixos do gráfico 3D
minX = min(xr) - l*5;
maxX = max(xr) + l*5;
minY = min(yr) - l*5;
maxY = max(yr) + l*5;
minZ = -0.5;
maxZ = max(zr) + l*2;

dt = 1 / 60;
tempoVideo = t(1):dt:t(end);

% Interpolando para que o vídeo fique numa taxa de quadros adequada
xr = interp1(t, xr, tempoVideo);
yr = interp1(t, yr, tempoVideo);
zr = interp1(t, zr, tempoVideo);
x = interp1(t, x, tempoVideo);
y = interp1(t, y, tempoVideo);
z = interp1(t, z, tempoVideo);
theta = interp1(t, theta, tempoVideo);
phi = interp1(t, phi, tempoVideo);
psi = interp1(t, psi, tempoVideo);
f = interp1(t, f, tempoVideo);
taux = interp1(t, taux, tempoVideo);
tauy = interp1(t, tauy, tempoVideo);

% Calculando forças individuais dos rotores (configuração +)
f1 = f / 4.0 + taux / l;                    % Rotor frontal
f2 = f / 4.0 + tauy / l;                    % Rotor direito  
f3 = f / 4.0 - taux / l;                    % Rotor traseiro
f4 = f / 4.0 - tauy / l;                    % Rotor esquerdo

% Fator de escala para visualização das forças
escalaForca = 1;
f1 = escalaForca * f1;
f2 = escalaForca * f2;
f3 = escalaForca * f3;
f4 = escalaForca * f4;

close all;
figure('Color', 'k');
hold on;

% Posições iniciais dos rotores (agora incluindo psi)
[r1, r2, r3, r4] = computarPontosMulticoptero3D(x(1), y(1), z(1), theta(1), phi(1), psi(1), l);

% Desenho inicial do quadricóptero
handleReferencia = plot3(xr(1), yr(1), zr(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% Chassi do quadricóptero (cruz) - configuração +
handleChassiFrontal = plot3([r1(1), r3(1)], [r1(2), r3(2)], [r1(3), r3(3)], 'w-', 'LineWidth', 6);
handleChassisLateral = plot3([r2(1), r4(1)], [r2(2), r4(2)], [r2(3), r4(3)], 'w-', 'LineWidth', 6);

% Centro do quadricóptero
handleCentro = plot3(x(1), y(1), z(1), 'go', 'MarkerSize', 11, 'MarkerFaceColor', 'g');

% Rotores (representados como círculos)
[xCirc, yCirc, zCirc] = criarCirculoRotor(r1, 1.5/8);
handleRotor1 = plot3(xCirc, yCirc, zCirc, 'c-', 'LineWidth', 2);
[xCirc, yCirc, zCirc] = criarCirculoRotor(r2, 1.5/8);
handleRotor2 = plot3(xCirc, yCirc, zCirc, 'c-', 'LineWidth', 2);
[xCirc, yCirc, zCirc] = criarCirculoRotor(r3, 1.5/8);
handleRotor3 = plot3(xCirc, yCirc, zCirc, 'c-', 'LineWidth', 2);
[xCirc, yCirc, zCirc] = criarCirculoRotor(r4, 1.5/8);
handleRotor4 = plot3(xCirc, yCirc, zCirc, 'c-', 'LineWidth', 2);

% Vetores de força (thrust)
handleF1 = quiver3(r1(1), r1(2), r1(3), 0, 0, f1(1), 'y', 'LineWidth', 2, 'MaxHeadSize', 3);
handleF2 = quiver3(r2(1), r2(2), r2(3), 0, 0, f2(1), 'y', 'LineWidth', 2, 'MaxHeadSize', 3);
handleF3 = quiver3(r3(1), r3(2), r3(3), 0, 0, f3(1), 'y', 'LineWidth', 2, 'MaxHeadSize', 3);
handleF4 = quiver3(r4(1), r4(2), r4(3), 0, 0, f4(1), 'y', 'LineWidth', 2, 'MaxHeadSize', 3);

% Seta indicadora da direção frontal do quadricóptero
[direcaoFrontal] = computarDirecaoFrontal(psi(1), l);
handleDirecao = quiver3(x(1), y(1), z(1)  + 0.05 , direcaoFrontal(1), direcaoFrontal(2), 0, 'm', 'LineWidth', 3, 'MaxHeadSize', 2);

% Trajetória
handleTrajetoria = plot3(x(1), y(1), z(1), 'b-', 'LineWidth', 1.4);

% Configuração dos eixos
axis([minX, maxX, minY, maxY, minZ, maxZ]);
axis manual;
grid on;
xlabel('X (m)', 'FontSize', 13, 'Color', 'w');
ylabel('Y (m)', 'FontSize', 13, 'Color', 'w');
zlabel('Z (m)', 'FontSize', 13, 'Color', 'w');
title('Simulação 3D do Quadricóptero com Guinada', 'FontSize', 14, 'Color', 'w');
set(gca, 'FontSize', 13, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'ZColor', 'w');
set(gca, 'GridColor', 'w', 'GridAlpha', 0.6);

% Configurar visualização 3D
view(45, 30);
camlight('headlight');
lighting gouraud;

%Legenda:
leg = legend([handleReferencia, handleCentro, handleChassiFrontal, handleRotor1, handleF1, handleDirecao, handleTrajetoria], ...
             {'Referência', 'Centro', 'Chassi', 'Rotores', 'Forças', 'Direção Frontal', 'Trajetória'}, ...
             'Location', 'best');

% Configurar as propriedades da legenda
set(leg, 'TextColor', 'w');           % Texto branco
set(leg, 'Color', 'k');               % Fundo preto
set(leg, 'EdgeColor', 'w');           % Borda branca
set(leg, 'FontSize', 10);             % Tamanho da fonte (opcional)

% Garantir que a pasta de resultados existe
outputDir = fullfile('..', 'resultados');
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

% Para salvar vídeo
video = VideoWriter(fullfile(outputDir, sprintf('multicoptero_3d_%c.avi', simulacao.experimento)));
video.FrameRate = 60;
video.Quality = 100;
open(video);

drawnow;
f = gcf;
f.Position = [100 100 1280 960];
frame = getframe(gcf);
writeVideo(video, frame);

% Variáveis para armazenar trajetória
trajX = x(1);
trajY = y(1);
trajZ = z(1);

% Loop de animação
for i = 2:length(tempoVideo)
    % Calcular posições dos rotores (agora incluindo psi)
    [r1, r2, r3, r4] = computarPontosMulticoptero3D(x(i), y(i), z(i), theta(i), phi(i), psi(i), l);
    
    % Atualizar referência
    set(handleReferencia, 'XData', xr(i), 'YData', yr(i), 'ZData', zr(i));
    
    % Atualizar centro
    set(handleCentro, 'XData', x(i), 'YData', y(i), 'ZData', z(i));
    
    % Atualizar chassi
    set(handleChassiFrontal, 'XData', [r1(1), r3(1)], 'YData', [r1(2), r3(2)], 'ZData', [r1(3), r3(3)]);
    set(handleChassisLateral, 'XData', [r2(1), r4(1)], 'YData', [r2(2), r4(2)], 'ZData', [r2(3), r4(3)]);
    
    % Atualizar rotores
    [xCirc, yCirc, zCirc] = criarCirculoRotor(r1, 1.5/8);
    set(handleRotor1, 'XData', xCirc, 'YData', yCirc, 'ZData', zCirc);
    [xCirc, yCirc, zCirc] = criarCirculoRotor(r2, 1.5/8);
    set(handleRotor2, 'XData', xCirc, 'YData', yCirc, 'ZData', zCirc);
    [xCirc, yCirc, zCirc] = criarCirculoRotor(r3, 1.5/8);
    set(handleRotor3, 'XData', xCirc, 'YData', yCirc, 'ZData', zCirc);
    [xCirc, yCirc, zCirc] = criarCirculoRotor(r4, 1.5/8);
    set(handleRotor4, 'XData', xCirc, 'YData', yCirc, 'ZData', zCirc);
    
    % Atualizar vetores de força
    set(handleF1, 'XData', r1(1), 'YData', r1(2), 'ZData', r1(3), 'UData', 0, 'VData', 0, 'WData', f1(i), 'LineWidth', 2, 'MaxHeadSize', 3);
    set(handleF2, 'XData', r2(1), 'YData', r2(2), 'ZData', r2(3), 'UData', 0, 'VData', 0, 'WData', f2(i), 'LineWidth', 2, 'MaxHeadSize', 3);
    set(handleF3, 'XData', r3(1), 'YData', r3(2), 'ZData', r3(3), 'UData', 0, 'VData', 0, 'WData', f3(i), 'LineWidth', 2, 'MaxHeadSize', 3);
    set(handleF4, 'XData', r4(1), 'YData', r4(2), 'ZData', r4(3), 'UData', 0, 'VData', 0, 'WData', f4(i), 'LineWidth', 2, 'MaxHeadSize', 3);
    
    % Atualizar direção frontal
    [direcaoFrontal] = computarDirecaoFrontal(psi(i), l);
    set(handleDirecao, 'XData', x(i), 'YData', y(i), 'ZData',  z(i) + 0.05, 'UData', direcaoFrontal(1), 'VData', direcaoFrontal(2), 'WData', 0, 'LineWidth', 2, 'MaxHeadSize', 1);
    
    % Atualizar trajetória
    trajX = [trajX, x(i)];
    trajY = [trajY, y(i)];
    trajZ = [trajZ, z(i)];
    set(handleTrajetoria, 'XData', trajX, 'YData', trajY, 'ZData', trajZ);
    
    drawnow;
    pause(dt);
    frame = getframe(gcf);
    writeVideo(video, frame);
end

close(video);
fprintf('Vídeo salvo como: multicoptero_3d_%c.avi\n', simulacao.experimento);

end

function [r1, r2, r3, r4] = computarPontosMulticoptero3D(x, y, z, theta, phi, psi, l)
% Calcula as posições dos 4 rotores do quadricóptero no espaço 3D
% Configuração em + com o ângulo de guinada (psi)
% r1: rotor frontal
% r2: rotor direito  
% r3: rotor traseiro
% r4: rotor esquerdo

% Posições locais dos rotores (em relação ao centro)
% Configuração em + (plus): frente é um braço
r1_local = [l, 0, 0];        % Rotor frontal
r2_local = [0,-l, 0];        % Rotor direito
r3_local = [-l, 0, 0];       % Rotor traseiro
r4_local = [0, l, 0];       % Rotor esquerdo

% Matrizes de rotação
% Rotação em torno do eixo X (roll - phi)
Rx = [1, 0, 0;
      0, cos(phi), -sin(phi);
      0, sin(phi), cos(phi)];

% Rotação em torno do eixo Y (pitch - theta)
Ry = [cos(theta), 0, sin(theta);
      0, 1, 0;
      -sin(theta), 0, cos(theta)];

% Rotação em torno do eixo Z (yaw - psi)
Rz = [cos(psi), -sin(psi), 0;
      sin(psi), cos(psi), 0;
      0, 0, 1];

% Matriz de rotação combinada (ordem: Rz * Ry * Rx)
% Esta é a sequência de rotações Tait-Bryan Z-Y-X (yaw-pitch-roll)
R = Rz * Ry * Rx;

% Aplicar rotação e translação
r1 = [x, y, z] + (R * r1_local')';
r2 = [x, y, z] + (R * r2_local')';
r3 = [x, y, z] + (R * r3_local')';
r4 = [x, y, z] + (R * r4_local')';

end

function [direcaoFrontal] = computarDirecaoFrontal(psi, l)
% Computa a direção frontal do quadricóptero baseada no ângulo de guinada
% Para configuração +, a frente é ao longo do eixo X local
% Retorna um vetor que aponta na direção frontal

% Direção frontal local (eixo X local) - para configuração +
direcao_local = [l/2, 0, 0];

% Aplicar rotação de guinada
Rz = [cos(psi), -sin(psi), 0;
      sin(psi), cos(psi), 0;
      0, 0, 1];

% Calcular direção frontal no sistema global
direcaoFrontal = (Rz * direcao_local')';

end

function [xCirc, yCirc, zCirc] = criarCirculoRotor(centro, raio)
% Cria um círculo para representar o rotor
theta = linspace(0, 2*pi, 20);
xCirc = centro(1) + raio * cos(theta);
yCirc = centro(2) + raio * sin(theta);
zCirc = centro(3) * ones(size(theta));
end