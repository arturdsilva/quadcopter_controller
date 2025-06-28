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
    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0);
elseif experimento == 'b'
     xr.time = [0; 1 - dt; 1; tf];
     xr.signals.values = [0; 0; 1; 1];
     yr.time = [0; 1 - dt; 1; tf];
     yr.signals.values = [0; 0; 1; 1];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0);
elseif experimento == 'c'
     xr.time = [0; 1 - dt; tf];
     xr.signals.values = [0; 0; 4];
     yr.time = [0; 1 - dt; tf];
     yr.signals.values = [0; 0; 4];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0);
elseif experimento == 'd'
     xr.time = [0; tf];
     xr.signals.values = [0; 0];
     yr.time = [0; tf];
     yr.signals.values = [0; 0];
     zr.time = [0; tf];
     zr.signals.values = [1; 1];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0.2, 0);
elseif experimento == 'e'
    xr.time = [0; 1 - dt; tf];
    xr.signals.values = [0; 0; 4];
    yr.time = [0; 1 - dt; tf];
    yr.signals.values = [0; 0; 4];
    zr.time = [0; tf];
    zr.signals.values = [1; 1];
    simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, -2);
 elseif experimento == 'f'
     tf = 10;
     t = (1+dt:dt:(tf-1))';
     xr.time = [0; 1; t; tf];
     xr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     yr.time = [0; 1; t; tf];
     yr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     zr.time = [0; 1; t; tf];
     zr.signals.values = [2; 2; sin(2 * 2 * pi * (t - 1) / (tf - 2)) + 2; 2];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0);
 elseif experimento == 'g'
     tf = 20;
     t = (1+dt:dt:(tf-1))';
     xr.time = [0; 1; t; tf];
     xr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     yr.time = [0; 1; t; tf];
     yr.signals.values = [0; 0; cos(3 * 2 * pi * (t - 1) / (tf - 2) + pi / 2); 0];
     zr.time = [0; 1; t; tf];
     zr.signals.values = [2; 2; sin(2 * 2 * pi * (t - 1) / (tf - 2)) + 2; 2];
     simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr, 0, 0);
end

% Armazenando qual experimento foi executado
simulacao.experimento = experimento;

end