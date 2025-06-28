% Função para o projeto do controlador de Rolamento

function controlador = projetarControladorRolagem(requisitos, planta)

xi = sqrt((log(requisitos.Mp))^2 / (pi^2 + (log(requisitos.Mp))^2));
wn = (pi - acos(xi)) / (requisitos.tr * sqrt(1 - xi^2));
controlador.Kv = 2 * wn * xi * planta.J;
controlador.Kp = wn / (2 * xi);
end
