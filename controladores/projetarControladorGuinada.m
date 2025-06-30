% Função para o projeto do controlador de Guinada
function controlador = projetarControladorGuinada(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kd = 7 * planta.Jz * xi * wn;
controlador.Kp = wn^2 * planta.Jz * (1 + 10 * xi^2);
controlador.Ki = 5 * planta.Jz * xi * wn^3;

end