% Função para o projeto do controlador de Arfagem

function controlador = projetarControladorArfagem(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kd = 2 * planta.J * xi * wn;
controlador.Kp = wn^2 * planta.J;
end