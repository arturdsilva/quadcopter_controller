% Função para o projeto do controlador de Rolamento

function controlador = projetarControladorRolagem(requisitos, planta)

controlador.Kd = 7 * planta.J * requisitos.xi * requisitos.wn;
controlador.Kp = requisitos.wn^2 * planta.J * (1 + 10 * requisitos.xi^2);
controlador.Ki = 5 * planta.J * requisitos.xi * requisitos.wn^3;
end
