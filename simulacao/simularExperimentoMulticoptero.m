% Simulação do sistema Experimento Multicoptero

function simulacao = simularExperimentoMulticoptero(controlador, planta, experimento)
tf = 10;
xr.signals.dimensions = 1;
yr.signals.dimensions = 1;
zr.signals.dimensions = 1;
dt = 1e-3;

if experimento == 'a'
    xr.time = [0; tf];
    xr.signals.values = [0; 0];
    yr.time = [0; tf];
    yr.signals.values = [0; 0];
    zr.time = [0; tf];
    zr.signals.values = [1; 1];
    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);
elseif experimento == 'b'
     xr.time = [0; 1 - dt; 1; tf];
     xr.signals.values = [0; 0; 1; 1];
     yr.time = [0; 1 - dt; 1; tf];
     yr.signals.values = [0; 0; 1; 1];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);
elseif experimento == 'c'
     xr.time = [0; 1 - dt; tf];
     xr.signals.values = [0; 0; 4];
     yr.time = [0; 1 - dt; tf];
     yr.signals.values = [0; 0; 4];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);
elseif experimento == 'd'
     xr.time = [0; tf];
     xr.signals.values = [0; 0];
     yr.time = [0; tf];
     yr.signals.values = [0; 0];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0.2, 0, 0);
elseif experimento == 'e'
    xr.time = [0; 1 - dt; tf];
    xr.signals.values = [0; 0; 4];
    yr.time = [0; 1 - dt; tf];
    yr.signals.values = [0; 0; 4];
    zr.time = [0; tf];
    zr.signals.values = [1; 1];
    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, -2, -2);
elseif experimento == 'f'
    tf = 12;  % Duração longa da simulação
    t = (1+dt:dt:(tf-1))';

    xr.time = [0; 1; t; tf];
    xr.signals.values = [0; 0; cos(0.5 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];

    yr.time = [0; 1; t; tf];
    yr.signals.values = [0; 0; cos(0.5 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];

    zr.time = [0; 1; t; tf];
    zr.signals.values = [2; 2; sin(0.5 * 2 * pi * (t - 1) / (tf - 2)) + 2; 2];

    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);

 elseif experimento == 'g'
     tf = 20;
     t = (1+dt:dt:(tf-1))';
     xr.time = [0; 1; t; tf];
     xr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     yr.time = [0; 1; t; tf];
     yr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     zr.time = [0; 1; t; tf];
     zr.signals.values = [2; 2; sin(2 * 2 * pi * (t - 1) / (tf - 2)) + 2; 2];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);
elseif experimento == 'h'
    tf = 20;                 % tempo total
    n_voltas = 2;            % número de voltas na espiral
    raio = 1;                % raio da espiral
    altura_final = 1;        % altura que se deseja atingir
    
    t = (1+dt:dt:(tf-1))';   % vetor de tempo para interpolação

    % Posições de referência ao longo da espiral
    angulo = 2 * pi * n_voltas * (t - 1) / (tf - 2);
    xr_values = raio * cos(angulo);
    yr_values = raio * sin(angulo);
    zr_values = altura_final * (t - 1) / (tf - 2);  % rampa de z=0 a z=1

    xr.time = [0; 1; t; tf];
    xr.signals.values = [0; 0; xr_values; xr_values(end)];

    yr.time = [0; 1; t; tf];
    yr.signals.values = [0; 0; yr_values; yr_values(end)];

    zr.time = [0; 1; t; tf];
    zr.signals.values = [0; 0; zr_values; zr_values(end)];

    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0, 0);

end

% Armazenando qual experimento foi executado
simulacao.experimento = experimento;

end