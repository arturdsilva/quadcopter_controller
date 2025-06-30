% Função para o projeto do controlador de Multicoptero

function controlador = projetarControladorMulticoptero(requisitos, planta)

controlador.theta = projetarControladorArfagem(requisitos.theta, planta);
controlador.phi = projetarControladorRolagem(requisitos.phi, planta);
controlador.psi = projetarControladorGuinada(requisitos.psi, planta);
controlador.x = projetarControladorHorizontalAnalitico(requisitos.x, planta);
controlador.y = projetarControladorHorizontalAnalitico(requisitos.y, planta);
controlador.z = projetarControladorVerticalBusca(requisitos.z, planta);

end