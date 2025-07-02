% dinâmica das malhas de arfagem

function dinamica = obterMalhaArfagem(controlador, planta)

s = tf('s');
numerador = controlador.Kp / planta.J;
denominador = s^2 + (controlador.Kd*s)/planta.J + controlador.Kp / planta.J;
dinamica = numerador / denominador;
end