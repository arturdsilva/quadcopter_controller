% Função para o projeto do controlador de Guinada
function controlador = projetarControladorGuinada(requisitos, planta)

controlador.Kd = 7 * planta.Jz * requisitos.xi * requisitos.wn;
controlador.Kp = requisitos.wn^2 * planta.Jz * (1 + 10 * requisitos.xi^2);
controlador.Ki = 5 * planta.Jz * requisitos.xi * requisitos.wn^3;

end