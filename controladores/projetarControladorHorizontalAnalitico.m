% Função para o projeto do controlador de Horizontal Analitico
function controlador = projetarControladorHorizontalAnalitico(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kd = 7 * xi * wn / planta.g;
controlador.Kp = wn^2 * (1 + 10 * xi^2) / planta.g;
controlador.Ki = 5 * xi * wn^3 / planta.g;

end