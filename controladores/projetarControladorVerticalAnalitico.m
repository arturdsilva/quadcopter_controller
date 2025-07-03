% Função para o projeto do controlador de Vertical Analitico
function controlador = projetarControladorVerticalAnalitico(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kd = 7 * planta.m * xi * wn;
controlador.Kp = wn^2 * planta.m * (1 + 10 * xi^2);
controlador.Ki = 5 * planta.m * xi * wn^3;

end