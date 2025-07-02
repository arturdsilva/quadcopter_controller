% dinâmica das malhas de guinada

function dinamica = obterMalhaGuinada(controlador, planta)

s = tf('s');
numerador = controlador.Kp / planta.Jz;
denominador = s^2 + (controlador.Kd*s)/planta.Jz + controlador.Kp / planta.Jz;
dinamica = numerador / denominador;
end