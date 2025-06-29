% Simulação do sistema Multicoptero

function simulacao = simularMulticoptero(controlador, planta, tf, xr, yr, zr,...
    carga, ventoX, ventoY)
controlador.m = planta.m;
controlador.g = planta.g;

% Configurando as variaveis usadas no Simulink
assignin('base', 'xr', xr);
assignin('base', 'yr', yr);
assignin('base', 'zr', zr);
assignin('base', 'x0', 0);
assignin('base', 'y0', 0);
assignin('base', 'z0', 0);
assignin('base', 'theta0', 0);
assignin('base', 'phi0', 0);
assignin('base', 'psi0', 0);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);
assignin('base', 'carga', carga);
assignin('base', 'ventoX', ventoX);
assignin('base', 'ventoY', ventoY);

% Carregando o Simulink
load_system('multicoptero');

% Configurando o tempo final de simulacao
set_param('multicoptero', 'StopTime', sprintf('%g', tf));

% Rodando a simulacao
simulacao = sim('multicoptero');

end