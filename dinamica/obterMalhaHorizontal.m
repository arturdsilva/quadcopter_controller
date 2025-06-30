% dinâmica das malhas de movimento horizontal

function dinamica = obterMalhaHorizontal(controlador, controladorTheta, planta)

s = tf('s');
dinamica = ((controlador.Kd*s^2 + controlador.Kp*s + controlador.Ki)/s) * (controladorTheta.Ki / (planta.J*(s^3 + (controladorTheta.Kd/planta.J)*s^2 + ...
    (controladorTheta.Kp/planta.J)*s + controladorTheta.Ki/planta.J))) * planta.g / ( ((controlador.Kd*s^2 + controlador.Kp*s + controlador.Ki)/s) * ...
    (controladorTheta.Ki / (planta.J*(s^3 + (controladorTheta.Kd/planta.J)*s^2 + (controladorTheta.Kp/planta.J)*s + controladorTheta.Ki/planta.J))) * planta.g + s^2 );


end