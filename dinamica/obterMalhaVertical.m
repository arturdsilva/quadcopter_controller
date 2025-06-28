% dinâmica das malhas de movimento vertical

function dinamica = obterMalhaVertical(controlador, planta)

s = tf('s');
dinamica = (controlador.Ki/controlador.Kd) / ( s^2 + ...
    (controlador.Kp/controlador.Kd) * s + controlador.Ki/controlador.Kd);
end