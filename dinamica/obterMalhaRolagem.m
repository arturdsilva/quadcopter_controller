% dinâmica das malhas de rolamento

function dinamica = obterMalhaRolagem(controlador, planta)

s = tf('s');
numerador = controlador.Ki / planta.J;
denominador = s^3 + (controlador.Kd/planta.J)*s^2 + (controlador.Kp*s)/planta.J + controlador.Ki / planta.J;
dinamica = numerador / denominador;
end
