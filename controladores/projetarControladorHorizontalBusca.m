% Função para o projeto do controlador de Horizontal Busca

function controlador = projetarControladorHorizontalBusca(requisitosX,...
    requisitosTheta, planta)
root = fileparts(mfilename('fullpath'));
addpath(fullfile(root, '..', 'dinamica'));
% Numero de valores de cada parametro usados na grade
N = 20;

% Gerando os valores na grade
trs = linspace(0.8 * requisitosX.tr, 1.2 * requisitosX.tr, N);
Mps = linspace(0.8 * requisitosX.Mp, 1.2 * requisitosX.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

JMin = inf;

for i = 1:N
    for j = 1:N
        requisitosProv.tr = trs(i);
        requisitosProv.Mp = Mps(j);
        
        controladorProjX = projetarControladorHorizontalAnalitico(requisitosProv, planta);
        controladorTheta = projetarControladorArfagem(requisitosTheta, planta);
        dinamicaX = obterMalhaHorizontal(controladorProjX, controladorTheta , planta);
        infoX = stepinfo(dinamicaX, 'RiseTimeLimits', [0, 1]);

        J = abs((infoX.RiseTime - requisitosX.tr) / requisitosX.tr) + ...
                  abs((infoX.Overshoot/100 - requisitosX.Mp) / requisitosX.Mp);
        if JMin > J
            JMin = J;
            controladorMin = controladorProjX;
        end
    end
end

controlador.Kd = controladorMin.Kd;
controlador.Kp = controladorMin.Kp;
controlador.Ki = controladorMin.Ki;
end