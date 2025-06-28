% Código principal que define planta, requisitos, executa simulação e animação

addpath('dinamica');
addpath('modelos');
addpath('controladores');
addpath('simulacao');
addpath('visualizacao');

planta = obterPlantaMulticoptero();
requisitos = obterRequisitos();
controlador = projetarControladorMulticoptero(requisitos, planta);

experimento = 'e';

simulacao = simularExperimentoMulticoptero(controlador, planta, experimento);
fazerAnimacaoMulticoptero(simulacao, planta);