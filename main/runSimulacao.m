% Código principal que define planta, requisitos, executa simulação e animação

root = fileparts(mfilename('fullpath'));
addpath(fullfile(root, '..', 'dinamica'));
addpath(fullfile(root, '..', 'modelos'));
addpath(fullfile(root, '..', 'controladores'));
addpath(fullfile(root, '..', 'simulacao'));
addpath(fullfile(root, '..', 'visualizacao'));

planta = obterPlantaMulticoptero();
requisitos = obterRequisitos();
controlador = projetarControladorMulticoptero(requisitos, planta);

experimento = 'a';

simulacao = simularExperimentoMulticoptero(controlador, planta, experimento);
fazerAnimacaoMulticoptero(simulacao, planta);