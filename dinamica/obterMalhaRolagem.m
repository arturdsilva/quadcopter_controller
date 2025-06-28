% dinâmica das malhas de rolamento

function dinamica = obterMalhaRolagem(controlador, planta)

s = tf('s');
numerador = controlador.Kp * controlador.Kv/planta.J;
denominador = s^2 + (controlador.Kv/planta.J)*s + (controlador.Kp * controlador.Kv)/planta.J;
dinamica = numerador / denominador;
end
