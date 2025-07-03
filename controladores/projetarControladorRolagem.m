% Função para o projeto do controlador de Rolamento
function controlador = projetarControladorRolagem(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kd = 7 * planta.J * xi * wn;
controlador.Kp = wn^2 * planta.J * (1 + 10 * xi^2);
controlador.Ki = 5 * planta.J * xi * wn^3;

end
