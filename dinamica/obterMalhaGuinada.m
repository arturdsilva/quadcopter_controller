% dinâmica das malhas de guinada
function dinamica = obterMalhaGuinada(controlador, planta)

s = tf('s');
numerador = controlador.Ki / planta.Jz;
denominador = s^3 + (controlador.Kd/planta.Jz)*s^2 + (controlador.Kp*s)/planta.Jz + controlador.Ki / planta.Jz;
dinamica = numerador / denominador;

end