% dinâmica das malhas de movimento vertical
function dinamica = obterMalhaVertical(controlador, planta)

s = tf('s');
numerador = controlador.Ki / planta.m;
denominador = s^3 + (controlador.Kd/planta.m)*s^2 + (controlador.Kp*s)/planta.m + controlador.Ki / planta.m;
dinamica = numerador / denominador;

end