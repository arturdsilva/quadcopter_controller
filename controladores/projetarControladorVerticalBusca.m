% Função para o projeto do controlador de Vertical Busca

function controlador = projetarControladorVerticalBusca(requisitos, planta)
root = fileparts(mfilename('fullpath'));
addpath(fullfile(root, '..', 'dinamica'));

% Numero de valores de cada parametro usados na grade
N = 20;

% Gerando os valores na grade
trs = linspace(0.8 * requisitos.tr, 1.2 * requisitos.tr, N);
Mps = linspace(0.8 * requisitos.Mp, 1.2 * requisitos.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

JMin = 2;
for i = 1:N
    for j = 1:N
        requisitos_prov.tr = trs(i);
        requisitos_prov.Mp = Mps(j);
        controlador_proj = projetarControladorVerticalAnalitico(requisitos_prov, planta);
        dinamica = obterMalhaVertical(controlador_proj , planta);
        info = stepinfo(dinamica, 'RiseTimeLimits', [0, 1]);
        J = abs((info.RiseTime - requisitos.tr) / requisitos.tr) + ...
                  abs((info.Overshoot/100 - requisitos.Mp) / requisitos.Mp);
        if JMin > J
            JMin = J;
            controladorMin = controlador_proj;
        end
    end
end

controlador.Kd = controladorMin.Kd;
controlador.Kp = controladorMin.Kp;
controlador.Ki = controladorMin.Ki;
end