% Código principal que define planta, requisitos, executa simulação e animação
function executarSimulacao(idDoExperimento)

root = fileparts(mfilename('fullpath'));
addpath(fullfile(root, '..', 'dinamica'));
addpath(fullfile(root, '..', 'modelos'));
addpath(fullfile(root, '..', 'controladores'));
addpath(fullfile(root, '..', 'simulacao'));
addpath(fullfile(root, '..', 'visualizacao'));

planta = obterPlantaMulticoptero();
requisitos = obterRequisitos();
controlador = projetarControladorMulticoptero(requisitos, planta);

switch idDoExperimento
    case {'a','b','c','d','e','f','g','h'}
        experimento = idDoExperimento;
    otherwise
        error('Experimento inválido. Use uma letra de a a h.');
end

simulacao = simularExperimentoMulticoptero(controlador, planta, experimento);
fazerAnimacaoMulticoptero(simulacao, planta);
tracarGraficos(simulacao);

end