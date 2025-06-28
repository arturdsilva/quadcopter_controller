% dinâmica das malhas de arfagem, rolagem, movimento horizontal em x e em y
% e movimento vertical

function dinamica = obterMalhaArfagem(controlador, planta)

s = tf('s');
numerador = controlador.Kp * controlador.Kv/planta.J;
denominador = s^2 + (controlador.Kv/planta.J)*s + (controlador.Kp * controlador.Kv)/planta.J;
dinamica = numerador / denominador;
end

function dinamica = obterMalhaRolagem(controlador, planta)

s = tf('s');
numerador = controlador.Kp * controlador.Kv/planta.J;
denominador = s^2 + (controlador.Kv/planta.J)*s + (controlador.Kp * controlador.Kv)/planta.J;
dinamica = numerador / denominador;
end


function dinamica = obterMalhaHorizontal(controladorX, controladorTheta, planta)

s = tf('s');
numerador = planta.g * controladorX.Ki * controladorTheta.Kp * controladorTheta.Kv;
denominador = planta.J * s^5 + controladorTheta.Kv * s^4 + ...
    controladorTheta.Kp * controladorTheta.Kv * s^3 + ...
    planta.g * controladorTheta.Kp * controladorTheta.Kv * ...
    controladorX.Kd * s^2 + ...
    planta.g * controladorTheta.Kp * controladorTheta.Kv * controladorX.Kp * s ...
    + planta.g * controladorTheta.Kp * controladorTheta.Kv * controladorX.Ki;
dinamica = numerador / denominador;

end


function dinamica = obterMalhaVertical(controlador, planta)

s = tf('s');
dinamica = (controlador.Ki/controlador.Kd) / ( s^2 + ...
    (controlador.Kp/controlador.Kd) * s + controlador.Ki/controlador.Kd);
end
