% Função para o projeto do controlador de Multicoptero

function controlador = projetarControladorMulticoptero(requisitos, planta)

controlador.theta = projetarControladorArfagem(requisitos.theta, planta);
controlador.phi = projetarControladorRolagem(requisitos.phi, planta);
controlador.psi = projetarControladorGuinada(requisitos.psi, planta);
controlador.x = projetarControladorHorizontalBusca(requisitos.x, requisitos.theta, planta);
controlador.y = projetarControladorHorizontalBusca(requisitos.y, requisitos.phi, planta);
controlador.z = projetarControladorVerticalBusca(requisitos.z, planta);

end